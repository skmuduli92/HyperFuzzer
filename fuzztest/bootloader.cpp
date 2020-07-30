#include <iostream>
#include <verilated.h>
#include "secureboot.h"
#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"

#include <memory>
#include <string>

// required for afl
// static int fid = 0;

static ITamperer NoTamper;

int main() {
  // create top module
  Voc8051_Simulator sim(1, 0, 0);

  // filenames
  std::string romfile("../rom/secureboot.dat");
  std::string imgfile("../rom/prog.hex");
  sim.run(NoTamper, romfile, imgfile);

  return 0;
}
