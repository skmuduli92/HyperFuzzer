
#include <gtest/gtest.h>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

using namespace HyperPLTL;
using namespace std;

PHyperProp propertyNotOperator() {
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addIntVar("x");

  std::string prop("(G (NOT (EQ x)))");
  return parse_formula(prop, varmap);
}

TEST(PropertyLibTest, ValidTraceNotOperator) {
  PHyperProp property = propertyNotOperator();

  PTrace trace1(new Trace(0, 1));
  PTrace trace2(new Trace(0, 1));
  TraceList tracelist({trace1, trace2});
  unsigned xid = property->getVarId("x");
  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % 100;
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    trace2->updateTermValue(xid, cycle, !xvalue);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, InvalidTraceNotOperator) {
  PHyperProp property = propertyNotOperator();

  PTrace trace1(new Trace(0, 1));
  PTrace trace2(new Trace(0, 1));
  TraceList tracelist({trace1, trace2});
  unsigned xid = property->getVarId("x");
  bool result = true;
  unsigned traceLength = rand() % 20 + 20;

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % std::numeric_limits<unsigned>::max();
    // setting 'x' var value
    trace1->updateTermValue(xid, cycle, xvalue);
    if (rand() % 2)
      trace2->updateTermValue(xid, cycle, !xvalue);
    else
      trace2->updateTermValue(xid, cycle, xvalue);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}
