

/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
# ifndef MATLAB_MEX_FILE
#include <math.h>
# endif
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 43
#define y_width 1
/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
void SPI_bytes_to_outputs_Outputs_wrapper(const uint8_T *read,
			real_T *dutyCycle,
			int16_T *enc1count,
			uint16_T *analog0,
			uint16_T *analog1,
			uint16_T *analog2,
			uint16_T *analog6,
			const real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] == 1)
{
    #ifndef MATLAB_MEX_FILE

        int n;
        int m;
        int msgMarker;
        uint16_T intDutyCycle;
        int readSize;
        
        int numMsgs = 7;
        int msgStartInd = 0;
        
        readSize = sizeof(read)/sizeof(read[0]);
        
        for(n=0; n < numMsgs; n++){
            msgMarker = read[msgStartInd];
            if (msgMarker == 1){
                enc1count[0] = read[msgStartInd+1] + (read[msgStartInd+2] << 8);
                msgStartInd += 3;
            }
            else if (msgMarker == 2){
                intDutyCycle = read[msgStartInd+1] + (read[msgStartInd+2] << 8);
                msgStartInd += 3;
            }
            else if (msgMarker == 0x10){
                for(m = 0; m<4; m++){
                    analog0[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0x11){
                for(m = 0; m<4; m++){
                    analog1[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0x12){
                for(m = 0; m<4; m++){
                    analog2[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0x16){
                for(m = 0; m<4; m++){
                    analog6[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0xF0){
                msgStartInd = 0;
            }
        }
        
        
        //intDutyCycleOut[0] = intDutyCycle;
        dutyCycle[0] = (float)intDutyCycle*0.001526;
        
    #endif
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
  * Updates function
  *
  */
void SPI_bytes_to_outputs_Update_wrapper(const uint8_T *read,
			const real_T *dutyCycle,
			const int16_T *enc1count,
			const uint16_T *analog0,
			const uint16_T *analog1,
			const uint16_T *analog2,
			const uint16_T *analog6,
			real_T *xD)
{
  /* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] != 1){
    
    xD[0] = 1;           
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
