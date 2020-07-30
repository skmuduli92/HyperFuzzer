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

#define GOOD_ID  0x1
#define BYTE0_ID 0x2
#define BYTE1_ID 0x3
#define BYTE2_ID 0x4
#define BYTE3_ID 0x5
#define BYTE4_ID 0x6

int main() {
  // create top module
  Voc8051_Simulator sim(2, 1, 5);

  // afl init
  afl_init(&fid, &oldss);

  // parse the property
  std::string good("good");
  std::string bytes[] = { "byte0", "byte1", "byte2", "byte3", "byte4" };
  HyperPLTL::PVarMap varmap(new HyperPLTL::VarMap());
  auto ti1 = varmap->addPropVar(good);
  auto ti2 = varmap->addIntVar(bytes[0]);
  auto ti3 = varmap->addIntVar(bytes[1]);
  auto ti4 = varmap->addIntVar(bytes[2]);
  auto ti5 = varmap->addIntVar(bytes[3]);
  auto ti6 = varmap->addIntVar(bytes[4]);
  auto f1 = HyperPLTL::parse_formula(std::string("(IMPLIES (O good.1) (O good.0))"), varmap);
  auto f2 = HyperPLTL::parse_formula(std::string("(IMPLIES (O good.1) (EQ byte0))"), varmap);
  auto f3 = HyperPLTL::parse_formula(std::string("(IMPLIES (O good.1) (EQ byte1))"), varmap);
  auto f4 = HyperPLTL::parse_formula(std::string("(IMPLIES (O good.1) (EQ byte2))"), varmap);
  auto f5 = HyperPLTL::parse_formula(std::string("(IMPLIES (O good.1) (EQ byte3))"), varmap);
  auto f6 = HyperPLTL::parse_formula(std::string("(IMPLIES (O good.1) (EQ byte4))"), varmap);

  sim.addVar(good,   ti1, GOOD_ID,  Voc8051_Simulator::VarInfo::PROPOSITION, 0); 
  sim.addVar(bytes[0], ti2, BYTE0_ID, Voc8051_Simulator::VarInfo::TERM, 0); 
  sim.addVar(bytes[1], ti3, BYTE1_ID, Voc8051_Simulator::VarInfo::TERM, 0); 
  sim.addVar(bytes[2], ti4, BYTE2_ID, Voc8051_Simulator::VarInfo::TERM, 0); 
  sim.addVar(bytes[3], ti5, BYTE3_ID, Voc8051_Simulator::VarInfo::TERM, 0); 
  sim.addVar(bytes[4], ti6, BYTE4_ID, Voc8051_Simulator::VarInfo::TERM, 0); 

  // filenames
  std::string romfile("../rom/sha_test.dat");
  std::string imgfile;

  // first run.
  sim.run(NoTamper, romfile, imgfile);

  // second run.
  FSMWriteTamperer tamper;
  sim.nextTrace();
  sim.run(tamper, romfile, imgfile);

  assert(sim.evaluate(f1));
  assert(sim.evaluate(f2));
  assert(sim.evaluate(f3));
  assert(sim.evaluate(f4));
  assert(sim.evaluate(f5));
  assert(sim.evaluate(f6));

  // push coverage
  sim.copy_coverage();

  return 0;
}
