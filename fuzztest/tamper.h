#ifndef _TAMPER_H_DEFINED_
#define _TAMPER_H_DEFINED_

#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"

// Interface for tampering.
struct ITamperer {
    virtual void tamper(Voc8051_tb* top);
};

// Opcode Tamperer
struct OpcodeTamperer : public ITamperer {
  const unsigned BASE_ADDR;
  const unsigned BUF_SIZE;

  OpcodeTamperer(unsigned baseaddr, unsigned bufsz)
    : BASE_ADDR(baseaddr)
    , BUF_SIZE(bufsz)
  {
  }

  virtual void tamper(Voc8051_tb* top);
};

// FSM Write tamperer.
struct FSMWriteTamperer : public ITamperer {
  virtual void tamper(Voc8051_tb* top);
};

#endif
