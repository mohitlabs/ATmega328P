/**
 * @file main.cpp
 * @author Mohit Singh (mohitsingh5.ms@gmail.com)
 * @brief Main Driver (main entry point of the application)
 * @version 0.1
 * @date 2022-01-28
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#include "ATmega328P.hpp"
#include <stdlib.h>

int main(void)
{
    ATmega328P::GPIO* g = (ATmega328P::GPIO*)malloc(sizeof(ATmega328P::GPIO));
    g->setGPIO(0x01);
    //PinOut<PD,4> LED;

    // while(true) //infinite loop
    // {
    //   //LED.On();       //turn the led on
    //   g->setGPIO(0x01);
    //   g->GPIO_Delay(1000); //wait for a second
    //   g->setGPIO(0x00);
    //   //LED.Off();      //turn the led off
    //   g->GPIO_Delay(1000); //wait for a second
    // }
    return 0;
}
