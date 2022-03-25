/**
 * @file ATmega328P.hpp
 * @author Mohit Singh (mohitsingh5.ms@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2022-03-24
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef ATMEGA328P_HPP
    #define ATMEGA328P_HPP

    #ifndef F_CPU
            #define F_CPU 16000000UL //define the CPU Clock Frequency=16MHz
    #endif

    extern "C" //function prototypes external to C++
    {
        //extern void initDDR();
        //void initDDR();
        void setPORT(char);
    }
    
    namespace ATmega328P
    {
        // #include <avr/io.h>     //contains all I/O register macros
        #include <util/delay.h>     //contains software delay
        // #define port(p) (p == PB ? PORTB : (p == PC ? PORTC : PORTD))
        // #define ddr(p) (p == PB ? DDRB : (p == PC ? DDRC : DDRD))

        // typedef enum
        // {
        //     PB,
        //     PC,
        //     PD
        // } port_id_t;

        // template <port_id_t p, unsigned char bit>
        // struct PinOut
        // {
        //     PinOut()
        //     {
        //         ddr(p) |= (1 << bit);
        //     }
        //     void On()
        //     {
        //         port(p) |= (1 << bit);
        //     }
        //     void Off()
        //     {
        //         port(p) &= ~(1 << bit);
        //     }
        // };

        class GPIO
        {
            public:
                // GPIO();
                // ~GPIO();
                void setGPIO(char);
                // void GPIO_Delay(int);
        };
    }
    
#endif
