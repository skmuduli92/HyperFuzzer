#ifndef _TAMPER_H_DEFINED_
#define _TAMPER_H_DEFINED_

#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"
#include <map>
// Interface for tampering.
struct ITamperer {
    virtual void tamper(Voc8051_tb* top);
    void add_mem_access(unsigned int);
    std::map<unsigned int, unsigned int> mem_access;
};

// Opcode Tamperer
struct OpcodeTamperer : public ITamperer {
  const unsigned BASE_ADDR;
  const unsigned BUF_SIZE;
  bool tampered;

  OpcodeTamperer(unsigned baseaddr, unsigned bufsz)
    : BASE_ADDR(baseaddr)
    , BUF_SIZE(bufsz)
    , tampered(false)
  {
  }

  virtual void tamper(Voc8051_tb* top);
};

struct BitTamperer : public ITamperer {
  const unsigned BASE_ADDR;
  const unsigned BUF_SIZE;
  const unsigned PC_SIZE;
  uint8_t index =0, bit_num=0, pc =0;
  bool tampered;

  BitTamperer(unsigned baseaddr, unsigned bufsz, unsigned pcsz)
    : BASE_ADDR(baseaddr)
    , BUF_SIZE(bufsz)
    , PC_SIZE(pcsz)
    , tampered(false)
  {
    if(fread(&pc, sizeof(pc), 1, stdin) != 1) {
      pc = pc % PC_SIZE;
      return;
    }
    if(fread(&index, sizeof(index), 1, stdin) != 1) {
      index = index % BUF_SIZE;
      return;
    }
    if(fread(&bit_num, sizeof(bit_num), 1, stdin) != 1) {
      bit_num = bit_num % 8;
      return;
    }
  }

  virtual void tamper(Voc8051_tb* top);
};


// FSM Write tamperer.
struct FSMWriteTamperer : public ITamperer {
  bool tampered;
  FSMWriteTamperer() : tampered(false) {}

  virtual void tamper(Voc8051_tb* top);

};

#endif
