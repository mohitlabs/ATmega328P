/**
 * @file ATmega328P.cpp
 * @author Mohit Singh (mohitsingh5.ms@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2022-03-24
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#include "ATmega328P.hpp"

// ATmega328P::GPIO::GPIO()
// {
//     initDDR();
// }

// ATmega328P::GPIO::~GPIO(){}

void ATmega328P::GPIO::setGPIO(char b)
{
    setPORT(b);
}

// void ATmega328P::GPIO::GPIO_Delay(int d)
// {
//     _delay_ms(d);
// }
