#include <8051.h>

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

#define N 256
#define K1 16
#define K2 16

__xdata __at(0xFF80) unsigned char pt_wren[32];
__xdata __at(0xFFA0) unsigned char pt_rden[32];

__xdata __at(0xF9F0) unsigned char memwr_reg_start;
__xdata __at(0xF9F1) unsigned char memwr_reg_state;
__xdata __at(0xF9F2) unsigned int memwr_reg_rd_addr;
__xdata __at(0xF9F4) unsigned int memwr_reg_wr_addr;
__xdata __at(0xF9F6) unsigned int memwr_reg_len;

__xdata __at(0x5000) unsigned char boot[0x2000];

__xdata __at(0xFE00) unsigned char sha_reg_start;
__xdata __at(0xFE01) unsigned char sha_reg_state;
__xdata __at(0xFE02) unsigned int sha_reg_rd_addr;
__xdata __at(0xFE04) unsigned int sha_reg_wr_addr;
__xdata __at(0xFE06) unsigned int sha_reg_len;

__xdata __at(0xC000) unsigned char sha_in[0x2080];
__xdata __at(0xE080) unsigned char sha_out[20];
__xdata __at(0xE100) unsigned char rsa_out[N];

__xdata __at(0xFD00) unsigned char exp_reg_start;
__xdata __at(0xFD01) unsigned char exp_reg_state;
__xdata __at(0xFD02) unsigned int  exp_reg_opaddr;
__xdata __at(0xFC00) unsigned char exp_reg_n[N];
__xdata __at(0xFB00) unsigned char exp_reg_exp[N];
__xdata __at(0xFA00) struct RSAmsg exp_reg_m;

// state of PRG for R and G in OAEP
__xdata __at(0xFD10) unsigned char rprg[20];
__xdata __at(0xFD30) unsigned char gprg[20];

struct RSAmsg{
    unsigned char padbyte;
    unsigned char m[N-K2-K1-1];
    unsigned char zeros[K1];
    unsigned char r[K2];
};

struct modules{
    unsigned int addr;
    unsigned int size;
    unsigned char hash[20];
};

struct image{
    unsigned char sig[N];  // signature of header
    unsigned char exp[N];
    unsigned char mod[N];  // n in modexp
    unsigned int num;      // total number of blocks
    struct modules module[1];
};

struct RSAmsg *decrypted;
unsigned char *hash;
unsigned char *data;


// set up RSA
void RSAinit();
// encrypt msg and put result in exp_reg_opaddr
void encrypt(unsigned char* msg, unsigned int len);
// decrypt msg and put result in exp_reg_opaddr->m
int decrypt(unsigned char* msg);
// sign message, put signature in exp_reg_opaddr
void sign(unsigned char* message, unsigned int len);
// verify that msg matches sign, ret 1 if match, 0 if not
unsigned char verifySignature(unsigned char* msg,unsigned int len, unsigned char* sign);

void pad(unsigned int len);
int unpad();
void sha1(unsigned char *m, unsigned int len);
void HMAC(unsigned char *key, unsigned int klen, unsigned char *message, unsigned int mlen);
void PRGinit(unsigned char *seed, unsigned int slen, unsigned char *state);
void PRG(unsigned char *prg);
void OAEP();
int removeOAEP();

// copy length bytes from data in XRAM to startaddr
void load(unsigned char* data, unsigned int length, unsigned int startaddr, unsigned char skipread);


// set up data transfer
void load(unsigned char* data, unsigned int length, unsigned int startaddr,
	  unsigned char skipread)
{
    memwr_reg_rd_addr = (unsigned int)data;
    memwr_reg_wr_addr = startaddr;
    memwr_reg_len = length;
    memwr_reg_start = (unsigned char)(skipread << 1 | 1);

    // wait for load to finish
    while(memwr_reg_state != 0);
}

void RSAinit()
{
    decrypted = (__xdata struct RSAmsg*)exp_reg_opaddr;
    hash = (__xdata unsigned char*)sha_reg_wr_addr;
    data = (__xdata unsigned char*)sha_reg_rd_addr;
}

void pad(unsigned int len)
{
    unsigned int i;

    exp_reg_m.m[len] = 1;
    for(i=len+1; i < sizeof(exp_reg_m.m); i++)
	exp_reg_m.m[i] = 0;
}

// returns length of message
int unpad()
{
    int len;

    for(len = sizeof(exp_reg_m.m)-1; len>=0; len--)
    {
	if(decrypted->m[len] == 1)
	    break;
	else if(decrypted->m[len] != 0)
	    return -1;
    }
    return len;
}

// set up message for sha
void sha1(unsigned char *m, unsigned int len)
{
    unsigned int i;
    unsigned int mlen;

    // setup data
    mlen = ((len+4) & 0xFFC0) + 64; // round len+5 up to multiple of 64
    sha_reg_len = mlen;


    if((unsigned int)m != sha_reg_rd_addr) // don't copy if already in right address
	load(m, len, sha_reg_rd_addr, 0); // copy m

    // add 100.. padding
    data[len] = 0x80;

    for(i=len+1; i<mlen; i++)
	data[i] = 0;

    // insert length in bits
    data[mlen-1] = (len << 3) & 0xFF;
    data[mlen-2] = (len >> 5) & 0xFF;
    data[mlen-3] = (len >> 13) & 0xFF;

    // encrypt with sha1
    sha_reg_start = 1;
    while(sha_reg_state != 0);
}

void HMAC(unsigned char *key, unsigned int klen, unsigned char *message, unsigned int mlen)
{
    unsigned int i;

    // inner hash
    for(i=0; i<klen; i++)
	data[i] = key[i] ^ 0x36;
    for(i=klen; i<64;i++)
	data[i] = 0x36;
    for(i=0; i<mlen; i++)
	data[i+64] = message[i];

    sha1(data, 64+mlen);

    // outer hash
    for(i=0; i<klen; i++)
	data[i] = key[i] ^ 0x5c;
    for(i=klen; i<64;i++)
	data[i] = 0x5c;
    for(i=0; i<20; i++)
	data[i+64] = hash[i];
    sha1(data, 84);
}

// copy seed into the PRG state
void PRGinit(unsigned char *seed, unsigned int slen, unsigned char *state)
{
    unsigned int i;
    for(i=0; i<slen && i < 20; i++)
	state[i] = seed[i];
    for(i=slen; i<20; i++)
	state[i] = 0;
}

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
    unsigned char next[20];

    HMAC(state, 20, one, 32);
    for(i=0; i<20; i++)
	next[i] = hash[i];

    HMAC(state, 20, zero, 32);
    for(i=0; i<20; i++)
	state[i] = next[i];
}

// seed for generating R in OAEP
const unsigned char rseed[] = {
    0x14, 0xb8, 0xfb, 0x04,
    0x98, 0x43, 0x98, 0xa2,
    0x35, 0xd0, 0x3e, 0xca,
    0x38, 0xd9, 0x41, 0xaf,
    0x00, 0x00, 0x00, 0x00
};

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

void OAEP()
{
    unsigned int i,j;

    // K1 0s
    for(i=0; i<K1; i++)
	exp_reg_m.zeros[i] = 0;

    // do G to compute X
    PRG(rprg); // generate new r and write it to hash
    for(i=0; i<K2; i++)
	exp_reg_m.r[i] = hash[i];
    PRGinit(hash, K2, gprg);
    PRG(gprg);
    i=0; j=0;
    while(i < N-K2-1)
    {
	if(j == 20)
	{
	    PRG(gprg);
	    j = 0;
	}
	exp_reg_m.m[i] = exp_reg_m.m[i] ^ hash[j];
	i++;
	j++;
    }

    // do H to compute Y
    HMAC(Hseed, 20, exp_reg_m.m, N-K2-1);
    for(i=0; i<K2; i++)
	exp_reg_m.r[i] = exp_reg_m.r[i] ^ hash[i];

    exp_reg_m.padbyte = 1; // marker byte
}

// remove OAEP from message at location exp_reg_opaddr
// return 1 if succeed, 0 if fail
int removeOAEP()
{
    unsigned int i,j;

    // find r
    HMAC(Hseed, 20, decrypted->m, N-K2-1);
    for(i=0; i< K2; i++)
	decrypted->r[i] = decrypted->r[i] ^ hash[i];

    // find m
    PRGinit(decrypted->r, K2, gprg);
    PRG(gprg);
    i=0; j=0;
    while(i < N-K2-1)
    {
	if(j == 20)
	{
	    PRG(gprg);
	    j = 0;
	}
	decrypted->m[i] = decrypted->m[i] ^ hash[j];
	i++;
	j++;
    }

    // check zeros
    for(i = 0; i< K1; i++)
	if(decrypted->zeros[i])
	    return 0;
    return 1;
}

// encrypt message, len bytes
void encrypt(unsigned char* msg, unsigned int len){
    unsigned int i;

    if(msg != exp_reg_m.m)
	for (i=0; i<len; i++)
      {
            P0 = 0xa3;
	    exp_reg_m.m[i] = msg[i];
      }
    pad(len);
    //OAEP();

    exp_reg_start = 1;  // start encryption
    while(exp_reg_state != 0);  // wait for encryption to finish
}

// decrypt msg, puts decrypted text in exp_reg_opaddr
// returns length of decrypted message
int decrypt(unsigned char* msg){
    unsigned int i;

    if(msg != (unsigned char*)exp_reg_m)
	for(i=0; i<N; i++)
	    ((unsigned char*)exp_reg_m)[i] = msg[i];
    // decrypt
    exp_reg_start = 1;
    while(exp_reg_state != 0);

    // check pad byte
    if(decrypted->padbyte != 1) return 0;

    /*if(!removeOAEP())
	return -1;
*/
    return unpad();
}
const unsigned char SIGNSEED[] = {
    0x22, 0x1B, 0x35, 0xA1,
    0xC2, 0x30, 0x6A, 0x0B,
    0xF6, 0xDA, 0xDE, 0x2C,
    0x7A, 0x2D, 0x58, 0x42,
    0x4C, 0xED, 0x43, 0x13,
    0x5E, 0x71, 0x6D, 0xA4,
    0x80, 0xBE, 0x9D, 0x47,
    0x4A, 0x9A, 0xAC, 0xA8
};

void sign(unsigned char* message, unsigned int len){
P0 = 5;
    sha1(message, len);

    //HMAC(SIGNSEED, 32, message, len);
    encrypt(hash,20);
}

unsigned char verifySignature(unsigned char* msg, unsigned int len, unsigned char* signature){
    unsigned int i;
    unsigned int slen;

    // decrypt the signature
    slen = decrypt(signature);

    // compare with hash of msg
    if(slen != 20) return 0;
    else{
	sha1(msg, len);
	//HMAC(SIGNSEED, 32, msg, len);
	for(i=0; i<slen; i++){
	    P0 = decrypted->m[i];
	    if(hash[i] != decrypted->m[i])
		return 0;
	}
	P0 = 0xFF;
	return 1;
    }
}

int good = 1;

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

void main() {
    unsigned int i;
    unsigned int size;
    unsigned int num;
    struct image* im;

    // enable reading and writing everywhere for now
    for(i=0; i<32; i++)
    {
	pt_wren[i]=0xFF;
	pt_rden[i]=0xFF;
    }

    // load some data
    load(0, 0x2000, (unsigned int)&boot, 1);
    im  = (struct image*)boot;
    num = im->num;  // number of modules
    // sizeof image struct includes extra signature and first module
    size = sizeof(struct image) - ((unsigned int)&(im->exp) -(unsigned int)im) + sizeof(struct modules) * (num-1);

    // set SHA read and write addresses
    sha_reg_rd_addr = (unsigned int)&sha_in;

    sha_reg_wr_addr = (unsigned int)&sha_out;

    // set up RSA
    exp_reg_opaddr = (unsigned int)&rsa_out;  // set up address to write to

    RSAinit();

    // set signature modulus
    for(i=0; i<N; i++)
	exp_reg_n[i] = im->mod[i];

    // set signature key
    for(i=0; i<N; i++)
	exp_reg_exp[i] = im->exp[i];

          // verify signature
          /*if(!verifySignature(im->exp, size, im->sig))
          {
      	P0 = 0;
            P1 = 0x55;
      	quit();
          }*/


    // sign header
    //PRGinit(rseed, 20, rprg);

    sign(im->exp, size);


    // check for signature match
    for(i=0; i<N; i++)
    {
	//P0 = ((unsigned char*)decrypted)[i];
	if(((unsigned char*)decrypted)[i] != im->sig[i])
	{
            P1 = ((unsigned char*)decrypted)[i];
            P2 = im->sig[i];
	    good = 0;
	    break;
	}
    }

    P0 = good;
    quit();
}
