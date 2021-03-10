#include <verilated.h>
#include <iostream>
#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"
#include "secureboot.h"

#include "tamper.h"

#include <memory>
#include <string>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

// debug indeces
#define VERIF_HEADER_SIGN 0x01
#define VERIF_BLOCK_HASH 0x02

#define HEADER_DATA_VAR 0x03
#define BLOCK0_ID 0x04
#define BLOCK1_ID 0x05

// required for afl
static int fid = 0;
static std::stringstream oldss;

static ITamperer NoTamper;

int main() {
  // create top module
  // sim (#traces, #props, #vars)
  Voc8051_Simulator sim(2, 3, 3);

  // parse the property
  std::string verif_sign = "verif";
  std::string block_check = "block_check";
  std::string header_data = "headerdata";
  std::string block0 = "block0";
  std::string block1 = "block1";

  HyperPLTL::PVarMap varmap(new HyperPLTL::VarMap());
  auto verif_sign_propID = varmap->addPropVar(verif_sign);
  auto block_check_propID = varmap->addPropVar(block_check);

  auto header_data_termID = varmap->addArrayVar(header_data);
  auto block0_termID = varmap->addArrayVar(block0);
  auto block1_termID = varmap->addArrayVar(block1);

  auto valid_sign =
      HyperPLTL::parse_formula(std::string("(IMPLIES (O verif.1) (O verif.0))"), varmap);

  auto valid_header_data =
      HyperPLTL::parse_formula(std::string("(IMPLIES (O verif.1) (G (EQ headerdata)))"), varmap);

  auto valid_block_hash = HyperPLTL::parse_formula(
      std::string("(IMPLIES (O block_check.1) (O block_check.0))"), varmap);

  // checking if the block1 data are equal after being loaded to target location
  std::string valid_block_prop = "(IMPLIES (O block_check.1) (G (AND (EQ block0) (EQ block1))))";
  auto valid_block = HyperPLTL::parse_formula(valid_block_prop, varmap);

  sim.addVar(verif_sign, verif_sign_propID, VERIF_HEADER_SIGN,
             Voc8051_Simulator::VarInfo::PROPOSITION, 0);

  sim.addVar(block_check, block_check_propID, VERIF_BLOCK_HASH,
             Voc8051_Simulator::VarInfo::PROPOSITION, 0);

  const int XRAM_BASE = 0x3000;
  // blocka and header data for aes_test payload

  uint32_t header_size = sizeof(unsigned int) + (3 * 256);
  sim.addArrayVar(header_data, header_data_termID, HEADER_DATA_VAR, XRAM_BASE, header_size);

  sim.addArrayVar(block0, block0_termID, BLOCK0_ID, 0x00, 256);
  sim.addArrayVar(block1, block1_termID, BLOCK1_ID, 256, 221);

  // filenames
  std::string romfile("../rom/secureboot.dat");
  std::string imgfile("../rom/prog.hex");

  // first run.
  sim.run(NoTamper, romfile, imgfile);

  // afl init
  afl_init(&fid, &oldss);

  // second trace.
  FSMWriteTamperer tamper;
  sim.nextTrace();
  sim.run(tamper, romfile, imgfile);

  assert(sim.evaluate(valid_sign));
  assert(sim.evaluate(valid_header_data));
  assert(sim.evaluate(valid_block_hash));
  assert(sim.evaluate(valid_block));

  // push coverage
  sim.copy_coverage();

  return 0;
}
