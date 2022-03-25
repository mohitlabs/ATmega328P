;------------------------------------------------
; File: GPIO.S
; Author: Mohit Singh (mohitsingh5.ms@gmail.com)
; Brief: 
; Version: 0.1
; Date: 2022-01-28
;
; Copyright: Copyright (c) 2022
;------------------------------------------------

#ifndef __SFR_OFFSET
        #define __SFR_OFFSET 0x00
#endif
#include <avr/io.h>                 ;contains all I/O register macros

.global initDDR
.global setPORT

initDDR:
    SBI     DDRD,0x04   ;set pin PD4 as output
    RET

setPORT:
    CPI     R24,0x00    ;value passed by caller in R24 compared with 0
    BREQ    clearPORT   ;jump (branch) if equal to subroutine clearPORT
    SBI     PORTD,4     ;set PD4 high
    RET

clearPORT:
    CBI     PORTD,4     ;set PD4 low
    RET

