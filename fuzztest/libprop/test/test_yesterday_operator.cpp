
#include <gtest/gtest.h>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

using namespace HyperPLTL;
using namespace std;

PHyperProp propertyYOperator() {
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addIntVar("x");
  varmap->addIntVar("y");

  std::string property("(IMPLIES (Y (EQ x)) (EQ y))");
  auto prop = parse_formula(property, varmap);
  return prop;
}

TEST(PropertyLibTest, ValidTraceYOperator) {
  PHyperProp property = propertyYOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  size_t cycle = 0;
  bool result = true;
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  trace1->updateTermValue(xid, cycle, 20);
  trace2->updateTermValue(xid, cycle, 20);
  trace1->updateTermValue(yid, cycle, rand() % 10);
  trace2->updateTermValue(yid, cycle, rand() % 10);

  result = property->eval(cycle, tracelist);
  cycle = cycle + 1;

  trace1->updateTermValue(xid, cycle, 20);
  trace2->updateTermValue(xid, cycle, 21);
  trace1->updateTermValue(yid, cycle, 10);
  trace2->updateTermValue(yid, cycle, 10);

  result = property->eval(cycle, tracelist);

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, InvalidTraceYOperator) {
  PHyperProp property = propertyYOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  size_t cycle = 0;
  bool result = true;
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  unsigned traceLength = rand() % 20 + 20;

  for (; cycle < traceLength; ++cycle) {
    trace1->updateTermValue(xid, cycle, rand() % 100);
    trace2->updateTermValue(xid, cycle, rand() % 100);
    trace1->updateTermValue(yid, cycle, rand() % 100);
    trace2->updateTermValue(yid, cycle, rand() % 100);
    result = property->eval(cycle, tracelist);
  }

  trace1->updateTermValue(xid, cycle, 20);
  trace2->updateTermValue(xid, cycle, 20);
  trace1->updateTermValue(yid, cycle, 10);
  trace2->updateTermValue(yid, cycle, 10);

  result = property->eval(cycle, tracelist);
  cycle = cycle + 1;

  trace1->updateTermValue(xid, cycle, 20);
  trace2->updateTermValue(xid, cycle, 21);
  trace1->updateTermValue(yid, cycle, 10);
  trace2->updateTermValue(yid, cycle, 11);

  result = property->eval(cycle, tracelist);
  cycle = cycle + 1;

  EXPECT_FALSE(result);
}

TEST(PropertyLibTest, InvalidTraceYeqXNeverTrue) {
  // check the property evaluation value when (Y (eq x) is never true

  PHyperProp property = propertyYOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    xvalue = (xvalue == 50) ? 51 : (100 - xvalue);
    trace2->updateTermValue(xid, cycle, xvalue);
    // setting 'y' var value
    trace1->updateTermValue(yid, cycle, rand() % 100);
    trace2->updateTermValue(yid, cycle, rand() % 100);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}
