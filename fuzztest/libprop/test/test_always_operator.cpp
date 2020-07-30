
#include <gtest/gtest.h>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

using namespace HyperPLTL;
using namespace std;

PHyperProp property1AlwaysOperator() {
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addIntVar("x");
  std::string formula("(G (EQ x))");
  return parse_formula(formula, varmap);
}

PHyperProp property2AlwaysOperator() {
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addIntVar("x");
  varmap->addIntVar("y");
  std::string formula("(G (OR (EQ x) (EQ y)))");
  return parse_formula(formula, varmap);
}

TEST(PropertyLibTest, ValidTraceAlwaysOperator_Test1) {
  PHyperProp property = property1AlwaysOperator();

  PTrace trace1(new Trace(0, 1));
  PTrace trace2(new Trace(0, 1));
  TraceList tracelist({trace1, trace2});

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  // tr1.x is always equal to tr2.x
  unsigned xvalue = 0;
  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    xvalue = rand() % std::numeric_limits<unsigned>::max();
    trace1->updateTermValue(0, cycle, xvalue);
    trace2->updateTermValue(0, cycle, xvalue);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, InvalidTraceAlwaysOperator_Test1) {
  PHyperProp property = property1AlwaysOperator();

  PTrace trace1(new Trace(0, 1));
  PTrace trace2(new Trace(0, 1));
  TraceList tracelist({trace1, trace2});

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;
  size_t cycle = 0;

  // tr1.x is always equal to tr2.x
  unsigned xvalue = 0;
  for (; cycle < traceLength; ++cycle) {
    xvalue = rand() % std::numeric_limits<unsigned>::max();
    trace1->updateTermValue(0, cycle, xvalue);
    trace2->updateTermValue(0, cycle, xvalue);
    result = property->eval(cycle, tracelist);
  }

  trace1->updateTermValue(0, cycle, xvalue);
  trace2->updateTermValue(0, cycle, !xvalue);
  result = property->eval(cycle, tracelist);

  EXPECT_FALSE(result);
}

TEST(PropertyLibTest, ValidTraceAlwaysOperator_Test2) {
  // (G (Or (eqX, eqY)))
  PHyperProp property = property2AlwaysOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  // tr1.x is always equal to tr2.x
  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % std::numeric_limits<unsigned>::max();
    unsigned yvalue = rand() % std::numeric_limits<unsigned>::max();

    if (cycle % 3 == 0) {
      trace1->updateTermValue(xid, cycle, xvalue);
      trace2->updateTermValue(xid, cycle, xvalue);
      trace1->updateTermValue(yid, cycle, yvalue);
      trace2->updateTermValue(yid, cycle, yvalue);
    } else if (cycle % 3 == 1) {
      trace1->updateTermValue(xid, cycle, xvalue);
      trace2->updateTermValue(xid, cycle, !xvalue);
      trace1->updateTermValue(yid, cycle, yvalue);
      trace2->updateTermValue(yid, cycle, yvalue);
    } else {
      trace1->updateTermValue(xid, cycle, xvalue);
      trace2->updateTermValue(xid, cycle, xvalue);
      trace1->updateTermValue(yid, cycle, yvalue);
      trace2->updateTermValue(yid, cycle, !yvalue);
    }

    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, InvalidTraceAlwaysOperator_Test2) {
  // (G (Or (eqX, eqY)))
  PHyperProp property = property2AlwaysOperator();

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));
  TraceList tracelist({trace1, trace2});
  unsigned xid = property->getVarId("x");
  unsigned yid = property->getVarId("y");

  bool result = false;
  unsigned traceLength = rand() % 20 + 20;

  for (size_t cycle = 0; cycle < traceLength; ++cycle) {
    unsigned xvalue = rand() % std::numeric_limits<unsigned>::max();
    unsigned yvalue = rand() % std::numeric_limits<unsigned>::max();

    if (cycle % 3 == 0) {
      trace1->updateTermValue(xid, cycle, xvalue);
      trace2->updateTermValue(xid, cycle, xvalue);
      trace1->updateTermValue(yid, cycle, yvalue);
      trace2->updateTermValue(yid, cycle, yvalue);
    } else if (cycle % 3 == 1) {
      trace1->updateTermValue(xid, cycle, xvalue);
      trace2->updateTermValue(xid, cycle, !xvalue);
      trace1->updateTermValue(yid, cycle, yvalue);
      trace2->updateTermValue(yid, cycle, yvalue);
    } else {
      // violating state
      trace1->updateTermValue(xid, cycle, xvalue);
      trace2->updateTermValue(xid, cycle, !xvalue);
      trace1->updateTermValue(yid, cycle, yvalue);
      trace2->updateTermValue(yid, cycle, !yvalue);
    }

    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}
