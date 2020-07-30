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
__xdata __at(0xE000) unsigned char d1[256];
__xdata __at(0xE200) unsigned char hash[20];

#define GOOD_ID  0x1
#define BYTE0_ID 0x2
#define BYTE1_ID 0x3
#define BYTE2_ID 0x4
#define BYTE3_ID 0x5
#define BYTE4_ID 0x6

__xdata __at(0xEFFC) unsigned int debug_reg_addr;
__xdata __at(0xEFFE) unsigned int debug_reg_data;

void record_dbg(int ID, unsigned data)
{
    debug_reg_addr = ID;
    debug_reg_data = data;
}

/*---------------------------------------------------------------------------*/

void main() {

    unsigned int i;
    unsigned int mlen,len=5, padding;
    int good=1;

    unsigned char expected_hash[20] = {
        0x03,0xde,0x6c,0x57,0x0b,
        0xfe,0x24,0xbf,0xc3,0x28,
        0xcc,0xd7,0xca,0x46,0xb7,
        0x6e,0xad,0xaf,0x43,0x34
    };

    // test writing to XRAM.
    for(i=0; i < len; i++) {
        d1[i]=0x61 + i;
    }
    padding = 64 - len % 64;
    mlen = len + padding;
    d1[mlen-1] = (len << 3) & 0xFF;
    d1[mlen-2] = (len >> 5) & 0xFF;
    d1[mlen-3] = (len >> 13) & 0xFF;
    d1[len] = 0x80;
    for(i=len+1; i < mlen-3; i++) {
        d1[i] = 0;
    }

    // setup address, length, counter and key.
    sha_reg_rd_addr = (unsigned int) &d1;
    sha_reg_wr_addr = (unsigned int) &hash;
    sha_reg_len = mlen;

    // now start encryption.
    sha_reg_start = 1;
    // now wait for encryption to complete.
    while(sha_reg_state != 0);

    for(i=0; i < 20; i++) {
        if (expected_hash[i] != hash[i]) {
            good = 0;
            break;
        }
    }

    P0 = good;
    P0 = 5;
    record_dbg(BYTE0_ID, d1[0]);
    record_dbg(BYTE1_ID, d1[1]);
    record_dbg(BYTE2_ID, d1[2]);
    record_dbg(BYTE3_ID, d1[3]);
    record_dbg(BYTE4_ID, d1[4]);
    // setting good later is important!
    record_dbg(GOOD_ID,  good);

    // finish.
    d1[0] = d1[10];
    d1[0] = d1[11];
    d1[0] = d1[12];
    d1[0] = d1[13];
    d1[0] = d1[14];
    quit();
}
