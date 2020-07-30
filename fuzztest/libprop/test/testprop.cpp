#include <gtest/gtest.h>

#include "ast.h"
#include "parse_util.h"
#include "parser.h"

namespace sexpr::ast {

struct HPLTLStringBuilder {
  /////////////////////////////////////////////////////////////////
  // visitor methods to generate formula string back from an AST //
  /////////////////////////////////////////////////////////////////

  using result_t = std::string;
  result_t operator()(EqlNode const& eqlNode) const {
    return "(EQ " + eqlNode.varname + ")";
  }

  result_t operator()(TraceSelNode const& selNode) const {
    return selNode.varname + "." + std::to_string(selNode.traceid) + " ";
  }

  result_t operator()(AndNode const& andNode) const {
    return "(AND " + boost::apply_visitor(*this, andNode.leftArg) +
           boost::apply_visitor(*this, andNode.rightArg) + ")";
  }

  result_t operator()(OrNode const& orNode) const {
    return "(OR " + boost::apply_visitor(*this, orNode.leftArg) +
           boost::apply_visitor(*this, orNode.rightArg) + ")";
  }

  result_t operator()(NotNode const& notNode) const {
    return "(NOT " + boost::apply_visitor(*this, notNode.arg) + ")";
  }

  result_t operator()(ImpNode const& impNode) const {
    return "(IMPLIES " + boost::apply_visitor(*this, impNode.leftArg) +
           boost::apply_visitor(*this, impNode.rightArg) + ")";
  }

  result_t operator()(GNode const& gnode) const {
    return "(G " + boost::apply_visitor(*this, gnode.arg) + ")";
  }

  result_t operator()(YNode const& ynode) const {
    return "(Y " + boost::apply_visitor(*this, ynode.arg) + ")";
  }

  result_t operator()(ONode const& onode) const {
    return "(O " + boost::apply_visitor(*this, onode.arg) + ")";
  }

  result_t operator()(SNode const& snode) const {
    return "(S " + boost::apply_visitor(*this, snode.leftArg) +
           boost::apply_visitor(*this, snode.rightArg) + ")";
  }

  result_t operator()(VarNode const& varNode) const {
    return boost::apply_visitor(*this, varNode);
  }
};

}  // namespace sexpr::ast

namespace HyperPLTL {

std::string parse_and_regen_string(std::string const& str) {
  typedef std::string::const_iterator iterator_type;
  typedef sexpr::ast::VarNode SExprAst;

  auto grammar = sexpr::parser();
  SExprAst exprAst;

  iterator_type iter = str.begin();
  iterator_type end = str.end();

  boost::spirit::x3::ascii::space_type space;
  bool r = phrase_parse(iter, end, grammar, space, exprAst);

  if (!r || iter != end) {
    std::cerr << "Error : Parsing failed\n";
    exit(1);
  }

  sexpr::ast::HPLTLStringBuilder strbuilder;
  return strbuilder(exprAst);
}

}  // namespace HyperPLTL

int main(int argc, char* argv[]) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
