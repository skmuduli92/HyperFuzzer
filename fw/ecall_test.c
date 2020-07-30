#include <reg51.h>

/*
 * Test for ECALL instruction.
 *
 * Written by Pramod Subramanyan
 */

/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

/*---------------------------------------------------------------------------*/

void main() {
    __asm
    MOV     R0, #0
    MOV     0x8F, #0x00
    MOV     0x8E, #0x9A

loop:
// this is ecall
    .db 0xA5
    .db 0x00
    .db 0x00
// end of ecall
    MOV     A, R0
    SUBB    A, #5
    JZ      out
    SJMP    loop
// this is the target of the ECALL
    INC     R0
    RETI
out:
    MOV P0, R0
    __endasm;

    quit();
}

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

