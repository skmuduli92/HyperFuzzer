

#include "trace.h"

size_t TraceSerialize::getByteSize(PTrace trace) {

  size_t numBytes = 0;
  // headesize = size of totalsize + numprops + numvars + numcycles
  const size_t headerSize = 4 * sizeof(uint32_t);

  numBytes += sizeof(bool) * trace->numProps();

  // calculate the number of uint32_t elements in the termIntVar and termArrayVar
  // count 1 for intvar and array size for array var

  size_t nTermElems = 0;
  for (auto& tvar : trace->variables) {
    nTermElems += std::visit(ElemCounter{}, tvar);
  }

  numBytes += sizeof(uint32_t) * (trace->numVars() + (nTermElems * trace->length()));
  return numBytes + headerSize;
}

PTrace TraceSerialize::load(uint8_t* source) {

  const size_t u32size = sizeof(uint32_t);
  const size_t boolsize = sizeof(bool);

  uint32_t numBytes = 0;
  uint32_t nprops = 0;
  uint32_t nvars = 0;
  uint32_t ncycles = 0;

  uint8_t* currloc = source;

  memcpy(&numBytes, currloc, u32size);
  currloc += u32size;

  memcpy(&ncycles, currloc, u32size);
  currloc += u32size;

  memcpy(&nprops, currloc, u32size);
  currloc += u32size;

  memcpy(&nvars, currloc, u32size);
  currloc += u32size;

  // create the trace object
  PTrace trace(new Trace(nprops, nvars));

  for (size_t pid = 0; pid < nprops; ++pid) {
    bool data = false;
    for (size_t tstep = 0; tstep < ncycles; ++tstep) {
      memcpy(&data, currloc, u32size);
      trace->updatePropValue(pid, tstep, data);
      currloc += boolsize;
    }
  }

  for (size_t vid = 0; vid < nvars; ++vid) {
    uint32_t dim;
    memcpy(&dim, currloc, u32size);
    currloc += u32size;

    uint32_t data = 0;
    if (dim == 1) {
      // IntVar
      for (size_t tstep = 0; tstep < ncycles; ++tstep) {
        memcpy(&data, currloc, u32size);
        trace->updateTermValue(vid, tstep, data);
        currloc += u32size;
      }
    } else {
      // ArrayVar
      std::vector<uint32_t> vdata(dim);
      for (size_t tstep = 0; tstep < ncycles; ++tstep) {

        for (size_t did = 0; did < dim; ++did) {
          memcpy(&data, currloc, u32size);
          currloc += u32size;
          vdata[did] = data;
        }
        // update arrayvar
        trace->updateTermValue(vid, tstep, vdata);
      }
    }
  }

  return trace;
}

size_t TraceSerialize::store(uint8_t* dest, PTrace trace) {

  const uint32_t nprops = trace->numProps();
  const uint32_t nvars = trace->numVars();
  const uint32_t ncycles = trace->length();

  const size_t u32size = sizeof(uint32_t);
  const size_t boolsize = sizeof(bool);

  uint8_t* currloc = dest;

  // store first 4bytes for total size of the memory segment
  currloc += u32size;

  memcpy(currloc, &ncycles, u32size);
  currloc += u32size;

  memcpy(currloc, &nprops, u32size);
  currloc += u32size;

  memcpy(currloc, &nvars, u32size);
  currloc += u32size;

  // propositions and variables will be expanded while storing to the memory location

  // copy propositions to current desitnation
  for (auto& prop : trace->propositions) {
    for (uint32_t tstep = 0; tstep < ncycles; ++tstep) {
      bool data = prop[tstep];
      memcpy(currloc, &data, boolsize);
      currloc += boolsize;
    }
  }

  // TODO : add support for array terms later, currently only supporting
  // integer termvar type

  // store array with nvars elemes which stores the dimension of each termvar element
  // stores 1 for IntVar and VarTrace::dimension() for ArrayVar

  for (uint32_t vid = 0; vid < nvars; ++vid) {
    uint32_t bsize =
        std::visit(TraceStoreVisitor{currloc, ncycles}, trace->variables[vid]);

    currloc += bsize;
  }

  uint32_t numBytes = currloc - dest;
  memcpy(dest, &numBytes, u32size);

  return numBytes;
}
