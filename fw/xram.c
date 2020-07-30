#include <reg51.h>

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

unsigned char __xdata buffer[2048];

/*---------------------------------------------------------------------------*/

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

/*---------------------------------------------------------------------------*/

void main() {
    
    unsigned short i;
    
    buffer[0] = 1;
    for(i=1; i<2048; i++) {
        
        buffer[i] = buffer[i - 1] + 1;
    }
    P0 = buffer[2047];
    quit();
}
