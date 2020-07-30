#include <reg51.h>

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

__xdata __at(0xFF00) unsigned char aes_reg_start;
__xdata __at(0xFF01) unsigned char aes_reg_state;
__xdata __at(0xFF02) unsigned int aes_reg_addr;
__xdata __at(0xFF04) unsigned int aes_reg_len;
__xdata __at(0xFF10) unsigned char aes_reg_ctr[16];
__xdata __at(0xFF20) unsigned char aes_reg_key0[16];
__xdata __at(0xFF30) unsigned char aes_reg_key1[16];
__xdata __at(0xE000) unsigned char data[16];

/*---------------------------------------------------------------------------*/

void main() {
    
    __asm;

    MOV A, #9
    MOV B, #3
    CLR C
    SUBB A, B
    MOV P0, A

    MOV A, #9
    MOV B, #3
    SETB C
    SUBB A, B
    MOV P0, A

	__endasm;

    // finish.
    quit();
}
