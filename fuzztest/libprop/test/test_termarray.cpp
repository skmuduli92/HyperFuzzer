#include <gtest/gtest.h>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

using namespace HyperPLTL;

void randomizeVecData(std::vector<uint32_t>& vec) {
  for (uint32_t& data : vec) {
    data = rand() % std::numeric_limits<uint32_t>::max();
  }
}

void printVec(std::vector<uint32_t>& vec) {
  for (uint32_t& data : vec) {
    std::cout << data << ", ";
  }
  std::cout << std::endl;
}

void resetData(std::vector<uint32_t>& vec) {
  for (uint32_t& data : vec) {
    data = 0;
  }
}

// guarantees the new random vector is different than
// the current random vector provided as input
void newRandomVecData(std::vector<uint32_t>& vec) {
  std::vector<uint32_t> oldVecd(vec);
  while (oldVecd == vec) {
    for (uint32_t& data : vec) {
      data = rand() % std::numeric_limits<uint32_t>::max();
    }
  }
}

TEST(PropertyLibTest, ValidTracePropTermArray_Test1) {
  std::string propstr = "(G (EQ bytes))";
  PVarMap varmap(new VarMap());
  varmap->addArrayVar("bytes");

  PHyperProp property = parse_formula(propstr, varmap);

  PTrace trace1(new Trace(0, 1));
  PTrace trace2(new Trace(0, 1));
  TraceList tracelist({trace1, trace2});
  unsigned varid = property->getVarId("bytes");

  std::vector<uint32_t> arrval(4);

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    if (rand() % 2) {
      randomizeVecData(arrval);
    } else {
      resetData(arrval);
    }
    trace1->updateTermValue(varid, cycle, arrval);
    trace2->updateTermValue(varid, cycle, arrval);

    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, ValidTracePropTermArray_Test1_Fail) {
  std::string propstr = "(G (EQ bytes))";
  PVarMap varmap(new VarMap());
  varmap->addArrayVar("bytes");
  PHyperProp property = parse_formula(propstr, varmap);

  PTrace trace1(new Trace(0, 1));
  PTrace trace2(new Trace(0, 1));
  TraceList tracelist({trace1, trace2});
  unsigned vi = property->getVarId("bytes");

  std::vector<uint32_t> arrval(5);

  bool result = true;
  unsigned traceLength = rand() % 20 + 20;
  unsigned faultIdx = rand() % traceLength;

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    if (rand() % 2) {
      randomizeVecData(arrval);
    }

    trace1->updateTermValue(vi, cycle, arrval);

    if (faultIdx == cycle)
      trace2->updateTermValue(vi, cycle, arrval);
    else {
      newRandomVecData(arrval);
      trace2->updateTermValue(vi, cycle, arrval);
    }
    result = property->eval(cycle, tracelist);
  }
  EXPECT_FALSE(result);
}

TEST(PropertyLibTest, ValidTracePropTermArray_Test2) {
  std::string propstr = "(G(IMPLIES (EQ x) (EQ bytes)))";
  PVarMap varmap(new VarMap());
  varmap->addIntVar("x");
  varmap->addArrayVar("bytes");
  PHyperProp property = parse_formula(propstr, varmap);

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  unsigned xIdx = property->getVarId("x");
  unsigned vi = property->getVarId("bytes");
  std::vector<uint32_t> arrval(5);

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % std::numeric_limits<unsigned>::max();

    if (rand() % 2) {
      trace1->updateTermValue(xIdx, cycle, xvalue);
      trace2->updateTermValue(xIdx, cycle, xvalue);
      randomizeVecData(arrval);
      trace1->updateTermValue(vi, cycle, arrval);
      trace2->updateTermValue(vi, cycle, arrval);
    } else {
      trace1->updateTermValue(xIdx, cycle, xvalue);
      trace2->updateTermValue(xIdx, cycle, !xvalue);
      randomizeVecData(arrval);
      trace1->updateTermValue(vi, cycle, arrval);
      if (rand() % 2) randomizeVecData(arrval);
      trace2->updateTermValue(vi, cycle, arrval);
    }

    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, ValidTracePropTermArray_Test2_Fail) {
  std::string propstr = "(G (IMPLIES (EQ x) (EQ bytes)))";
  PVarMap varmap(new VarMap());
  varmap->addIntVar("x");
  varmap->addArrayVar("bytes");
  PHyperProp property = parse_formula(propstr, varmap);

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  bool result = true;
  unsigned traceLength = rand() % 20 + 20;

  unsigned xIdx = property->getVarId("x");
  unsigned vi = property->getVarId("bytes");
  std::vector<uint32_t> arrval(5);

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % std::numeric_limits<unsigned>::max();

    if (rand() % 2) {
      trace1->updateTermValue(xIdx, cycle, xvalue);
      trace2->updateTermValue(xIdx, cycle, xvalue);
      randomizeVecData(arrval);

      trace1->updateTermValue(vi, cycle, arrval);
      newRandomVecData(arrval);
      trace2->updateTermValue(vi, cycle, arrval);
    }

    else {
      trace1->updateTermValue(xIdx, cycle, xvalue);
      trace2->updateTermValue(xIdx, cycle, !xvalue);
      randomizeVecData(arrval);

      trace1->updateTermValue(vi, cycle, arrval);
      if (rand() % 2) randomizeVecData(arrval);
      trace2->updateTermValue(vi, cycle, arrval);
    }
    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}

TEST(PropertyLibTest, ValidTracePropTermArray_Test3) {
  // unequal size of bytes
  std::string propstr = "(G(IMPLIES (EQ x) (EQ bytes)))";
  PVarMap varmap(new VarMap());
  varmap->addIntVar("x");
  varmap->addArrayVar("bytes");
  PHyperProp property = parse_formula(propstr, varmap);

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;
  unsigned xIdx = property->getVarId("x");
  unsigned vi = property->getVarId("bytes");

  std::vector<uint32_t> arrval1(4);
  std::vector<uint32_t> arrval2(5);

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % std::numeric_limits<unsigned>::max();

    if (rand() % 2) {
      trace1->updateTermValue(xIdx, cycle, xvalue);
      trace2->updateTermValue(xIdx, cycle, xvalue);

      randomizeVecData(arrval1);
      trace1->updateTermValue(vi, cycle, arrval1);
      trace2->updateTermValue(vi, cycle, arrval1);
    }

    else {
      trace1->updateTermValue(xIdx, cycle, xvalue);
      trace2->updateTermValue(xIdx, cycle, xvalue);

      randomizeVecData(arrval1);
      randomizeVecData(arrval2);
      trace1->updateTermValue(vi, cycle, arrval1);
      trace2->updateTermValue(vi, cycle, arrval2);
    }
    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}
