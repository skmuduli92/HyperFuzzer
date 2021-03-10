#include <iostream>
#include <verilated.h>
#include "secureboot.h"
#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"

#include "tamper.h"

#include <memory>
#include <string>

#include "formula.h"
#include "trace.h"
#include "parse_util.h"

// required for afl
static int fid = 0;
static std::stringstream oldss;

static ITamperer NoTamper;

int main() {
  // create top module
  Voc8051_Simulator sim(2, 1, 0);
  // parse the property
  HyperPLTL::PVarMap varmap(new HyperPLTL::VarMap());
  auto traceIdx = varmap->addPropVar(std::string("good"));
  auto f = HyperPLTL::parse_formula(std::string("(IMPLIES (O good.1) (O good.0))"), varmap);

  const int GOOD_DEBUG_ID = 0x12;
  sim.addVar(std::string("good"), traceIdx, GOOD_DEBUG_ID, Voc8051_Simulator::VarInfo::PROPOSITION, 0); 

  // afl init
  afl_init(&fid, &oldss);

  // filenames
  std::string romfile("../rom/aes_test_ecc_unsafe.dat");
  std::string imgfile;

  // first run.
  sim.run(NoTamper, romfile, imgfile);

  // second trace.
  BitTamperer tamper(0xE000 /* base addr */, 16 /* size */, 477 /*pc size */);
  sim.nextTrace();
  sim.run(tamper, romfile, imgfile);

  assert(sim.evaluate(f));

  // push coverage
  sim.copy_coverage();

  return 0;
}
