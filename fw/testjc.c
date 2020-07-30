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

        MOV     P0, #0x80
        SETB    C
        JC      T1_PASSED
        LJMP    FAIL

    T1_PASSED:
        MOV     P0, #0x81
        CLR     C
        JNC     T2_PASSED
        LJMP    FAIL
    T2_PASSED:
        MOV     P0, #0x82
        JC      FAIL

        MOV     P0, #0x83
        SETB    C
        JNC     FAIL

    PASSED:
        MOV     P0, #0x11
        SJMP    DONE

    FAIL:
        MOV     P0, #0x00
    DONE:
	__endasm;

    quit();
}
