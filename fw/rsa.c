#include "rsa.h"
#include <8051.h>

XDATA_VAR(0xFE00, struct acc_regs, sha_ptr);
XDATA_VAR(0xF9F0, struct acc_regs, memwr_ptr);
XDATA_VAR(0xFA00, struct RSA_regs, rsa_ptr);
struct RSAmsg *decrypted;
XDATA unsigned char *sha_m;
XDATA unsigned char *hash;





XDATA_ARR(0xFF80, 32, unsigned char, pt_wren);
XDATA_ARR(0xFFA0, 32, unsigned char, pt_rden);


// state of PRG for G in OAEP
XDATA_ARR(0xF8E0, H, unsigned char, gprg);



#define c_load(skipread)
#define c_sha(len)
#define c_exp()

// for locking and unlocking memory
// lock/unlock the pages spanning [startaddr, endaddr)
// return 1 if succeed, 0 if fail
int lock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
    // index of pt_wren
    unsigned int curr = (unsigned int)startaddr >> 11;
    unsigned int end = (unsigned int)endaddr-1 >> 11;
    // range of pages in pt_wren[i]
    unsigned int lowpage = (unsigned int)startaddr >> 8 & 7;
    unsigned int highpage = (unsigned int)endaddr-1 >> 8 & 7;

    // no memory in range
    if(startaddr > endaddr)
	return 0;

    // all pages are in the same index of pt_wren
    if(curr == end)
	pt_wren[curr] &= (1 << highpage+1) - (1 << lowpage) ^ 0xFF;
    else{
	// don't unlock pages below lowpage
	pt_wren[curr] &= (unsigned char)(0xFF << lowpage & 0xFF);
	for(;curr < end; curr++)
	    pt_wren[curr] = 0x00;
	// don't unlock pages above highpage
	pt_wren[end] &= (1 << highpage+1) - 1 ^ 0xFF;
    }
    return 1;
}

int unlock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
    unsigned int curr = (unsigned int)startaddr >> 11;
    unsigned int end = (unsigned int)endaddr-1 >> 11;
    unsigned int lowpage = (unsigned int)startaddr >> 8 & 7;
    unsigned int highpage = (unsigned int)endaddr-1 >> 8 & 7;

    if(startaddr >= endaddr)
	return 0;

    // similar to lock, except OR replaces AND, and the bits to write are flipped
    if(curr == end)
	pt_wren[curr] |= (1 << highpage+1) - (1 << lowpage);
    else{
	pt_wren[curr] |= (unsigned char)(0xFF << lowpage & 0xFF);
	for(;curr < end; curr++)
	    pt_wren[curr] = 0xFF;
	pt_wren[end] |= (1 << highpage+1) - 1;
    }
    return 1;
}


// initialize pt with registers and state arrays
void pt_init()
{

    unsigned int i;
    for(i=0; i<32; i++){
	pt_rden[i] = 0xFF;
    }

}

// set input and output addresses of HW accelerators
// these should not be changed for the duration of secureboot
unsigned char RSAinit(unsigned char* rsa_out, unsigned char* sha_in, unsigned char* sha_out)
{
    decrypted = (struct RSAmsg*)rsa_out;
    sha_m = (XDATA unsigned char*)sha_in;
    hash = (XDATA unsigned char*)sha_out;

    return 1;
}
// set up data transfer
// copy data of length bytes to startaddr
// if skipread, don't read from data, just write values already in memwr buffer to startaddr
void load(unsigned char* data, unsigned int length, unsigned char* startaddr, unsigned char skipread)
{
      unsigned int i;
      if (skipread==0)
      {
            for ( i = 0; i < length; i++) {
                  startaddr[i] = data[i];
            }
            // P0 = 0xaf;
            return;
      }

    writeptr(MEMWR, &memwr_regs.rd_addr,(XDATA unsigned char*)data);
    writeptr(MEMWR, &memwr_regs.wr_addr, (XDATA unsigned char*)startaddr);
    writei(MEMWR, &memwr_regs.len, length);
    writec(MEMWR, &memwr_regs.start, (unsigned char)(skipread << 1 | 1), 1); // load in HW

    //c_load(skipread);  // load in SW

    // wait for load to finish
    while(memwr_regs.state != 0);

}

// returns length of message
int unpad()
{
  int len;

  for(len = sizeof(rsa_regs.m.m)-1; len>=0; len--)
  {
      if(decrypted->m[len] == 1)
	  break;
      else if(decrypted->m[len] != 0)
	  return -1;
  }
  return len;
}

// set up message and compute SHA
void sha1(unsigned char *m, unsigned int len)
{
    unsigned int i;
    unsigned int mlen;

    // for ( k = 0; k < len; k++) {
    //   P1 = m[k];
    // }
    // addresses have changed
    if(sha_regs.rd_addr != sha_m || sha_regs.wr_addr != hash)
    {

	return;
    }

    // setup data
    mlen = ((len+4+4) & 0xFFC0) + 64; // round len+5 up to multiple of 64

    unlock(pshai, sha_m, sha_m+mlen);

    if(m != sha_m && len > 0) // don't copy if already in right address
      load(m,len,sha_m,0);
    // for ( k = 0;mlen==320 && k < len; k++) {
    //   P1 = sha_m[k];
    //   P1 = 1;
    // }
	//writecarr(pshai, sha_m, m, len);
// To check whether the loaded data is same as module[1]
// if(len == 184){
//       for ( i = 0; i < len; i++) {
//             P2 = sha_m[i];
//       }
// }
    // add 100.. padding
    writec(pshai, sha_m+len, 0x80, 1);
    unlock_wr(sha_m+len,sha_m+mlen);
    for(i=len+1; i<mlen; i++)
    {
          sha_m[i] = 0;
          // writec(pshai, sha_m+i, 0, 1);
   }


    // insert length in bits
    writec(pshai, sha_m+mlen-1, (len << 3) & 0xFF, 1);
    writec(pshai, sha_m+mlen-2, (len >> 5) & 0xFF, 1);
    writec(pshai, sha_m+mlen-3, (len >> 13) & 0xFF, 1);
    // encrypt with sha1
    lock(pshai, sha_m, sha_m+mlen);

    unlock(pshao, hash, hash+H);
    unlock(SHA, &sha_regs.start, (unsigned char*)(&sha_regs.len));

    writei(SHA, &sha_regs.len, mlen);
    writec(SHA, &sha_regs.start, 1, 1);  // start HW
    c_sha(len);         // do SW
    P1 = 0xff;
    // P1 = mlen;
    // P1 = mlen>>8;
    while(sha_regs.state != 0);

    lock(SHA, &sha_regs.start, (unsigned char*)(&sha_regs.len));
    lock(pshao, hash, hash+H);


}

// HMAC computed and written to sha_regs.wr_addr
void HMAC(const unsigned char *key, unsigned int klen, const unsigned char *message, unsigned int mlen)
{
    unsigned int i;

    // inner hash
    unlock(pshai, sha_m, sha_m+mlen+64);
    for(i=0; i<klen; i++)
	writec(pshai, sha_m+i, key[i] ^ 0x36, 1);
    for(i=klen; i<64;i++)
	writec(pshai, sha_m+i, 0x36, 1);
    for(i=0; i<mlen; i++)
	writec(pshai, sha_m+i+64, message[i], 1);

    sha1(sha_m, 64+mlen);

    // outer hash
    unlock(pshai, sha_m, sha_m+84);
    for(i=0; i<klen; i++)
	writec(pshai, sha_m+i, key[i] ^ 0x5c, 1);
    for(i=klen; i<64;i++)
	writec(pshai, sha_m+i, 0x5c, 1);
    for(i=0; i<H; i++)
	writec(pshai, sha_m+i+64, hash[i], 1);

    sha1(sha_m, 64 + H);

}

// copy seed into the PRG state
void PRGinit(unsigned char *seed, unsigned int slen, unsigned char *state)
{
    unsigned int i;

    if(slen > H) slen = H;
    unlock(page, state, state+H);
    load(seed,slen,state,0);
    //writecarr(page, state, seed, slen);
    for(i=slen; i<H; i++)
	writec(page, state+i, 0, 1);
    lock(page, state, state+H);
}

// random zero and one for PRG
const unsigned char zero[] = {0x98, 0xBC, 0x1B, 0x58,
			     0xC2, 0x5B, 0x7B, 0x51,
			     0x48, 0x14, 0x83, 0xA7,
			     0xEA, 0xDB, 0x15, 0x2E,
			     0xCE, 0x7A, 0xE1, 0x0C,
			     0xF7, 0x1D, 0x96, 0xDE,
			     0xDE, 0x16, 0x68, 0x61,
			     0x48, 0x25, 0x99, 0x66};

const unsigned char one[] = {0xA2, 0x66, 0x95, 0x53,
			     0x0E, 0x13, 0x56, 0xA9,
			     0xDF, 0x42, 0x6F, 0x0F,
			     0x74, 0xA4, 0x06, 0xFF,
			     0xA0, 0x6D, 0x07, 0x17,
			     0x30, 0xAE, 0x16, 0xD2,
			     0x87, 0x76, 0x8A, 0x9B,
			     0x92, 0xAE, 0x36, 0xB9};


// generate random number, put in hash
void PRG(unsigned char* state)
{
    unsigned int i;
    unsigned char next[H];

    // compute next state
    HMAC(state, H, one, 32);
    for(i=0; i<H; i++)
	next[i] = sha_regs.wr_addr[i];

    // compute next output
    HMAC(state, H, zero, 32);
    unlock(page, state, state+H);
    //writecarr(page, state, next, H);
    load(next,H,state,0);
    lock(page, state, state+H);
}

// seed for computing H function in OAEP
const unsigned char Hseed[] = {
    0x66, 0x02, 0x5D, 0xC9,
    0x80, 0x48, 0xA5, 0x9F,
    0x2C, 0xB3, 0xAA, 0x6C,
    0x1A, 0x81, 0xA9, 0xAA,
    0xE8, 0x93, 0x21, 0x0E/*,
    0x24, 0x99, 0x6F, 0x06,
    0xEB, 0xC0, 0x4F, 0x3A,
    0x0D, 0x2F, 0x8F, 0x0A*/
};

// remove OAEP from message at location rsa_regs.opaddr
void removeOAEP()
{
    unsigned int i,j;

    // compute r
    HMAC(Hseed, H, decrypted->m, N-K2-1);
    // copy r to message
    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr + N);
    for(i=0; i< K2; i++)
	writec(prsao, decrypted->r+i,decrypted->r[i] ^ sha_regs.wr_addr[i], 1);
    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);

    // find m
    PRGinit(decrypted->r, K2, gprg);
    PRG(gprg);
    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr + N);
    i=0; j=0;
    while(i < N-K2-1)
    {
	if(j == H)
	{
	    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);
	    PRG(gprg);
	    j = 0;
	    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr + N);
	}
	writec(prsao, decrypted->m+i, decrypted->m[i] ^ sha_regs.wr_addr[j], 1);
	i++;
	j++;
    }
    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);
}

// decrypt msg, puts decrypted text in rsa_regs.opaddr
// returns length of decrypted message
int decrypt(unsigned char* msg){
    //unsigned int i;

    if(rsa_regs.opaddr != (unsigned char*)decrypted)
	return -1;

    // copy msg into RSA m register
    if(msg != (unsigned char*)&rsa_regs.m)
    {

	unlock(RSA_M, (unsigned char*)&rsa_regs.m, (unsigned char*)&rsa_regs.m+N);
	load(msg, N, (unsigned char*)&rsa_regs.m, 0);
	//writecarr(RSA_M, (unsigned char*)&rsa_regs.m, msg, N);

	// lock message during exponentiation
	lock(RSA_M, (unsigned char*)&rsa_regs.m, (unsigned char*)&rsa_regs.m + N);
    }

    // decrypt
    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);

    unlock(RSA, &rsa_regs.start, (unsigned char*)(&rsa_regs.state+1));

    writec(RSA, &rsa_regs.start, 1, 1);
    if(rsa_regs.opaddr != (unsigned char*)decrypted)
	return -1;
    c_exp();  // c abstraction

    while(rsa_regs.state != 0);

    lock(RSA, &rsa_regs.start, (unsigned char*)(&rsa_regs.state+1));
    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);


    // check pad byte
    if(decrypted->padbyte != 1)
	return -1;

    removeOAEP();

    return unpad();

}

unsigned char verifySignature(unsigned char* msg, unsigned int len, unsigned char* signature){
    unsigned int i;
    int slen;

    // decrypt the signature
    slen = decrypt(signature);

    // compare with hash of msg
    if(slen != H)
	return 0;
    sha1(msg, len);

    for(i=0; i<H; i++){
	if(sha_regs.wr_addr[i] != decrypted->m[i])
	    return 0;
    }
    return 1;

}
