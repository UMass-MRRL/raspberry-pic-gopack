/*******************************************************
Name: serial.c
Date: 5/9/2016
Authors: Qiandong Nie, Mark Price
Comments: Serial communication functions (SPI, UART)
*******************************************************/
#include "p33FJ64MC204.h" 	//Include p33FJ64MC202 header file
#include <math.h>			//Include math libary
#include "support.h"		//Include Defitions and function prototypes
#include "stdio.h"
#define FCY 40000000UL
#include "libpic30.h"		//Include Defitions and function prototypes
#include <stdlib.h>

extern int wait_flag;		// signals end of 1 millisecond sample period
extern int spi1_flag;		//Flag for SPI transmission
extern int spi2_flag;
extern int hallErrorFlag;

extern int enc1pos;
extern unsigned int pwm1_duty_16bit;
extern int pwm1_duty;

extern unsigned int TxBufferA[RASPI_BUF_SIZE];
extern unsigned int TxBufferB[RASPI_BUF_SIZE];
extern unsigned int RxBufferA[RASPI_BUF_SIZE];
extern unsigned int RxBufferB[RASPI_BUF_SIZE];

extern unsigned int aInBuff[MAX_NUM_ADC][SAMP_BUFF_SIZE];
extern unsigned int dataIn[RASPI_BUF_SIZE];
extern unsigned int dataOut[RASPI_BUF_SIZE];

//////////////////////////////////////////////////////////////////////////////
// SPI functions (RasPi - PIC)
//////////////////////////////////////////////////////////////////////////////

/*
 * Used to send constructed SPI messages
 *
 * Inputs:
 *      short SPItx_data - the value of the data to be sent
 */
short sendSpiMsgSlave(short SpiTxData)
{
    short SpiRxData = SPI1BUF;
    spi1_flag = 0;
    SPI1BUF = SpiTxData;
    while(spi1_flag<1);		//use Spi flag to indicate buffer is full
    return SpiRxData;
}

short sendSpiMsgMaster(short SpiTxData)
{
    spi1_flag = 0;
    SPI1BUF = SpiTxData;
    while(spi1_flag<1);		//use Spi flag to indicate buffer is full
    return SPI1BUF;
}

int msgMarker;
short enc1flag;
short oc1flag;
short rasPiErrFlag=0;

void TxData(unsigned int *TxBuff){

	int n;
    
    //spi1_flag = 0;
    int inputSize = sizeof(TxBufferA)/sizeof(TxBufferA[0]);

    
    for (n = 0; n < inputSize; n++){
        TxBuff[n] = dataOut[n];
    }
    
//    TxBuff[3] = 0x01;
//    TxBuff[0] = 0x00;
//    TxBuff[1] = 0x02;
//    TxBuff[2] = 0x33;
    
}

void RxData(unsigned int *RxBuff){

	int n;
    int inputSize = sizeof(RxBufferA)/sizeof(RxBufferA[0]);
    
    for (n = 0; n < inputSize; n++){
        dataIn[n] = RxBuff[n];
//        dataOut[n] = dataIn[n];
    }

}

extern long int absEnc1pos;
void processRXdata(void){
    //MOT_D1 = 1;
    
    int totalBytesRead = 0;
    int msgEnd = 0;
    int msgLength = 0;
    int anChannel = 0;
    int n;

    while (!msgEnd){
        msgMarker = dataIn[totalBytesRead];
        dataOut[totalBytesRead] = msgMarker;
        if(msgMarker == 1){
            getEnc1Pos();    
            dataOut[totalBytesRead+1] = (absEnc1pos & 0x000000FF);
            dataOut[totalBytesRead+2] = (absEnc1pos & 0x0000FF00) >> 8;
            dataOut[totalBytesRead+3] = (absEnc1pos & 0x00FF0000) >> 16;
            dataOut[totalBytesRead+4] = (absEnc1pos & 0xFF000000) >> 24;
            msgLength = 5;
        }
        else if(msgMarker == 2){
            pwm1_duty_16bit = ((dataIn[totalBytesRead+1]) | (dataIn[totalBytesRead+2] << 8)) & 0xffff;
            pwm1_duty = pwm1_duty_16bit*BIT16_TO_MAX1000;
            dataOut[totalBytesRead + 1] = dataIn[totalBytesRead + 1];
            dataOut[totalBytesRead + 2] = dataIn[totalBytesRead + 2];
            msgLength = 3;
        }
        else if (msgMarker>>4 == 1){
            anChannel = msgMarker - 16;
            for (n = 0; n<SAMP_BUFF_SIZE; n++){
                dataOut[totalBytesRead + 2*n + 1] = (aInBuff[anChannel][n] & 0x00FF);
                dataOut[totalBytesRead + 2*n + 2] = (aInBuff[anChannel][n] & 0xFF00) >> 8;
            }
            msgLength = 9;
        }
        else if(msgMarker = 0xF0){
            msgEnd = 1;
            msgLength = 1;
        }
        else{
            rasPiErrFlag = 1;
            dataOut[totalBytesRead + 1] = 0xFF;
            dataOut[totalBytesRead + 2] = 0xFF;
            msgLength = 3;
        }
        
        totalBytesRead += msgLength;
    }
    
    
//    int n;
//    int m;
//    
//    for (n = 0; n < RASPI_BUF_SIZE; n = n+3){
//        for(m = 0; m < 3; m++){
//            if(m == 0){         //low byte
//                msg_marker = dataIn[n];
//                dataOut[n] = msg_marker;
//                switch(msg_marker){
//                    case 1:
//                        getEnc1Pos();                
//                        break;
//                    case 2:
//                        pwm1_duty_16bit = ((dataIn[n+1]) | (dataIn[n+2] << 8)) & 0xffff;
//                        pwm1_duty = pwm1_duty_16bit*BIT16_TO_MAX1000;
//                        break;
//                    case 0x1001:
//                        
//                        
//                    default:
//                        rasPiErrFlag = 1;
//                        break;
//                }     
//            }
//            else if (m == 1){
//                switch(msg_marker){
//                    case 1:
//                        dataOut[n+m] = (enc1pos & 0x00FF);
//                        break;
//                    case 2:
//                        dataOut[n+m] = dataIn[n+m];     //echo back commanded duty cycle
//                        break;
//                    default:
//                        rasPiErrFlag = 1;
//                        dataOut[n+m] = 0xFF;
//                        break;
//                }             
//            }
//            else{               // high byte
//                switch(msg_marker){
//                    case 1:
//                        dataOut[n+m] = (enc1pos & 0xFF00) >> 8;
//                        break;
//                    case 2:
//                        dataOut[n+m] = dataIn[n+m];     //echo back commanded duty cycle
//                        break;
//                    default:
//                        rasPiErrFlag = 1;
//                        dataOut[n+m] = 0xFF;
//                        break;
//                }             
//            }
//
//        }
//    }
}

/*
void receiveSPImsg(void){
	dataIn =  SPI1BUF;
	SPI1BUF = dataIn;
}
*/
