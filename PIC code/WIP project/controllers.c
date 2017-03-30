/*******************************************************
Name: controllers.c
Date: 5/9/2016
Authors: Mark Price
Comments: Low to high level controllers for the haptic mouse
*******************************************************/

#include "p33FJ64MC204.h" 	//Include p33FJ64MC202 header file
#include <math.h>			//Include math libary
#include "support.h" 		//Include Defitions and function prototypes
#include <string.h>
#include <stdlib.h>
#include "libpic30.h"//FCY must be defined before libpic30.h is included

// Include global variables

extern float p;
extern int pwm1_duty;

/*
 * PWM Motor output controller
 * Sets the motor power to somewhere between -100% and +100%
 * Requires MOT_D1 and MOT_D2 to be the pins that are plugged into the h-bridge
 *  along with the pin that is generating the PWM wave
 *
 * Inputs:
 *      int V - the desired positive or negative percentage of power for the motor
 */
void setMotorPercent(float V)   // -10000<p<10000
{
	/*if (V < 30 && V > 0){ //Account for static friction dead zone
		V = 30;
	}
	if (V > -30 && V < 0){
		V = -30;
	}
	*/
//    p = V*(PERIOD/100)*-1.0; // PERIOD/100%
//    //p = -PERIOD*V/100;
//    if (p < 0)
//    {
//         if (p < -PERIOD) {
//             p = -PERIOD+1; // do not exceed 100% Duty
//         }
//         pwm_duty = -p; // convert sign and change direction
//         MOT_D1=1;delay();
//         MOT_D2=0;delay();
//    }
//    else {
//         if (p > PERIOD) p = PERIOD-1; // do not exceed 100% Duty
//         pwm_duty = p; // output duty cyle
//         MOT_D1=0;delay();
//         MOT_D2=1;delay();
//    }

}