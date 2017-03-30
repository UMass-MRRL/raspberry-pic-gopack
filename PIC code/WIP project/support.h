/*******************************************************
Name: support.h
Date: 03/30/2017
Authors: Mark Price
Comments:  Support file for definitions and function prototypes
*******************************************************/

#define PI 3.1415926
#define BIT16_TO_MAX1000 0.01526
#define BIT12_TO_MAX1000 0.2442
#define PERIOD 1000
#define RGB_R _LATB4                // RGB LED red
#define RGB_G _LATA4                // RGB LED green
#define RGB_B _LATA9                // RGB LED blue
#define LED_Y _LATA8                // Yellow status LED
#define CS0 _RA10                   // SPI chip select 0
#define CS1 _RA7                    // SPI chip select 1
#define MOT_ENABLE _RA2                 // Motor Enable
//#define MOT_D2 _RA3
#define NUM_ADC 8                   // # of ADC pins in use
#define MAX_NUM_ADC 9               // Max # of ADC pins in use
#define SAMP_BUFF_SIZE 4            // # of samples to hold for each AN pin
#define ENC1_RES 2000               // # pulses x 4 (quadrature)
#define ENC2_RES 2048
#define RASPI_BUF_SIZE 54           // Bytes in DMA buffer for SPI communication with Raspberry Pi

// Initialization Functions
void init_clock(void);
void init_samptime(void);
void init_pins(void);
void init_spi1(void);
void init_spi1_buff(void);
void init_dma0_spi1_tx(void);
void init_dma1_spi1_rx(void);
void init_pwm1(void);
void init_pwm2(void);
void init_spi2(void);
void init_encoder1(void);
void init_encoder2(void);
void initTmr3(void);
void init_ADC(void);
void initDMA_ADC(void);
void init_i2c(void);

// Utility Functions
int fsign(float num);
void delay(void);

// SPI Functions
void TxData(unsigned int *TxBuff);
void RxData(unsigned int *RxBuff);
void processRXdata(void);

// Encoder Functions
float getEnc1PosDeg(void);
float getEnc2PosDeg(void);
void getEnc1Pos(void);

// ADC Functions
void ProcessADCSamples(int *AdcBuffer[MAX_NUM_ADC+1][SAMP_BUFF_SIZE]);

//Motor Functions
void setMotorPercent(float p);





