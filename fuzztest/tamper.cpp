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

void OpcodeTamperer::tamper(Voc8051_tb* top)
{
  for(unsigned i=0; i < BUF_SIZE; i++) {
    uint8_t data = 0;
    if(fread(&data, sizeof(data), 1, stdin) != 1) {
        break;
    }
    top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i + BASE_ADDR] = data;
  }
}

void FSMWriteTamperer::tamper(Voc8051_tb* top)
{
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
}

