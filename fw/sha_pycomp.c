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

__xdata __at(0xFE00) unsigned char sha_reg_start;
__xdata __at(0xFE01) unsigned char sha_reg_state;
__xdata __at(0xFE02) unsigned int sha_reg_rd_addr;
__xdata __at(0xFE04) unsigned int sha_reg_wr_addr;
__xdata __at(0xFE06) unsigned int sha_reg_len;
__xdata __at(0xE000) unsigned char d1[64];
__xdata __at(0xE100) unsigned char d2[128];
__xdata __at(0xE200) unsigned char hash[20];

/*---------------------------------------------------------------------------*/

void main() {

    unsigned char pyhash[20];    
    int i;
    int good=1;
    int N = 128;

    // #include "pyhash.c"
    pyhash[0] = 0xc6; pyhash[1] = 0x13; pyhash[2] = 0x8d; pyhash[3] = 0x51; 
    pyhash[4] = 0x4f; pyhash[5] = 0xfa; pyhash[6] = 0x21; pyhash[7] = 0x35; 
    pyhash[8] = 0xbf; pyhash[9] = 0xce; pyhash[10] = 0xe; pyhash[11] = 0xd0; 
    pyhash[12] = 0xb8; pyhash[13] = 0xfa; pyhash[14] = 0xc6; pyhash[15] = 0x56; 
    pyhash[16] = 0x69; pyhash[17] = 0x91; pyhash[18] = 0x7e; pyhash[19] = 0xc7;


    // reset the entire block.
    for(i=0; i<N; i++) { d2[i] = 0; }
    // initialize bytes 0-63
    for(i=0; i < 64; i++) { d2[i] = i; }
    // add binary string of the form 10* after this (only need the 1).
    d2[64] = 0x80;
    // put message size (in bits) in last 8 bytes of the block
    d2[126] = 0x02;
    d2[127] = 0x00;

    sha_reg_rd_addr = (unsigned int) &d2;
    sha_reg_wr_addr = (unsigned int) &hash;
    sha_reg_len = N;
    
    // now start encryption.
    sha_reg_start = 1;
    // now wait for encryption to complete.
    while(sha_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 20; i++) {
        P1 = 2;
        P0 = hash[i];
        if(hash[i] != pyhash[i])
        {
          good = 0;
          break;
        }
    }

    P0 = good;

    // finish.
    quit();
}
