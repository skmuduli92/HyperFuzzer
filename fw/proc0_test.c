#include <reg51.h>

/*
 * Dual Core Program Test for proc0
 *
 * This program is meant to be loaded into proc0 while proc1_test is loaded
 * into proc1.
 *
 * Written by Samuel Miller 
 * 
 */


/*---------------------------------------------------------------------------*/

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

/*---------------------------------------------------------------------------*/

void main() {
    __xdata __at(0x0800) unsigned char xram_data[256];

    __asm
    NOP
    __endasm;

    // wait for proc1 to finish
    while (xram_data[0] != 0x01);

    // should read 0x05 (written by proc1)
    P0 = xram_data[2];

    // try writing to a location and then let proc1 take over again
    xram_data[3] = 0x08;
    xram_data[1] = 0x01;

    quit();
}