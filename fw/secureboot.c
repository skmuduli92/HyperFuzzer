/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
#include "rsa.h"

#include <8051.h>



XDATA_ARR(0x0001, MAX_PRG_SIZE, unsigned char, program);
XDATA_ARR(0x3000, MAX_IM_SIZE, unsigned char, boot);

XDATA_ARR(0xC000, MAX_IM_SIZE+0x40, unsigned char, sha_in);
XDATA_ARR(0xE100, H, unsigned char, sha_out);
XDATA_ARR(0xE200, N, unsigned char, rsa_out);

/*---------------------------------------------------------------------------*/

#define PACK(var, size) unsigned char var[size]


struct modules{
    unsigned int addr;
    PACK(p0,2);  // add extra bytes to account for different type sizes
    unsigned int size;
    PACK(p1,2);
    unsigned char hash[H];
};
struct image{
    unsigned char sig[N];  // signature of header
    unsigned char exp[N];
    unsigned char mod[N];  // n in modexp
    unsigned int num;      // total number of blocks
    PACK(p0, 2);
    struct modules module[1];
};

enum status{
    UNDET,
    PASS,
    FAIL
};

//public key hash
CODE unsigned char pkhash[20] = {0x37, 0x34, 0xA6, 0x83,
				   0x5F, 0xFC, 0xE0, 0x2B,
				   0xC6, 0xEE, 0xCB, 0x81,
				   0x6C, 0x92, 0x6C, 0x7C,
				   0xBA, 0x79, 0xCB, 0x8F};


void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}


void fail(unsigned char* failmes) {
  (void)failmes;
  P0 = 0;
  quit();

}


void main() {

    unsigned int i, j;
    unsigned int num;   // total number of blocks
    struct image* im;
    struct modules* block; // current block
    unsigned int size;
    unsigned char* moddata;
    unsigned int ldaddr = 0;
    enum status pass = UNDET;
    //unsigned char *m;
    // STAGE 0: set up
    //P0 = 5;
    pt_init();
    // set SHA read and write addresses
    unlock(SHA, (unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    writeptr(SHA, &sha_regs.rd_addr, sha_in);
    writeptr(SHA, &sha_regs.wr_addr, sha_out);
    lock(SHA, (unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    // unlock memwr registers
    unlock(MEMWR, (unsigned char*)&memwr_regs.start, (unsigned char*)(&memwr_regs+1));

    // set up RSA
    unlock(RSA, (unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));

    writeptr(RSA, &rsa_regs.opaddr, rsa_out);  // set up address to write to

    lock(RSA, (unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));


    if(!RSAinit(rsa_out, sha_in, sha_out)){
    	pass = FAIL;
    	fail("invalid input/output addresses");
    	return;
    }

    // STAGE 1: read image into RAM
    unlock(pages[BOOT], boot, boot+MAX_IM_SIZE);
    // load(0, MAX_IM_SIZE, boot, 0);
    // image is loaded.
    // now we need to lock boot to boot + MAX_IM_SIZE
    lock(pages[BOOT], boot, boot+MAX_IM_SIZE);


    // STAGE 2: check that key matches hash
    im  = (struct image*) boot;
    // set signature key
    unlock(RSA_KEYS, rsa_regs.exp, rsa_regs.exp+N);
    load(im->exp,N,rsa_regs.exp,0);

    //writecarr(RSA_KEYS, rsa_regs.exp, im->exp, N);
    lock(RSA_KEYS, rsa_regs.exp, rsa_regs.exp+N);
    // set signature modulus
    unlock(RSA_KEYS, rsa_regs.n, rsa_regs.n+N);
    //writecarr(RSA_KEYS, rsa_regs.n, im->mod, N);
    load(im->mod,N,rsa_regs.n,0);
    lock(RSA_KEYS, rsa_regs.n, rsa_regs.n+N);

    // check the hashes
    sha1(rsa_regs.exp, 2*N);

    for(i=0; i<H; i++){
    	if(sha_out[i] != pkhash[i]){
    	    pass = FAIL;  // FAIL: key hash mismatch
    	    fail("key hash mismatch");
    	    return;
    	}
    }

    // STAGE 3: verify signature in boot
    num = im->num & 0xFFFF;  // number of modules

    // sizeof image struct includes extra signature and first module
    size = sizeof(struct image) - (im->exp -(unsigned char*)im) + sizeof(struct modules) * (num-1);

    if(size > MAX_IM_SIZE)
    {
    	pass = FAIL; // FAIL: image too large
    	fail("header too large");
    	return;
    }


    if(!verifySignature(im->exp, size, im->sig))
    {
    	pass = FAIL;  // FAIL: signature mismatch
    	fail("signature mismatch");
    	return;
    }
    // STAGE 4: load blocks
    if(num == 0){  // no blocks to load, done
    	pass = PASS;
    	return;
    }

    unlock(pages[PRG], program, program + MAX_PRG_SIZE);  // unlock memory space for program
    block = im->module;  // block data in header
    moddata = (unsigned char*)(block + num); // program data of this module
    size = 0;
    for(i=0; i<num; i++)
    {

      	// check that size and address are valid
      	size = block->size & 0xFFFF;     // size of current module
            //P1 = size;
            //P1 = size>>8;
      	ldaddr = block->addr;   // address to load this module into
            //P1 = ldaddr;
            //P1 = ldaddr>>8;
      	// the data does not fit inside the image
      	if(moddata + size > boot + MAX_IM_SIZE ||
      	   moddata + size < moddata)  // overflow
      	{
      	    //addr_val = 0;
      	    pass = FAIL;
      	    fail("data does not fit in image");
      	    return;
      	}
              // the data does not fit in memory range allocated for it
      	if(size + ldaddr > MAX_PRG_SIZE ||
      	   ldaddr + size < ldaddr)
      	{
      	    //addr_val = 0;
      	    pass = FAIL;
      	    fail("program write out of range");
      	    return;
      	}

      	// load data
      	if(size != 0){
      	    load(moddata, size, program+ldaddr, 0);
      	}


      	// update to next module
      	moddata += size;
      	block++;
    }



    // lock newly loaded data
    lock(pages[PRG], program, program + MAX_PRG_SIZE);

    block = im->module;  // go back to first module
    moddata = (unsigned char*)(block + num); // program data of this module

    for(i=0; i<num; i++)
    {
        unsigned int ldaddr;
        unsigned char *m;
      	size = block->size & 0xFFFF;     // size of current module
      	ldaddr = block->addr;   // address to load this module into
	      sha1(program+ldaddr, size);

        m = program+ldaddr;

      	for(j=0; j<H; j++){
      	    if(sha_out[j] != block->hash[j]){
          		pass = FAIL;
          		fail("module hash mismatch");
          		return;
      	    }
	     }

  	// update to next module
      	moddata += size;
      	block++;
    }

    // check that program loaded correctly, for testing only
    for(i=0; i<moddata-(unsigned char*)block; i++){
    	if(program[i] != *((unsigned char*)block + i)){
    	    pass = FAIL;  // FAIL
    	    fail("load is wrong");
    	    break;
    	}
    }

    // PASS or FAIL
    if(pass != FAIL){
	       pass = PASS;
    }
    P0 = pass;

    quit();
}

// bootlock: image does not change once it is loaded
