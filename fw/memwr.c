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

__xdata __at(0xFF80) unsigned char pt_wren[32];
__xdata __at(0xFFA0) unsigned char pt_rden[32];

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

__xdata __at(0xF9F0) unsigned char memwr_reg_start;
__xdata __at(0xF9F1) unsigned char memwr_reg_state;
__xdata __at(0xF9F2) unsigned int memwr_reg_rd_addr;
__xdata __at(0xF9F4) unsigned int memwr_reg_wr_addr;
__xdata __at(0xF9F6) unsigned int memwr_reg_len;

__xdata __at(0x8000) unsigned char datasrc[66];
__xdata __at(0x9000) unsigned char datadst[66];

/*---------------------------------------------------------------------------*/

void main() {
    
    int i;
    int good=1;

    // enable read/write to all locations in the page tables.
    for(i=0; i < 32; i++) {
        pt_wren[i] = 0xff;
        pt_rden[i] = 0xff;
    }

    // test writing to XRAM.
    for(i=0; i < 65; i++) {
        datasrc[i]=i;
        datadst[i]=65-i;
    }
    datasrc[65] = 0;

    // setup address, length, counter and key.
    memwr_reg_rd_addr = (unsigned int)&datasrc;
    memwr_reg_wr_addr = (unsigned int)&datadst;
    memwr_reg_len = 65;

    // start copying
    memwr_reg_start = 1;
    // now wait for copying to complete.
    while(memwr_reg_state != 0);

    // check
    for(i=0; i < 65; i++) {
        if(datadst[i] != i) { 
            P0 = i; 
        } else {
            P0 = 0xff;
        }
    }
    P0 = good;
    // finish.
    quit();
}
