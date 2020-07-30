#ifndef __AST_ADAPTED_H__
#define __AST_ADAPTED_H__

#include <boost/fusion/include/adapt_struct.hpp>
#include "ast.h"

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::AndNode, opname, leftArg, rightArg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::OrNode, opname, leftArg, rightArg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::ImpNode, opname, leftArg, rightArg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::NotNode, opname, arg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::GNode, opname, arg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::YNode, opname, arg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::ONode, opname, arg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::SNode, opname, leftArg, rightArg);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::EqlNode, opname, varname);

BOOST_FUSION_ADAPT_STRUCT(sexpr::ast::TraceSelNode, varname, traceid);

#endif
