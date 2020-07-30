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
unsigned char valid = 1;
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

#ifdef C
    int pages[5];
#endif

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

unsigned char rsakeys[2*N];

void meminit(struct image* im)
{
    unsigned int i;
    for(i=0; i<N; i++)
	rsakeys[i] = nondet_uchar();
    for(i=N; i<2*N; i++)
	rsakeys[i] = nondet_uchar();
    writecarr(pages[BOOT], im->exp, rsakeys, 2*N);
    //uninterp_sha(rsakeys, 2*N, 2, pkhash);
}

void main() {
    unsigned int i, j;
    unsigned int num;   // total number of blocks
    struct image* im;
    enum status pass = UNDET;
#ifdef CBMC
    unsigned int compind;
    // is the image valid?
    unsigned char key_val = 1;
    unsigned char sig_val = 1;
    unsigned char addr_val = 1;
#endif

    // STAGE 0: set up
    pt_init();
#ifdef C
    // put new arrays in mem
    boot = mem_add(MAX_IM_SIZE);
    program = mem_add(MAX_PRG_SIZE);
    sha_in = mem_add(MAX_IM_SIZE+0x40);
    sha_out = mem_add(H);
    rsa_out = mem_add(N);
    // put new arrays into pt
    pages[BOOT] = pt_add(boot, MAX_IM_SIZE);
    pages[PRG] = pt_add(program, MAX_PRG_SIZE);
    pages[SHAI] = pt_add(sha_in, MAX_IM_SIZE+0x40);
    pages[SHAO] = pt_add(sha_out, H);
    pages[RSAO] = pt_add(rsa_out, N);
#endif

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
#ifndef CBMC  // for CBMC just use initialized values
    load(0, MAX_IM_SIZE, boot, 1);
#else
    meminit((struct image*)boot);
#endif
    if(nondet_uint())
	writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);
    // image is loaded.
    // now we need to lock boot to boot + MAX_IM_SIZE
    lock(pages[BOOT], boot, boot+MAX_IM_SIZE);

    // STAGE 2: check that key matches hash
    im  = (struct image*) boot;
    // set signature key
    unlock(RSA_KEYS, rsa_regs.exp, rsa_regs.exp+N);
    if(nondet_uint())
	writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);
    pt_reset(RSA_KEYS);
    writecarr(RSA_KEYS, rsa_regs.exp, im->exp, N);

    writec(RSA_KEYS, rsa_regs.exp[0], 10, 0);
    lock(RSA_KEYS, rsa_regs.exp, rsa_regs.exp+N);
    // set signature modulus
    unlock(RSA_KEYS, rsa_regs.n, rsa_regs.n+N);
    writecarr(RSA_KEYS, rsa_regs.n, im->mod, N);
    if(nondet_uint())
	writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);
    lock(RSA_KEYS, rsa_regs.n, rsa_regs.n+N);
    if(nondet_uint())
	writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);

    // check the hashes
    sha1(rsa_regs.exp, 2*N);
/*
//#ifndef CBMC
    for(i=0; i<H; i++){
	if(sha_out[i] != pkhash[i]){
	    assert(!pt_valid[SHA]||!pt_valid(pages[SHAO])||!pt_valid(pages[SHAI])||!pt_valid(RSA_KEYS)||!pt_valid(pages[BOOT]));
	    pass = FAIL;  // FAIL: key hash mismatch
	    fail("key hash mismatch");
	    return;
	}
    }
*/
/*     compind = nondet_uint() % (2*N); */
/*     assert(rsa_regs.exp[compind]==im->exp[compind]); */
/* #else */
/*     // key in image was incorrect, or image has been compromised */
/*     if(!key_val || !pt_valid(pages[BOOT]) || */
/*        !pt_valid(RSA_KEYS)) // keys copied incorrectly */
/*     { */
/* 	pass = FAIL; */
/* 	return; */
/*     } */
/* #endif */
}

// shaok - if image is valid and no interference, sha always passes
// shapass - if passes, then exp in RSA acc and image match
// shafail - if fails, then something was corrupted (sha out, sha in, rsa keys, or image)
// keylock - all locks up to key check pass *for full sizes*
