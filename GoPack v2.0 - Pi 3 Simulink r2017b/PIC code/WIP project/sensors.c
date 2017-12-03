/*******************************************************
Name: sensors.c
Date: 03/30/2017
Authors: Mark Price
Comments: Functions supporting sensors and data acquisition
*******************************************************/

#include "p33FJ64MC204.h" 	//Include p33FJ64MC202 header file
#include <math.h>			//Include math libary
#include "support.h" 		//Include Defitions and function prototypes
#include <string.h>
#include <stdlib.h>
#include "libpic30.h"//FCY must be defined before libpic30.h is included

extern unsigned int aInBuff[MAX_NUM_ADC][SAMP_BUFF_SIZE];
//extern unsigned int ain1Buff[SAMP_BUFF_SIZE];
//extern unsigned int ain2Buff[SAMP_BUFF_SIZE];
//extern unsigned int ain3Buff[SAMP_BUFF_SIZE];
//extern unsigned int ain4Buff[SAMP_BUFF_SIZE];
//extern unsigned int ain5Buff[SAMP_BUFF_SIZE];
//extern unsigned int ain6Buff[SAMP_BUFF_SIZE];
//extern unsigned int ain7Buff[SAMP_BUFF_SIZE];
//extern unsigned int ain8Buff[SAMP_BUFF_SIZE];
extern int sampleCounter;

////////////////////////////////////////////////////////
// ENCODER FUNCTIONS
////////////////////////////////////////////////////////

//int min_tcount = 100;
float getEnc1PosDeg(void){
    float tcount = POS1CNT; // 360degrees = 2048 counts
    float position = tcount*360/(ENC1_RES-1);
    
//    if(tcount < min_tcount){
//        min_tcount = tcount;
//    }
    return position;
}

int oldEnc1pos = 0;
long int temp;
long int enc1pos = 0;
long int absEnc1pos = 0;
long int enc1revs = 0;
void getEnc1Pos(void){
    enc1pos = POS1CNT; // 360degrees = 2048 counts
//    int diff = enc1pos - oldEnc1pos;
//    if(abs(diff) > 1000){ 
//        enc1revs = enc1revs - fsign(diff);
//    }
    temp = (ENC1_RES*enc1revs);
//    if (temp < 0)
//        temp = 0;
    absEnc1pos = enc1pos + temp;
    oldEnc1pos = enc1pos;
    
}

float getEnc2PosDeg(void){
    float tcount = POS2CNT; // 360degrees = 4096 counts
    float position = tcount*360/(ENC2_RES-1);
    return position;
}


//////////////////////////////////////////////////////////
//// ADC FUNCTIONS
//////////////////////////////////////////////////////////

void ProcessADCSamples(int * AdcBuffer[MAX_NUM_ADC+1][SAMP_BUFF_SIZE])
{
//   MOT_D1 = 1;
   int n;
   
   for(n = 0; n < MAX_NUM_ADC; n++){
          aInBuff[n][sampleCounter] = AdcBuffer[n][sampleCounter];
   }

//    ain0Buff[sampleCounter] = AdcBuffer[0][sampleCounter];
//    ain1Buff[sampleCounter] = AdcBuffer[1][sampleCounter];
//    ain2Buff[sampleCounter] = AdcBuffer[2][sampleCounter];
//    ain3Buff[sampleCounter] = AdcBuffer[3][sampleCounter];
//    ain4Buff[sampleCounter] = AdcBuffer[4][sampleCounter];
//    ain5Buff[sampleCounter] = AdcBuffer[5][sampleCounter];
//    ain6Buff[sampleCounter] = AdcBuffer[6][sampleCounter];
//    ain7Buff[sampleCounter] = AdcBuffer[7][sampleCounter];     
//    ain8Buff[sampleCounter] = AdcBuffer[8][sampleCounter];
         
//    scanCounter++;
//	if(scanCounter==2){
//		scanCounter=0;
//	}

    sampleCounter++;
    
	if(sampleCounter==SAMP_BUFF_SIZE){
		sampleCounter=0;
    }

    IFS0bits.AD1IF = 0;

//    MOT_D1 = 0;
}

//int read_ADC(int scanCounter)
//{
//
//
//
//}
