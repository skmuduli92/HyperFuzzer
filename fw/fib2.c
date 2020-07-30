/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

#include <reg51.h>

/*---------------------------------------------------------------------------*/

void fib(unsigned char* buf, unsigned char n) {
    
    char i;
    
    buf[0] = 1;
    buf[1] = 1;
    for(i=2; i<n; i++) {
        
        buf[i] = buf[i-1] + buf[i-2];
    }
}

/*---------------------------------------------------------------------------*/

void print(unsigned char* buf, unsigned char n) {
    
    char i;
    
    for(i=0; i<n; i++) {
        
        P0 = buf[i];
    }
}

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

/*---------------------------------------------------------------------------*/

void main() {
    
    unsigned char buf[10];
    
    fib(buf, 10);
    print(buf, 10);
    quit();
}
