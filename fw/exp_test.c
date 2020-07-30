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

__xdata __at(0xFD00) unsigned char exp_reg_start;
__xdata __at(0xFD01) unsigned char exp_reg_state;
__xdata __at(0xFD02) unsigned int  exp_reg_addr;
__xdata __at(0xFC00) unsigned char n[256];
__xdata __at(0xFB00) unsigned char exp[256];
__xdata __at(0xFA00) unsigned char m[256];
__xdata __at(0xE000) unsigned char data[256];
__xdata __at(0xE100) unsigned long comp[64];

/*---------------------------------------------------------------------------*/


void main() {
    int i;
    int good=1;

    // setup address, m, e, n
    exp_reg_addr = 0xE000;
    for(i=0; i < 3; i++) { exp[i] = i*i*i; }
    for(i=0; i < 256; i++) { n[i] = i | (i << 4); }
    for(i=0; i < 256; i++) { m[i] = i;}

    // now start encryption.
    exp_reg_start = 1;

    // now wait for encryption to complete.
    while(exp_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 256; i++) {
        P0 = data[i];
        if(data[i] != *((unsigned char *)comp + i)) { 
            good =0;
            break;
        }
    }
    P0 = good;
    // finish.
    quit();
}

void fillcomparr()
{
    comp[0] = 0x3a765c00;
    comp[1] = 0xcdc2bbee;
    comp[2] = 0xa4b2f833;
    comp[3] = 0x627b81c7;
    comp[4] = 0xc314447a;
    comp[5] = 0x853d33c8;
    comp[6] = 0x2f1ec8ef;
    comp[7] = 0xad59c0cb;
    comp[8] = 0x35129ea6;
    comp[9] = 0x82430100;
    comp[10] = 0x0dcc5aca;
    comp[11] = 0xec17fe95;
    comp[12] = 0xe439ed09;
    comp[13] = 0x71e04263;
    comp[14] = 0xb0405e4d;
    comp[15] = 0x657d68f7;
    comp[16] = 0x01444031;
    comp[17] = 0x44af7547;
    comp[18] = 0xb6252599;
    comp[19] = 0x37d31187;
    comp[20] = 0x88226aaa;
    comp[21] = 0x39b6c755;
    comp[22] = 0x839d5671;
    comp[23] = 0xd168be0c;
    comp[24] = 0xd20d2b72;
    comp[25] = 0x22fa0130;
    comp[26] = 0x46b18ef1;
    comp[27] = 0x9de65ac4;
    comp[28] = 0xf3fdb92c;
    comp[29] = 0x0c8fad69;
    comp[30] = 0x1892be5e;
    comp[31] = 0x3948b740;
    comp[32] = 0xe4902807;
    comp[33] = 0xcc2e6a49;
    comp[34] = 0x3e1405fe;
    comp[35] = 0xbdf2cf5b;
    comp[36] = 0x496deec7;
    comp[37] = 0x746b7862;
    comp[38] = 0x769d5e62;
    comp[39] = 0x3dbddcde;
    comp[40] = 0xdc593930;
    comp[41] = 0x5f7a4ec4;
    comp[42] = 0x2c8416c5;
    comp[43] = 0xdf6a3c33;
    comp[44] = 0x4a6a83b4;
    comp[45] = 0xea677c6f;
    comp[46] = 0x40dd8f5e;
    comp[47] = 0x564841dd;
    comp[48] = 0xe6a5f18e;
    comp[49] = 0xe5b7c684;
    comp[50] = 0xca527b6a;
    comp[51] = 0x9a8f9cf5;
    comp[52] = 0xab43f3cf;
    comp[53] = 0x829a9485;
    comp[54] = 0x211225ff;
    comp[55] = 0x964d8871;
    comp[56] = 0xcd5dd02a;
    comp[57] = 0x2d36f0c8;
    comp[58] = 0x7e5c006a;
    comp[59] = 0xc47903d2;
    comp[60] = 0x5d8f05aa;
    comp[61] = 0xcc1b592a;
    comp[62] = 0x88cf54b2;
    comp[63] = 0x4e316da6;
}
