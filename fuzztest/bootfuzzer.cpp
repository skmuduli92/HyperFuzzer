#include <iostream>
#include <verilated.h>
#include "secureboot.h"
#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"

#include "tamper.h"

#include <memory>
#include <string>

// required for afl
static int fid = 0;
static std::stringstream oldss;

static ITamperer NoTamper;

int main() {
  // create top module
  Voc8051_Simulator sim(2, 0, 0);

  // filenames
  std::string romfile("../rom/secureboot.dat");
  std::string imgfile("../rom/prog.hex");

  // first run.
  sim.run(NoTamper, romfile, imgfile);

  // afl init
  afl_init(&fid, &oldss);

  // second trace.
  FSMWriteTamperer tamper;
  Verilated::reset_verilator();
  reset_time_stamp();
  sim.run(tamper, romfile, imgfile);

  // push coverage
  sim.copy_coverage();

  return 0;
}
