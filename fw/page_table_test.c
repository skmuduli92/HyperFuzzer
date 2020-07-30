#include <reg51.h>

/*
 * Test for Page Table
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
    __xdata __at(0x0800) unsigned char xram_mid_data[256];
    __xdata __at(0x0000) unsigned char xram_start_data[256];
    __xdata __at(0xff00) unsigned char xram_end_data[256];
    int i;


    // first disable writing to and reading from the page
    pt_wren[0] = 0x00;
    pt_rden[0] = 0x00;
    
    // try to write to 0x000 and 0x001
    xram_start_data[0] = 0x10;
    xram_start_data[1] = 0x20;
    
    // this should write 0x00 to P0 beacuse writing/reading disabled
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];
    
    // now enable reading and writing for the page.
    pt_wren[0] = 0x01;
    pt_rden[0] = 0x01;

    // check to make sure the page table is activated
    P0 = pt_wren[0];
    P0 = pt_rden[0];

    // try writing to 0x000 and 0x001 again
    xram_start_data[0] = 0x1a;
    xram_start_data[1] = 0x2a;

    // this should write 0x1a, then 0x2a to P0 because reading/writing enabled
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // now disable writing but keep reading enabled
    pt_wren[0] = 0x00;

    // now try writing to 0x000 and 0x001
    xram_start_data[0] = 0xaa;
    xram_start_data[1] = 0xbb;

    // this should write 0x1a, then 0x2a because writing was disabled
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // now allow writes but not reads
    pt_wren[0] = 0x01;
    pt_rden[0] = 0x00;

    // check for wren activated but rden disabled
    P0 = pt_wren[0];
    P0 = pt_rden[0];

    // try to write to 0x000 and 0x001
    xram_start_data[0] = 0x01;
    xram_start_data[1] = 0x10;

    // try reading from 0x000 and 0x001 (should fail/return 0x00)
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // now re-enable reading and try again (should output 0x01 then 0x10)
    pt_rden[0] = 0x01;
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // reset
    pt_wren[0] = 0x00;
    pt_rden[0] = 0x00;


    /*
     * try same procedure for a different location in xram:
     */ 

   
    // first disable writing to and reading from the page
    pt_wren[1] = 0x00;
    pt_rden[1] = 0x00;
    
    // try to write to 0x800 and 0x801
    xram_mid_data[0] = 0x55;
    xram_mid_data[1] = 0x66;
    
    // this should write 0x00 to P0 beacuse writing/reading disabled
    P0 = xram_mid_data[0];
    P0 = xram_mid_data[1];
    
    // now enable reading and writing for the page.
    pt_wren[1] = 0x01;
    pt_rden[1] = 0x01;

    // check to make sure the page table is activated
    P0 = pt_wren[1];
    P0 = pt_rden[1];

    // try writing to 0x800 and 0x801 again
    xram_mid_data[0] = 0x32;
    xram_mid_data[1] = 0x44;

    // this should write 0x32, then 0x44 to P0 because reading/writing enabled
    P0 = xram_mid_data[0];
    P0 = xram_mid_data[1];

    // now disable writing but keep reading enabled
    pt_wren[1] = 0x00;

    // now try writing to 0x800 and 0x801
    xram_mid_data[0] = 0x23;
    xram_mid_data[1] = 0x11;

    // this should write 0x32, then 0x44 because writing was disabled
    P0 = xram_mid_data[0];
    P0 = xram_mid_data[1];

    // now allow writes but not reads
    pt_wren[1] = 0x01;
    pt_rden[1] = 0x00;

    // check for wren activated but rden disabled
    P0 = pt_wren[1];
    P0 = pt_rden[1];

    // try to write to 0x800 and 0x801
    xram_mid_data[0] = 0x08;
    xram_mid_data[1] = 0x80;

    // try reading from 0x800 and 0x801 (should fail/return 0x00)
    P0 = xram_mid_data[0];
    P0 = xram_mid_data[1];

    // now re-enable reading and try again (should output 0x08 then 0x80)
    pt_rden[1] = 0x01;
    P0 = xram_mid_data[0];
    P0 = xram_mid_data[1];

    // reset
    pt_wren[1] = 0x00;
    pt_rden[1] = 0x00;


    /*
     * try same procedure for a different location in xram:
     */ 


    // first disable writing to and reading from the page
    pt_wren[31] = 0x00;
    pt_rden[31] = 0x00;
    
    // try to write to 0xffee and 0xffef
    xram_end_data[0xee] = 0x1f;
    xram_end_data[0xef] = 0x2f;
    
    // this should write 0x00 to P0 beacuse writing/reading disabled
    P0 = xram_end_data[0xee];
    P0 = xram_end_data[0xef];
    
    // now enable reading and writing for the page.
    pt_wren[31] = 0x80;
    pt_rden[31] = 0x80;

    // check to make sure the page table is activated
    P0 = pt_wren[31];
    P0 = pt_rden[31];

    // try writing to 0xffee and 0xffef again
    xram_end_data[0xee] = 0xfa;
    xram_end_data[0xef] = 0xfb;

    // this should write 0xfa, then 0xfb to P0 because reading/writing enabled
    P0 = xram_end_data[0xee];
    P0 = xram_end_data[0xef];

    // now disable writing but keep reading enabled
    pt_wren[31] = 0x00;

    // now try writing to 0xffee and 0xffef
    xram_end_data[0xee] = 0xcc;
    xram_end_data[0xef] = 0xdd;

    // this should write 0xfa, then 0xfb because writing was disabled
    P0 = xram_end_data[0xee];
    P0 = xram_end_data[0xef];

    // now allow writes but not reads
    pt_wren[31] = 0x80;
    pt_rden[31] = 0x00;

    // try to write to 0xffee and 0xffef
    xram_end_data[0xee] = 0x0e;
    xram_end_data[0xef] = 0xe0;

    // try reading from 0xffee and 0xffef (should fail/return 0x00)
    P0 = xram_end_data[0xee];
    P0 = xram_end_data[0xef];

    // now re-enable reading and try again (should output 0x0e then 0xe0)
    pt_rden[31] = 0x80;
    P0 = xram_end_data[0xee];
    P0 = xram_end_data[0xef];

    // reset
    pt_wren[31] = 0x00;
    pt_rden[31] = 0x00;


    /*
     * make sure aes can't get around page table either
     */


    // first enable writing to and reading from the page
    pt_wren[0] = 0x01;
    pt_rden[0] = 0x01;
    
    // write to 0x000 and 0x001
    xram_start_data[0] = 0x10;
    xram_start_data[1] = 0x20;

    // now disable writing to and reading from the page
    pt_wren[0] = 0x00;
    pt_rden[0] = 0x00;

    // try to encrypt data at 0x000 and 0x001
    aes_data[0x02] = xram_start_data[0];
    aes_data[0x04] = 2;
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

    // this should write 0x00 to P0 beacuse writing/reading disabled
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];
    
    // now enable reading and writing for the page.
    pt_wren[0] = 0x01;
    pt_rden[0] = 0x01;

    // check to make sure the page table is activated
    P0 = pt_wren[0];
    P0 = pt_rden[0];

    // try to encrypt data at 0x000 and 0x001 again
    aes_data[0x00] = 1;
    while (aes_data[0x01] != 0);

    // this should write encrypted data to P0 because reading/writing enabled
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // now decrypt data at 0x000 and 0x001
    aes_data[0x00] = 1;
    while (aes_data[0x01] != 0);

    // this should write decrypted data (0x10, 0x20) to P0)
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // now disable writing but keep reading enabled
    pt_wren[0] = 0x00;

    // now try encrypting again
    aes_data[0x00] = 1;
    while (aes_data[0x01] != 0);

    // this should write 0x10, then 0x20 because writing was disabled
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // now allow writes but not reads
    pt_wren[0] = 0x01;
    pt_rden[0] = 0x00;

    // check for wren activated but rden disabled
    P0 = pt_wren[0];
    P0 = pt_rden[0];

    // encrypt again
    aes_data[0x00] = 1;
    while (aes_data[0x01] != 0);

    // try reading from 0x000 and 0x001 (should fail/return 0x00)
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // now re-enable reading and try again (should output encyrpted data)
    pt_rden[0] = 0x01;
    P0 = xram_start_data[0];
    P0 = xram_start_data[1];

    // reset
    pt_wren[0] = 0x00;
    pt_rden[0] = 0x00;


    quit();
}