#ifndef __AST_H__
#define __AST_H__

#include <boost/spirit/home/x3/support/ast/variant.hpp>

namespace x3 = boost::spirit::x3;

namespace sexpr::ast {
///////////////////////////////////////////////////////////////////////////
//  The AST
///////////////////////////////////////////////////////////////////////////

struct AndNode;
struct OrNode;
struct ImpNode;
struct NotNode;

struct GNode;
struct YNode;
struct ONode;
struct SNode;

struct EqlNode {
  std::string opname;
  std::string varname;
};

struct TraceSelNode {
  std::string varname;
  unsigned traceid;
};

struct VarNode : x3::variant<EqlNode, TraceSelNode, x3::forward_ast<AndNode>,
                             x3::forward_ast<OrNode>, x3::forward_ast<ImpNode>,
                             x3::forward_ast<NotNode>, x3::forward_ast<GNode>,
                             x3::forward_ast<YNode>, x3::forward_ast<ONode>,
                             x3::forward_ast<SNode> > {
  using base_type::base_type;
  using base_type::operator=;
};

struct NotNode {
  std::string opname;
  VarNode arg;
};

struct UnaryOpNode {
  std::string opname;
  VarNode arg;
};

struct BinaryOpNode {
  std::string opname;
  VarNode leftArg, rightArg;
};

struct AndNode : BinaryOpNode {};
struct OrNode : BinaryOpNode {};
struct ImpNode : BinaryOpNode {};

struct GNode : UnaryOpNode {};
struct YNode : UnaryOpNode {};
struct ONode : UnaryOpNode {};
struct SNode : BinaryOpNode {};

}  // namespace sexpr::ast

#endif
