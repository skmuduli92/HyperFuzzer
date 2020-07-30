#ifndef RSA_H
#define RSA_H

#ifdef CBMC
#ifndef C
#define C
#endif
#endif

#ifdef C
#define MEM_SIZE (MAX_IM_SIZE*2 + MAX_PRG_SIZE + 4*N + 2*H + 0x40 + 3*sizeof(struct acc_regs))
#define FRONT (MAX_PRG_SIZE + MAX_IM_SIZE)
#define GAP   (0x10000-MEM_SIZE)
#define XDATA_VAR(addr, type, name) type* name
#define XDATA_ARR(addr, size, type, name) type* name
#define XDATA
#define CODE
#else
#define XDATA_VAR(addr, type, name) __xdata __at(addr) type name
#define XDATA_ARR(addr, size, type, name) __xdata __at(addr) type name[size]
#define XDATA __xdata
#define CODE __code
#endif
/*
#ifdef CBMC 
#define MAX_PRG_SIZE 80
#define MAX_IM_SIZE  70
#define N 16
#define H 4
#define K1 4
#define K2 4
#else*/
#define MAX_PRG_SIZE 0x3000
#define MAX_IM_SIZE  0x2000
#define N 256
#define H 20
#define K1 16
#define K2 16
//#endif

#ifdef C
// pages in pt
#define MEMWR    0
#define RSA_M    1
#define RSA_KEYS 2
#define RSA      3
#define SHA      4

unsigned char* mem_add(unsigned int size);
int pt_add(unsigned char* start, unsigned int size);
int pt_valid(int page);
int pt_lockchange(int page);
int pt_reset(int page);
int pt_find(unsigned char* start);
int writec(int page, unsigned char* addr, unsigned char data, unsigned char trusted);
int writecarr(int page, unsigned char* addr, unsigned char* data, unsigned int len);
int writeptr(int page, unsigned char** addr, unsigned char* data);
int lock(int page, unsigned char* startaddr, unsigned char* endaddr);
int unlock(int page, unsigned char* startaddr, unsigned char* endaddr);
#else
#define pt_reset(page) 
#define writec(page, addr, data, trusted) *(addr) = data
#define writecarr(page, addr, data, len) for(i=0; i<len; i++) (addr)[i]=(data)[i]
#define writei(page, addr, data) *(addr) = data;
#define writeptr(page, addr, data) *(addr) = data
#define lock(page, start, end) lock_wr(start, end)
#define unlock(page, start, end) unlock_wr(start, end)

int unlock_wr(unsigned char* startaddr, unsigned char* endaddr);
int lock_wr(unsigned char* startaddr, unsigned char* endaddr);
#endif

#ifndef CBMC
#define assert(exp) 
#endif

struct RSAmsg{
    unsigned char padbyte;
    unsigned char m[N-K2-K1-1];
    unsigned char zeros[K1];
    unsigned char r[K2];
};

struct acc_regs{
    unsigned char start;
    unsigned char state;
    XDATA unsigned char *rd_addr;
    XDATA unsigned char *wr_addr;
    unsigned int len;
};

struct RSA_regs{
    struct RSAmsg m;
    unsigned char exp[N];
    unsigned char n[N];
    unsigned char start;
    unsigned char state;
    unsigned char *opaddr;
};
#ifdef C
extern unsigned char mem[];
#define sha_regs (*sha_ptr)
#define memwr_regs (*memwr_ptr)
#define rsa_regs (*rsa_ptr)
#else
#define sha_ptr sha_regs
#define memwr_ptr memwr_regs
#define rsa_ptr rsa_regs
#endif

#ifdef CBMC
extern unsigned char valid;
#endif

extern XDATA_VAR(0xFE00, struct acc_regs, sha_ptr);
extern XDATA_VAR(0xF9F0, struct acc_regs, memwr_ptr);
extern XDATA_VAR(0xFA00, struct RSA_regs, rsa_ptr);

unsigned char* mem_add(unsigned int size);
void pt_init(void);
unsigned char RSAinit(unsigned char* rsa_out, unsigned char* sha_in, unsigned char* sha_out);
void load(unsigned char* data, unsigned int length, unsigned char* startaddr, unsigned char skipread);
void sha1(unsigned char *m, unsigned int len);
unsigned char verifySignature(unsigned char* msg, unsigned int len, unsigned char* signature);

#endif
