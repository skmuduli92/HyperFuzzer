
#include <iostream>

#include <gtest/gtest.h>

#include "formula.h"

using namespace std;
using namespace HyperPLTL;

TEST(PropertyLibTest, TestYesterdaySimple) {
  PVarMap varmap(new VarMap());
  // x
  unsigned xIndex = varmap->addIntVar("x");
  PTerm x(new TermVar(varmap, xIndex));
  // y
  unsigned yIndex = varmap->addIntVar("y");
  PTerm y(new TermVar(varmap, yIndex));
  // (eq x)
  PHyperProp eqX(new Equal(varmap, x));
  // (eq y)
  PHyperProp eqY(new Equal(varmap, y));

  // (Y (eq x))
  PHyperProp YesterdayEqX(new Yesterday(varmap, eqX));

  // // (G (eq y))
  // PHyperProp GeqY(new Always(varmap, eqY));

  // (Y (eq x)) => (eq y)
  PHyperProp F(new Implies(varmap, YesterdayEqX, eqY));
  // F->display(std::cout); std::cout << std::endl;
  bool result = true;

  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));

  TraceList tracelist({trace1, trace2});

  size_t cycle = 0;
  // for (; cycle < 10; ++cycle) {
  //   trace1->updateTermValue(0, cycle, rand() % 10);
  //   trace1->updateTermValue(1, cycle, rand() % 10);
  //   trace2->updateTermValue(0, cycle, rand() % 10);
  //   trace2->updateTermValue(1, cycle, rand() % 10);

  //   result = F->eval(cycle, tracelist);

  //   std::cout << "result : " << result << std::endl;
  // }

  trace1->updateTermValue(0, cycle, 0);
  trace2->updateTermValue(0, cycle, 0);
  trace1->updateTermValue(1, cycle, 0);
  trace2->updateTermValue(1, cycle, 0);
  result = F->eval(cycle, tracelist);
  cycle = cycle + 1;

  trace1->updateTermValue(0, cycle, 21);
  trace2->updateTermValue(0, cycle, 20);
  trace1->updateTermValue(1, cycle, rand() % 10);
  trace2->updateTermValue(1, cycle, rand() % 10);

  result = F->eval(cycle, tracelist);
  cycle = cycle + 1;

  trace1->updateTermValue(0, cycle, 20);
  trace2->updateTermValue(0, cycle, 21);
  trace1->updateTermValue(1, cycle, rand() % 10);
  trace2->updateTermValue(1, cycle, rand() % 10);

  result = F->eval(cycle, tracelist);
  cycle = cycle + 1;

  trace1->updateTermValue(0, cycle, 10);
  trace2->updateTermValue(0, cycle, 10);
  trace1->updateTermValue(1, cycle, 30);
  trace2->updateTermValue(1, cycle, 30);
  result = F->eval(cycle, tracelist);
  cycle = cycle + 1;

  trace1->updateTermValue(0, cycle, 0);
  trace2->updateTermValue(0, cycle, 0);
  trace1->updateTermValue(1, cycle, 0);
  trace2->updateTermValue(1, cycle, 0);
  result = F->eval(cycle, tracelist);

  EXPECT_TRUE(result);
}

std::pair<PTrace, PTrace> createSatTraces1(unsigned xIndex, unsigned yIndex) {
  assert(xIndex == 0);
  assert(yIndex == 1);
  PTrace trace1(new Trace(0, 2));
  PTrace trace2(new Trace(0, 2));

  unsigned traceLen = rand() % 20 + 20;
  unsigned xValue = rand() % 65536;
  unsigned yValue = rand() % 65536;
  trace1->updateTermValue(0, 0, xValue);
  trace2->updateTermValue(0, 0, xValue);
  trace1->updateTermValue(1, 0, yValue);
  trace2->updateTermValue(1, 0, yValue);
  for (unsigned cyc = 1; cyc != traceLen; cyc++) {
    if (rand() % 3 == 0) {
      xValue = rand() % 65536;
      trace1->updateTermValue(0, cyc, xValue);
      trace2->updateTermValue(0, cyc, xValue);
    }
    if (rand() % 3 == 1) {
      yValue = rand() % 65536;
      trace1->updateTermValue(1, cyc, yValue);
      trace2->updateTermValue(1, cyc, yValue);
    }
  }

  return pair(trace1, trace2);
}

TEST(PropertyLibTest, TestALWAYSSimple) {
  // Formula: G(x.1 = x.2) => G(y.1 = y.2)
  PVarMap varmap(new VarMap());
  // x
  unsigned xIndex = varmap->addIntVar("x");
  PTerm x(new TermVar(varmap, xIndex));
  // y
  unsigned yIndex = varmap->addIntVar("y");
  PTerm y(new TermVar(varmap, yIndex));
  // (eq x)
  PHyperProp eqX(new Equal(varmap, x));
  // (eq y)
  PHyperProp eqY(new Equal(varmap, y));
  // (G (eq x))
  PHyperProp GeqX(new Always(varmap, eqX));
  // (G (eq y))
  PHyperProp GeqY(new Always(varmap, eqY));
  // (G (eq x)) => (G (eq y))
  PHyperProp F(new Implies(varmap, GeqX, GeqY));
  // cout << "formula: "; F->display(cout); cout << endl;

  bool result = false;

  auto traces = createSatTraces1(xIndex, yIndex);
  TraceList tracelist({traces.first, traces.second});

  for (size_t cycle = 0; cycle < traces.first->length(); ++cycle) {
    result = F->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}
