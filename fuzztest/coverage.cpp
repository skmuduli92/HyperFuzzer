#include "coverage.h"
#include <iomanip>

void ValueTracker::track(unsigned i, uint32_t value)
{
  assert (i < signalValue.size());
  signalValue[i] = (signalValue[i] << 32) | (value & masks[i]);
  auto index = bases[i] + (signalValue[i] % sizes[i]);
  bins[index] += 1;
#ifdef DEBUG_COVERAGE
  std::cout << "tracker[" << std::dec << i << "]; value=" 
            << std::hex << value << "; signalValue=" 
            << signalValue[i] << std::endl;
  std::cout << "bin[" << std::dec << index << "]=" 
            << (int) bins[index] << std::endl;
#endif
}

void ValueTracker::dump(std::ostream& out) const
{
  for(unsigned i=0; i != bins.size(); i++) {
    if(bins[i] != 0) {
      out << std::setw(6) << i << ": " << std::setw(6) << bins[i] << std::endl;
    }
  }
}
