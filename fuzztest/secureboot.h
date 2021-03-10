#ifndef _SECUREBOOT_H_DEFINED_
#define _SECUREBOOT_H_DEFINED_

#include <verilated.h>
#include <iostream>
#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"
#include "afl.h"
#include "coverage.h"

#include "formula.h"
#include "tamper.h"
#include "trace.h"

double sc_time_stamp();
void reset_time_stamp();

class Voc8051_Simulator {
  static const int DEBUG_REG_ADDR;
  static const int DEBUG_REG_DATA;

 protected:
  // member vars
  std::unique_ptr<Voc8051_tb> top;
  ValueTracker tracker;

  // run for some number of steps.
  int simulate(long delay, ITamperer& tamperer);
  void monitor_ports();
  void monitor_debug_registers();

  TraceList traces;

 public:
  // Information about a particular variable.
  struct VarInfo {
    std::string name;
    unsigned traceIndex;
    unsigned debugIndex;
    enum Type { PROPOSITION, TERM, TERMARRAY } type;

    // to be used for tracking term array var data
    uint16_t start_addr;
    uint16_t data_size;

    // Constructor.
    VarInfo(const std::string& n, unsigned trcIdx, unsigned dbgIdx, Type t)
        : name(n), traceIndex(trcIdx), debugIndex(dbgIdx), type(t) {

      start_addr = 0x00;
      data_size = 0x00;
    }

    // constructor to be used for TermArrayVar
    VarInfo(const std::string& n, unsigned trcIdx, unsigned dbgIdx, Type t, uint16_t start,
            uint16_t dsize)
        : name(n),
          traceIndex(trcIdx),
          debugIndex(dbgIdx),
          type(t),
          start_addr(start),
          data_size(dsize) {}
  };

 protected:
  typedef std::shared_ptr<VarInfo> PVarInfo;
  // Map from variables to VarInfo objects.
  std::map<std::string, PVarInfo> varNames;
  // Map from debug indices to  VarInfo objects.
  std::map<unsigned, PVarInfo> varIndices;
  // current trace
  unsigned trace;

 public:
  // constructor.
  Voc8051_Simulator(unsigned numTraces, unsigned numProps, unsigned numVars)
      : top(std::make_unique<Voc8051_tb>()), tracker(65536), trace(0) {
    tracker.add(21841, 8);
    tracker.add(21841, 16);
    tracker.add(21841, 32);

    for (unsigned i = 0; i != numTraces; i++) {
      traces.push_back(PTrace(new Trace(numProps, numVars)));
    }
  }

  // public interface methods.

  void addVar(const std::string& name, unsigned traceIndex, unsigned debugIndex, VarInfo::Type t,
              uint64_t init) {
    PVarInfo varInfo(new VarInfo(name, traceIndex, debugIndex, t));
    varNames.insert(std::make_pair(name, varInfo));
    varIndices.insert(std::make_pair(debugIndex, varInfo));
    for (unsigned i = 0; i != traces.size(); i++) {
      setVar(i, debugIndex, 0, init);
    }
  }

  void setVar(unsigned t, unsigned dbgIndex, uint32_t time, uint64_t value) {
    auto pos = varIndices.find(dbgIndex);
    assert(pos != varIndices.end());
    PVarInfo inf = pos->second;
    if (inf->type == VarInfo::PROPOSITION) {
      traces[t]->updatePropValue(inf->traceIndex, time, value != 0);
    } else {
      traces[t]->updateTermValue(inf->traceIndex, time, value);
    }
  }

  void addArrayVar(const std::string& name, unsigned traceIndex, unsigned dbgIndex, uint16_t loc,
                   uint16_t size) {

    // initialize with empty vector, could remove the vector formal parameter
    // adding varname to debug index

    PVarInfo varInfo(new VarInfo(name, traceIndex, dbgIndex, VarInfo::TERMARRAY, loc, size));
    varNames.insert(std::make_pair(name, varInfo));
    varIndices.insert(std::make_pair(dbgIndex, varInfo));

    for (unsigned i = 0; i != traces.size(); i++) {
      setArrayVar(i, dbgIndex, 0);
    }

    // add PVarInfo to array var list
  }

  void setArrayVar(unsigned trace, unsigned dbgIndex, uint32_t time) {

    auto pos = varIndices.find(dbgIndex);
    assert(pos != varIndices.end());
    PVarInfo inf = pos->second;

    // start address
    uint16_t saddr = inf->start_addr;
    std::vector<uint32_t> data(inf->data_size);

    for (uint16_t id = 0; id < inf->data_size; ++id)
      data.push_back(
          top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[saddr + id]);

    assert(inf->type == VarInfo::TERMARRAY);
    traces[trace]->updateTermValue(inf->traceIndex, time, data);
  }

  /** Inline function to be called before the tampering begins. */
  void nextTrace() {
    Verilated::reset_verilator();
    reset_time_stamp();
    trace++;
    assert(trace < traces.size());
  }

  void reset_uc(ITamperer& tamperer);
  void load_program(const std::string& romfile);
  void load_boot_image(const std::string& imgfile);
  void run(ITamperer& tamper, const std::string& romfile, const std::string& imgfile);

  void copy_coverage();

  /** Function that evaluates whether the property is true or not. */
  bool evaluate(HyperPLTL::PHyperProp f);
};

// run function.

#endif
