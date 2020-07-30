#include <8051.h>

// Program tests all instructions except:
// ACALL, LCALL, MOVX(1-4), NOP, RET,and RETI


void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}


void main() {

	__asm;

        MOV     P0, #0x10
        AJMP    L1
        LJMP    FAIL
    L1:
        MOV     P0, #0x11
        NOP
        AJMP    L2
        LJMP    FAIL

    L2:
        MOV     P0, #0x12
        NOP
        NOP
        AJMP    L3
        LJMP    FAIL

    L3:
        MOV     P0, #0x13
        NOP
        NOP
        NOP
        AJMP    L4
        LJMP    FAIL

    L4:
        MOV     P0, #0x14
        NOP
        NOP
        NOP
        NOP
        AJMP    L5
        LJMP    FAIL

    L5:
        MOV     P0, #0x15
        NOP
        NOP
        NOP
        NOP
        NOP
        AJMP    L6
        LJMP    FAIL

    L6:
        MOV     P0, #0x16
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        AJMP    L7
        LJMP    FAIL

    L7:
        MOV     P0, #0x17
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        AJMP    L8
        LJMP    FAIL

    L8:
        MOV     P0, #0x18
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        AJMP    L9
        LJMP    FAIL

    L9:
        MOV P0, #0x19
    FAIL:
        MOV P0, #0xFF
	__endasm;

    quit();
}
