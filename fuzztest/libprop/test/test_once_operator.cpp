
#include <gtest/gtest.h>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

using namespace HyperPLTL;
using namespace std;

PHyperProp propertyOnceOperator() {
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addIntVar("x");
  varmap->addIntVar("y");
  std::string formula = "(O (AND (EQ x) (EQ y)))";
  return parse_formula(formula, varmap);
}

TEST(PropertyLibTest, ValidTraceOnceOperator) {
  PHyperProp property = propertyOnceOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  size_t cycle = 0;
  for (; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    trace2->updateTermValue(xid, cycle, !xvalue);
    // setting 'y' var value

    unsigned yvalue = rand() % 100;
    trace1->updateTermValue(yid, cycle, yvalue);
    trace2->updateTermValue(yid, cycle, !yvalue);
    result = property->eval(cycle, tracelist);
  }

  trace1->updateTermValue(xid, cycle, 10);
  trace2->updateTermValue(xid, cycle, 10);
  trace1->updateTermValue(yid, cycle, 11);
  trace2->updateTermValue(yid, cycle, 11);
  result = property->eval(cycle, tracelist);
  cycle = cycle + 1;

  traceLength = rand() % 20 + 20 + cycle;
  for (; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    trace2->updateTermValue(xid, cycle, !xvalue);
    // setting 'y' var value

    unsigned yvalue = rand() % 100;
    trace1->updateTermValue(yid, cycle, yvalue);
    trace2->updateTermValue(yid, cycle, !yvalue);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, InvalidTraceOnceOperator) {
  PHyperProp property = propertyOnceOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  size_t cycle = 0;
  for (; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    trace2->updateTermValue(xid, cycle, !xvalue);
    // setting 'y' var value

    unsigned yvalue = rand() % 100;
    trace1->updateTermValue(yid, cycle, yvalue);
    trace2->updateTermValue(yid, cycle, yvalue);
    result = property->eval(cycle, tracelist);
  }

  traceLength = rand() % 20 + 20 + cycle;
  for (; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    trace2->updateTermValue(xid, cycle, xvalue);
    // setting 'y' var value

    unsigned yvalue = rand() % 100;
    trace1->updateTermValue(yid, cycle, yvalue);
    trace2->updateTermValue(yid, cycle, !yvalue);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}
