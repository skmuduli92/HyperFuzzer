
#include <gtest/gtest.h>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

using namespace HyperPLTL;
using namespace std;

PHyperProp propertySinceOperator() {
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addIntVar("x");
  varmap->addIntVar("y");

  std::string formula("(S (EQ y) (EQ x))");
  PHyperProp property = parse_formula(formula, varmap);
  return property;
}

TEST(PropertyLibTest, ValidTraceSinceOperator) {
  auto property = propertySinceOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  bool result = false;

  size_t cycle = 0;
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");
  unsigned xvalue = 0;
  unsigned yvalue = 0;
  unsigned traceLength = rand() % 20 + 20;

  for (; cycle < traceLength; ++cycle) {
    xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(0, cycle, xvalue);
    trace2->updateTermValue(0, cycle, !xvalue);

    // setting 'y' var value
    trace1->updateTermValue(1, cycle, rand() % 100);
    trace2->updateTermValue(1, cycle, rand() % 100);

    result = property->eval(cycle, tracelist);
  }

  xvalue = rand() % 100;
  // setting 'x' var value
  trace1->updateTermValue(xid, cycle, xvalue);
  trace2->updateTermValue(xid, cycle, xvalue);
  // setting 'y' var value
  yvalue = rand() % 100;
  trace1->updateTermValue(yid, cycle, yvalue);
  trace2->updateTermValue(yid, cycle, !yvalue);

  result = property->eval(cycle, tracelist);
  cycle = cycle + 1;

  for (traceLength = rand() % 20 + 20 + cycle; cycle < traceLength; ++cycle) {
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, rand() % 100);
    trace2->updateTermValue(xid, cycle, rand() % 100);

    // setting 'y' var value
    yvalue = rand() % 100;
    trace1->updateTermValue(yid, cycle, yvalue);
    trace2->updateTermValue(yid, cycle, yvalue);

    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, InvalidTraceSinceOperator_Test1) {
  // eqX never becomes true, hence SINCE(eqY, eqX) should fail.
  PHyperProp property = propertySinceOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  bool result = false;
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  size_t cycle = 0;
  unsigned xvalue = 0;
  unsigned traceLength = rand() % 20 + 20;

  for (; cycle < traceLength; ++cycle) {
    xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    trace2->updateTermValue(xid, cycle, !xvalue);
    // setting 'y' var value
    trace1->updateTermValue(yid, cycle, rand() % 100);
    trace2->updateTermValue(yid, cycle, rand() % 100);

    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}

TEST(PropertyLibTest, InvalidTraceSinceOperator_Test2) {
  // eqX is always true but eqY never becomes true
  PHyperProp property = propertySinceOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  bool result = false;

  size_t cycle = 0;
  unsigned xvalue = 0;
  unsigned yvalue = 0;
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");
  unsigned traceLength = rand() % 20 + 20;

  for (; cycle < traceLength; ++cycle) {
    xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    trace2->updateTermValue(xid, cycle, xvalue);
    // setting 'y' var value
    yvalue = rand() % 100;
    trace1->updateTermValue(yid, cycle, yvalue);
    trace2->updateTermValue(yid, cycle, !yvalue);

    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}
