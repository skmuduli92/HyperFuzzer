#include <reg51.h>

/*
 * Dual Core Program Test for proc1
 *
 * This program is meant to be loaded into proc1 while proc0_test is loaded
 * into proc0.
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
    __xdata __at(0xFF80) unsigned char pt_wren[32];
    __xdata __at(0xFFA0) unsigned char pt_rden[32];
    __xdata __at(0x0800) unsigned char xram_data[256];    

    // enable writing to and reading from page
    pt_wren[1] = 0x01;
    xram_data[0] = 0x00; // make sure xram_data[0] gets defined
    pt_rden[1] = 0x01;

    // try writing to a location then let proc0 take over
    xram_data[2] = 0x05;
    xram_data[0] = 0x01;
 
    // wait for proc0 to finish
    __asm
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    __endasm;
    
    // should read 0x08 (written by proc0)
    P0 = xram_data[3];

    quit();
}