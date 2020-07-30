#include <reg51.h>

/*
 * Test for Page Table's Illegal Access Registers
 *
 * Written by Samuel Miller 
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
    __xdata __at(0xFF00) unsigned char aes_data[256];
    __xdata __at(0x0800) unsigned char xram_data[256];
    __xdata __at(0x1200) unsigned char xram_data_two[256];
    __xdata __at(0xffc0) unsigned char ia_regs[6];
    int i;


    // first disable writing to and reading from the page
    pt_wren[1] = 0x00;
    pt_rden[1] = 0x00;
    
    // try to write to 0x801
    xram_data[1] = 0x20;
    
    // this should write 0x01 to P0 because illegal write, then 0x08, 0x01
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];
    
    // writes 0 (since rd disabled), then 02 since illegal rd, then 0x08, 0x01
    P0 = xram_data[1];
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // now enable reading and writing for the page.
    pt_wren[1] = 0x01;
    pt_rden[1] = 0x01;

    // try writing to 0x800, then read from it
    xram_data[0] = 0x1a;
    P0 = xram_data[0];

    // since wr/rd enabled, these should be the same as before
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // now disable writing but keep reading enabled
    pt_wren[1] = 0x00;

    // now try writing to 0x02
    xram_data[2] = 0xaa;

    // illegal write: should show 0x01, 0x08, 0x02
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // now try reading from 0x00
    P0 = xram_data[0];

    // legal read: should be same as before
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // now allow writes but not reads
    pt_wren[1] = 0x01;
    pt_rden[1] = 0x00;

    // try to write to 0x803
    xram_data[3] = 0x05;

    // legal write: should be same as before
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // try reading from 0x805
    P0 = xram_data[3];

    // illegal read: should show 0x02, 0x08, 0x03
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // now try illegal write with a higher address
    xram_data_two[3] = 0x90;

    // illegal read: display 0x02, 0x12, 0x03
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // allow reads here
    pt_rden[2] = 0x04;

    // write 0x00 to 0x1200
    pt_wren[2] = 0x04;
    xram_data_two[0] = 0x09;
    P0 = xram_data_two[0];
    pt_wren[2] = 0x00;

    // now try again when reads are legal here (display same as before)
    P0 = xram_data_two[0];
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // now try writing there illegally
    xram_data_two[7] = 0x77;

    // illegal write: should show 0x01, 0x12, 0x07
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // enable writes here too
    pt_wren[2] = 0x04;

    // try a string of reads and writes on this page
    xram_data_two[9] = 0x99;
    xram_data_two[3] = 0x30;
    P0 = xram_data_two[9];
    P0 = xram_data_two[3];
    xram_data_two[4] = 0x56;

    // now make sure the illegal access registers were unaffected
    P0 = ia_regs[0];
    P0 = ia_regs[1];
    P0 = ia_regs[2];

    // reset
    pt_wren[1] = 0x00;
    pt_rden[1] = 0x00;
    pt_wren[2] = 0x00;
    pt_rden[2] = 0x00;

    // test repeated illegal accesses
    xram_data_two[9] = 0x99;
    xram_data_two[3] = 0x30;
    P0 = xram_data_two[9];
    P0 = xram_data_two[3];
    xram_data_two[4] = 0x56;

    // now look at pc for last illegal access
    P0 = ia_regs[4];
    P0 = ia_regs[5];


    /*
     * now try this with the aes module
     */


    // first enable writing to and reading from the page
    pt_wren[1] = 0x01;
    pt_rden[1] = 0x01;
    
    // write to 0x000 and 0x001
    xram_data[0] = 0x10;
    xram_data[1] = 0x20;

    // now disable writing to and reading from the page
    pt_wren[1] = 0x00;
    pt_rden[1] = 0x00;

    // this should indicate that the processor was the last illegal accesser (0x00)
    P0 = ia_regs[3];

    // try to encrypt data at 0x000 and 0x001
    aes_data[0x02] = xram_data[0];
    aes_data[0x04] = 2;

    // this should (still) indicate that the processor was the last illegal accesser (0x00)
    P0 = ia_regs[3];

    // check pc from illegal access
    P0 = ia_regs[4];
    P0 = ia_regs[5];

    for (i = 0; i < 16; i++) 
    {
        aes_data[0x10 + i] = i * i * i;
    }
    for (i = 0; i < 16; i++)
    {
        aes_data[0x20 + i] = i | (i << 4);
    }
    aes_data[0x00] = 1;
    while (aes_data[0x01] != 0);

    // this should indicate that aes was last illegal accesser (0x01)
    P0 = ia_regs[3];

    // make sure illegal access pc wasn't affected by aes illegal access
    P0 = ia_regs[4];
    P0 = ia_regs[5];

    // make illegal access using processor
    P0 = xram_data[0];

    // this should indicate that the processer was last illegal accesser (0x00)
    P0 = ia_regs[3];

    // check pc from illegal access
    P0 = ia_regs[4];
    P0 = ia_regs[5];

    quit();
}
