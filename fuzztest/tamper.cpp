#include <stdio.h>

#include "tamper.h"

#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"

// Default tamper function.
void ITamperer::tamper(Voc8051_tb* top) 
{
  // do nothing.
  (void) top;
}

void ITamperer::add_mem_access(unsigned int addr){
	mem_access[addr] = 0;
}

void OpcodeTamperer::tamper(Voc8051_tb* top)
{
  FILE *X;
  if (!tampered) {
    for(unsigned i=0; i < BUF_SIZE; i++) {
      uint8_t data = 0;
      if(fread(&data, sizeof(data), 1, stdin) != 1) {
        break;
      }
      X = fopen("X","a");
      char c[1];
      c[0] = data;
      fprintf(X,c);
      fclose(X);
      top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i + BASE_ADDR] = data;
    }
    tampered = true;
  }
}

void BitTamperer::tamper(Voc8051_tb* top)
{
  if (!tampered) {
    if(top->oc8051_tb__DOT__oc8051_top_1__DOT__pc == pc &
		    mem_access.count(index+BASE_ADDR)==1  ) {
      uint8_t orig_data = top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[index + BASE_ADDR];
      top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[index + BASE_ADDR] = orig_data ^ (1<<bit_num);
      tampered = true;
    }
  }
}

void FSMWriteTamperer::tamper(Voc8051_tb* top)
{
  if (!tampered) {
    const int BUF_SIZE = 16;
    unsigned i;
    for(i=0; i < BUF_SIZE; i++) {
      top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_addr[i] = 0;
      top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_data[i] = 0;
      top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_delay[i] = 0;
    }
    for(i=0; i < BUF_SIZE; i++) {
      uint16_t addr, delay;
      uint8_t data;
      if (fread(&addr, sizeof(addr), 1, stdin) != 1)  { break; }
      if (fread(&data, sizeof(data), 1, stdin) != 1)  { break; }
      if (fread(&delay, sizeof(delay), 1, stdin) != 1) { break; }
      printf("%hx -> %u @ %hu\n", addr, data, delay);
      top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_addr[i] = addr;
      top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_data[i] = data;
      top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_delay[i] = delay;
    }
    printf("read %d entries from tamper.\n", i);
    tampered = true;
  }
}

