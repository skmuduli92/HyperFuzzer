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
unsigned char mem[4];
#endif

XDATA_ARR(0x5000, 2, unsigned char, boot);

/*---------------------------------------------------------------------------*/
void main() {
#ifdef CBMC
   unsigned char before, after;
   const unsigned int compind = nondet_uint()%2;
#endif
#ifdef C
   // put new arrays into pt
   int page;
   boot = mem_add(2);
   page = pt_add(boot, 2);
#endif

   // initialize memory
   unlock(page, boot, boot+2);
   pt_reset(page);
   writec(page, boot+compind, nondet_uchar(), 1);
   before = boot[compind];

   // something might break the image here
   if(nondet_uint())
       writec(nondet_uint(), nondet_ptr(), nondet_uchar(), 0);

   // image is loaded.
   // now we need to lock boot
   lock(page, boot, boot+2);
   //before = boot[compind];
   //before = pt_valid(page);

   if(nondet_uchar())
       unlock(nondet_int(), nondet_ptr(), nondet_ptr());

   if(nondet_uchar())
       writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);
   if(nondet_uchar())
       writec(nondet_int(), nondet_ptr(), nondet_uchar(), 1);
   //after = pt_valid(page);
   after = boot[compind];
   //assert(after==before);
   assert(pt_lockchange(page) || !pt_valid(page) || before==after); // locks
   // assert(before != after || pt_valid(page) && pt_lockchange(page)); // fail b/c overapproximation
}

// lockover - abstraction is overapproximation
// lock - locking works, super simple
// nolock - sanity check, fails with no lock
// lockval - page valid bit works.
// locks - everything
