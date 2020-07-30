#ifndef __COVERAGE_H_DEFINED__
#define __COVERAGE_H_DEFINED__

#include <iostream>
#include <vector>
#include <assert.h>
#include <stdint.h>

class ValueTracker
{
  typedef std::vector<uint8_t> container_t;
private:
  container_t bins;
  std::vector<unsigned> signalWidth;
  std::vector<uint64_t> masks;
  std::vector<uint64_t> signalValue;
  std::vector<unsigned> bases;
  std::vector<unsigned> sizes;
  unsigned currentBase;
public:
  ValueTracker(unsigned numBins) 
    : bins(numBins, 0)
    , currentBase(0)
  {
  }

  void add(unsigned size, unsigned width) {
    assert (width <= 32);
    bases.push_back(currentBase);
    signalWidth.push_back(width);
    masks.push_back((1ULL << width) - 1);
    signalValue.push_back(0);
    currentBase += size;
    sizes.push_back(size);
#ifdef DEBUG_COVERAGE
    std::cout << "size=" << size << "; bins=" 
              << bins.size() << std::endl;
#endif
    assert (currentBase < bins.size());
  }

  void track(unsigned index, uint32_t value);
  void dump(std::ostream& out) const;
  const uint8_t* data() const { return bins.data(); }
  size_t size() const { return bins.size() ; }

  container_t::iterator begin() { return bins.begin(); }
  container_t::iterator end() { return bins.end(); }
  container_t::const_iterator begin() const { return bins.begin(); }
  container_t::const_iterator end() const { return bins.end(); }
};

#endif // __COVERAGE_H_DEFINED__
