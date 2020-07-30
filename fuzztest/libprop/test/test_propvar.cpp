#include <gtest/gtest.h>

#include "formula.h"
#include "parse_util.h"
#include "trace.h"

using namespace HyperPLTL;

TEST(PropertyLibTest, ValidTracePropVar) {
  std::string propstr = "(G (IMPLIES x.0 x.1))";
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addPropVar("x");

  PHyperProp property = parse_formula(propstr, varmap);

  PTrace trace1(new Trace(1, 0));
  PTrace trace2(new Trace(1, 0));

  TraceList tracelist({trace1, trace2});
  bool result = false;

  unsigned xid = property->getPropId("x");

  for (size_t cycle = 0; cycle < 10; ++cycle) {
    bool bval1 = rand() % 2;
    bool bval2 = bval1 ? 1 : (rand() % 2);
    trace1->updatePropValue(xid, cycle, bval1);
    trace2->updatePropValue(xid, cycle, bval2);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_TRUE(result);
}

TEST(PropertyLibTest, InvalidTracePropVar) {
  std::string propstr = "(G (IMPLIES x.0 x.1))";
  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addPropVar("x");

  PHyperProp property = parse_formula(propstr, varmap);

  PTrace trace1(new Trace(1, 0));
  PTrace trace2(new Trace(1, 0));

  TraceList tracelist({trace1, trace2});
  bool result = true;

  size_t cycle = 0;
  bool bval1, bval2;

  for (; cycle < 10; ++cycle) {
    bval1 = rand() % 2;
    bval2 = bval1 ? 1 : (rand() % 2);
    trace1->updatePropValue(0, cycle, bval1);
    trace2->updatePropValue(0, cycle, bval2);
    result = property->eval(cycle, tracelist);
  }

  // property violation
  trace1->updatePropValue(0, cycle, true);
  trace2->updatePropValue(0, cycle, false);
  result = property->eval(cycle, tracelist);
  cycle += 1;

  for (; cycle < 20; ++cycle) {
    bval1 = rand() % 2;
    bval2 = bval1 ? 1 : (rand() % 2);
    trace1->updatePropValue(0, cycle, bval1);
    trace2->updatePropValue(0, cycle, bval2);
    result = property->eval(cycle, tracelist);
  }

  EXPECT_FALSE(result);
}

TEST(PropertyLibTest, ParserVarMap) {
  std::string prop1 = "(G (IMPLIES (EQ idTwo) (EQ idOne)))";

  PVarMap varmap = std::make_shared<VarMap>();
  varmap->addIntVar("idOne");
  varmap->addIntVar("idTwo");
  varmap->addIntVar("idThree");

  auto hpltl1 = parse_formula(prop1, varmap);

  std::string prop2 = "(IMPLIES (G (AND (EQ idThree) (EQ idOne))) (EQ idTwo))";
  auto hpltl2 = parse_formula(prop2, varmap);

  // TODO : write a function or lamda to create a pairwise comparision

  EXPECT_EQ(hpltl1->getVarId("idOne"), hpltl2->getVarId("idOne"));
  EXPECT_EQ(hpltl1->getVarId("idTwo"), hpltl2->getVarId("idTwo"));
}
