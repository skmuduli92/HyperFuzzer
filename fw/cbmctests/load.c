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
#ifdef C
#ifndef CBMC
#include <stdio.h>
#endif
#else
#include <reg51.h>
#endif

#ifdef CBMC
unsigned char* nondet_ptr();
unsigned int nondet_uint();
unsigned char nondet_uchar();
int nondet_int();
#endif

#ifdef C
unsigned char mem[MEM_SIZE];

#define PRG 0
#define BOOT 1
#define SHAI 2
#define SHAO 3
#define RSAO 4
#endif

XDATA_ARR(0x0000, MAX_PRG_SIZE, unsigned char, program);
XDATA_ARR(0x5000, MAX_IM_SIZE, unsigned char, boot);

XDATA_ARR(0xC000, MAX_IM_SIZE+0x40, unsigned char, sha_in);
XDATA_ARR(0xE100, H, unsigned char, sha_out);
XDATA_ARR(0xE200, N, unsigned char, rsa_out);

/*---------------------------------------------------------------------------*/
#ifdef C
#define PACK(var, size)
unsigned char P0 = 0xFF;
#else
#define PACK(var, size) unsigned char var[size]
#endif

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
    FAIL,
    PASS
};

//public key hash
CODE unsigned char pkhash[20] = {0x37, 0x34, 0xA6, 0x83, 
				   0x5F, 0xFC, 0xE0, 0x2B, 
				   0xC6, 0xEE, 0xCB, 0x81, 
				   0x6C, 0x92, 0x6C, 0x7C, 
				   0xBA, 0x79, 0xCB, 0x8F};

#ifndef C
void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}
#endif

void fail(unsigned char* failmes) {
#ifdef C
#ifndef CBMC
  printf("%s\n", failmes);
#endif
#else
  (void)failmes;
  P0 = 0;
  quit();
#endif
}
#ifdef CBMC
void meminit(struct image* image)
{
    int i;
    unsigned char* moddata;
    int size;
    image->sig[nondet_uint()%N] = nondet_uchar();
    image->exp[nondet_uint()%N] = nondet_uchar();
    image->mod[nondet_uint()%N] = nondet_uchar();
    image->num = nondet_uint();
    for(i=0; i<2; i++){
	image->module[0].addr = nondet_uint();
	image->module[0].size = nondet_uint();
	image->module[0].hash[nondet_uint()%H] = nondet_uchar();
    }
    moddata = (unsigned char*)&image->module[image->num];
    for(i=0; i<2; i++){
	size = image->module[0].size;
	if(moddata < boot[MAX_IM_SIZE])
	    moddata[nondet_uint()%size] = nondet_uchar();
	moddata += size;
    }
}
#endif

void main() {
    unsigned int i, j;
    unsigned int num;   // total number of blocks
    struct image* im;
    struct modules* block; // current block
    unsigned int size;
    unsigned char* moddata;
    enum status pass = UNDET;
    int pages[5];
#ifdef CBMC
    unsigned int compind;
    // is the data valid?
    unsigned char key_val = nondet_uchar();
    unsigned char sig_val = nondet_uchar();
    unsigned char addr_val = 1;
#endif
    unsigned int ldaddr = 0;

    // STAGE 0: set up
    pt_init();

    // put new arrays in mem
    boot = mem_add(MAX_IM_SIZE);
    program = mem_add(MAX_PRG_SIZE);
    sha_in = mem_add(MAX_IM_SIZE+0x40);
    sha_out = mem_add(H);

    // put new arrays into pt
    pages[BOOT] = pt_add(boot, MAX_IM_SIZE);
    pages[PRG] = pt_add(program, MAX_PRG_SIZE);

    // unlock memwr registers
    unlock(MEMWR, (unsigned char*)&memwr_regs.start, (unsigned char*)(&memwr_regs+1));

    // STAGE 1: read image into RAM  
#ifndef CBMC
    load(0, MAX_IM_SIZE, boot, 1);
#else
    meminit((struct image*)boot);
#endif

    im  = (struct image*) boot;
    num = im->num;  // number of modules
    if(num == 0){
	pass = FAIL;
	fail("no modules to load");
	return;
    }

    // sizeof image struct includes extra signature and first module
    size = sizeof(struct image) - (im->exp -(unsigned char*)im) + sizeof(struct modules) * (num-1);
    if(size > MAX_IM_SIZE)
    {
	pass = FAIL; // FAIL: image too large
	fail("header too large");
	return;
    }

    // STAGE 4: load blocks
    unlock(pages[PRG], program, program + MAX_PRG_SIZE);  // unlock memory space for program

    block = im->module;  // block data in header
    moddata = (unsigned char*)(block + num); // program data of this module
    size = 0;

    for(i=0; i<num; i++)
    {
#ifdef CBMC
	unsigned int ldaddr2 = ldaddr;
	unsigned int size2 = size;
#endif
	// check that size and address are valid
	size = block->size & 0xFFFF;     // size of current module
	ldaddr = block->addr;   // address to load this module into
	// the data does not fit inside the image
	//__CPROVER_assume(size != 0);
	if(moddata + size > boot + MAX_IM_SIZE ||
	   moddata + size < moddata)  // overflow
	{
	    addr_val = 0;
	    pass = FAIL;
	    fail("data does not fit in image");
	    return;
	}
        // the data does not fit in memory range allocated for it
	if(size + ldaddr> MAX_PRG_SIZE ||
	   ldaddr + size < ldaddr)
	{
	    addr_val = 0;
	    pass = FAIL;
	    fail("program write out of range");
	    return;
	}


#ifdef CBMC
	if(ldaddr < ldaddr2+size2 && ldaddr2 < ldaddr+size)
	    addr_val = 0;
	if(i == 0)
	    compind = (nondet_uint()%size);
#endif

	// load data
	if(size > 0){
	    load(moddata, size, program+ldaddr, 0);
	//assert(program[ldaddr+compind]==moddata[compind]);
	}

	// update to next module
	moddata += size;
	block++;
    }

    block = im->module;  // go back to first module
    moddata = (unsigned char*)(block + num); // program data of this module
    ldaddr = block->addr & 0xFFFF;

    //assert(im->module[0].size==0 || !addr_val || program[ldaddr+compind]==moddata[compind]);

    pass = PASS;
}

// note: log: loaded 2 modules
// load: loading one module succeeds
// load2: loading 2 modules succeeds, checking immediately after each load
// loadfail: write fails if we don't check address/size constraints (full sizes)
// loadlast: if modules do not overlap, all modules load correctly, check after all loads complete
// overlap: load fails if we do not check for overlapping modules
// loadwrite: writes all pass if we do check addresses (full size)
// loadabs: using meminit instead of initializing whole image  -> not working
// loadimwr: writes pass when loading in the image (stage 1) (full size)
// shawr: writes pass when checking hashes of modules (full size)
