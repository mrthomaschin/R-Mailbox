#ifndef LOADCELL_H
#define LOADCELL_H

#include <stdbool.h>
#include <stdint.h>
#include <avr/io.h>
#include <util/delay.h>
#include <stdlib.h>

#define SCK_PORT PORTC	                        
#define SCK_DDR DDRC                           
#define SCK_PIN PC7         

#define SCK_On SCK_PORT |= (1 << SCK_PIN);
#define SCK_Off SCK_PORT &= ~(1 << SCK_PIN);

#define DT_PORT PORTC                     
#define DT_DDR  DDRC                         
#define DT_INPUT PINC             
#define DT_PIN PC6

#define DT_Read (DT_INPUT & ( 1 << DT_PIN))
#define DT_On DT_PORT |= (1 << DT_PIN)
#define DT_Off DT_PORT &= ~(1 << DT_PIN)

void initialize_scale();

bool scale_isReady();

long readScale();

long getAverage(long reads);

#endif