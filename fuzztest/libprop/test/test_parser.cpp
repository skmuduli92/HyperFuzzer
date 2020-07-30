
#include <gtest/gtest.h>

#include "ast.h"
#include "formula.h"
#include "parse_util.h"
#include "parser.h"

std::string prune_whitespaces(std::string const& str) {
  std::string newstr = "";
  for (const auto c : str)
    if (c != ' ') newstr.push_back(c);

  return newstr;
}

TEST(PropertyLibTest, Parse_NOT) {
  std::string prop = "(NOT (EQ x))";
  std::string origPropPruned = prune_whitespaces(prop);
  std::string regenStrPruned = prune_whitespaces(HyperPLTL::parse_and_regen_string(prop));

  EXPECT_TRUE(origPropPruned == regenStrPruned);
}

TEST(PropertyLibTest, Parse_AND) {
  std::string prop = "(AND (EQ x11) (EQ y12a))";
  std::string origPropPruned = prune_whitespaces(prop);
  std::string regenStrPruned = prune_whitespaces(HyperPLTL::parse_and_regen_string(prop));

  EXPECT_TRUE(origPropPruned == regenStrPruned);
}

TEST(PropertyLibTest, Parse_OR) {
  std::string prop = "(OR (EQ x11) (G (EQ y12a)) )";
  std::string origPropPruned = prune_whitespaces(prop);
  std::string regenStrPruned = prune_whitespaces(HyperPLTL::parse_and_regen_string(prop));

  EXPECT_TRUE(origPropPruned == regenStrPruned);
}

TEST(PropertyLibTest, Parse_IMPLIES) {
  std::string prop = "(IMPLIES (OR (EQ ab12) (EQ x11)) (EQ y12a))";
  std::string origPropPruned = prune_whitespaces(prop);
  std::string regenStrPruned = prune_whitespaces(HyperPLTL::parse_and_regen_string(prop));

  EXPECT_TRUE(origPropPruned == regenStrPruned);
}

TEST(PropertyLibTest, Parse_TraceSelect) {
  std::string prop = "(O (IMPLIES good.1 good.2))";
  std::string origPropPruned = prune_whitespaces(prop);
  std::string regenStrPruned = prune_whitespaces(HyperPLTL::parse_and_regen_string(prop));

  EXPECT_TRUE(origPropPruned == regenStrPruned);
}

TEST(PropertyLibTest, Parse_TestFailure_InvalidVarName) {
  std::string prop = "(NOT (EQ 1x))";  // invalid identifier name

  EXPECT_EXIT(HyperPLTL::parse_and_regen_string(prop), ::testing::ExitedWithCode(1),
              PARSE_ERR_MSG);
}

TEST(PropertyLibTest, Parse_TestFailure_ParenMisMatch) {
  std::string prop = "(NOT (EQ xy)";

  EXPECT_EXIT(HyperPLTL::parse_and_regen_string(prop), ::testing::ExitedWithCode(1),
              PARSE_ERR_MSG);
}

TEST(PropertyLibTest, Parse_TestFailure_OnlyParens) {
  std::string prop = "( )";

  EXPECT_EXIT(HyperPLTL::parse_and_regen_string(prop), ::testing::ExitedWithCode(1),
              PARSE_ERR_MSG);
}

TEST(PropertyLibTest, Parse_TestFailure_VarWithOutEQ) {
  std::string prop = "(OR ab (EQ xy)";

  EXPECT_EXIT(HyperPLTL::parse_and_regen_string(prop), ::testing::ExitedWithCode(1),
              PARSE_ERR_MSG);
}

TEST(PropertyLibTest, Parse_TestFailure_KeywordAsVarName) {
  std::string prop = "(OR ab (EQ AND)";

  EXPECT_EXIT(HyperPLTL::parse_and_regen_string(prop), ::testing::ExitedWithCode(1),
              PARSE_ERR_MSG);
}

TEST(PropertyLibTest, Parse_ComplexProperty) {
  std::string prop = "(G (IMPLIES (AND (NOT (EQ ab)) (EQ bc)) (Y (OR (EQ cd) (EQ de)))))";
  std::string origPropPruned = prune_whitespaces(prop);
  std::string regenStrPruned = prune_whitespaces(HyperPLTL::parse_and_regen_string(prop));

  EXPECT_TRUE(origPropPruned == regenStrPruned);
}

TEST(PropertyLibTest, Parse_TestFailure_ComplexProperty) {
  std::string prop =
      "(G (IMPLIES (AND (NOT (EQ ab)) (EQ bc)) (Y (OR (EQ cd) (EQ de)))) (EQ ef))";

  EXPECT_EXIT(HyperPLTL::parse_and_regen_string(prop), ::testing::ExitedWithCode(1),
              PARSE_ERR_MSG);
}

TEST(PropertyLibTest, Parse_TermVarArray) {
  std::string prop = "(IMPLIES (EQ ab) (EQ bytes) )";
  std::string origPropPruned = prune_whitespaces(prop);
  std::string regenStrPruned = prune_whitespaces(HyperPLTL::parse_and_regen_string(prop));

  EXPECT_TRUE(origPropPruned == regenStrPruned);
}
