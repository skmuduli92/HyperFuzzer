#ifndef __PARSER_DEF_H__
#define __PARSER_DEF_H__

#include "ast.h"
#include "ast_adapted.h"
#include "parser.h"

namespace sexpr {

namespace grammar {

///////////////////////////////////////////////////////////////////////////////
//  Grammar
///////////////////////////////////////////////////////////////////////////////

x3::rule<class IdExpr, std::string> idexpr("idexpr");
x3::rule<class VarExpr, ast::VarNode> varexpr("varexpr");

x3::rule<class OrExpr, ast::OrNode> orexpr("orexpr");
x3::rule<class AndExpr, ast::AndNode> andexpr("andexpr");
x3::rule<class ImpExpr, ast::ImpNode> impexpr("impexpr");
x3::rule<class NotExpr, ast::NotNode> notexpr("notexpr");
x3::rule<class EqlExpr, ast::EqlNode> eqlexpr("eqlexpr");
x3::rule<class TraceSelExpr, ast::TraceSelNode> selexpr("selexpr");

x3::rule<class GExpr, ast::GNode> gexpr("gexpr");
x3::rule<class YExpr, ast::YNode> yexpr("yexpr");
x3::rule<class OExpr, ast::ONode> oexpr("oexpr");
x3::rule<class SExpr, ast::SNode> sexpr("sexpr");

x3::rule<class TermExpr, ast::VarNode> termexpr("termexpr");

auto const andstr = x3::string("AND");
auto const orstr = x3::string("OR");
auto const impstr = x3::string("IMPLIES");
auto const notstr = x3::string("NOT");

auto const eqstr = x3::string("EQ");

auto const gstr = x3::string("G");
auto const ystr = x3::string("Y");
auto const ostr = x3::string("O");
auto const sstr = x3::string("S");

auto const keywords =
    andstr | orstr | notstr | impstr | gstr | ystr | ostr | sstr | eqstr;

auto const idexpr_def =
    (x3::lexeme[x3::alpha >> *(x3::alnum | x3::char_('_'))]) - keywords;

auto const varexpr_def = '(' >> (notexpr | andexpr | orexpr | impexpr | gexpr | yexpr |
                                 oexpr | sexpr) >>
                         ')';

auto const orexpr_def = orstr >> termexpr >> termexpr;
auto const andexpr_def = andstr >> termexpr >> termexpr;
auto const impexpr_def = impstr >> termexpr >> termexpr;
auto const notexpr_def = notstr >> termexpr;

auto const gexpr_def = gstr >> termexpr;
auto const yexpr_def = ystr >> termexpr;
auto const oexpr_def = ostr >> termexpr;
auto const sexpr_def = sstr >> termexpr >> termexpr;

auto const termexpr_def = varexpr | ('(' >> eqlexpr >> ')') | selexpr;
auto const eqlexpr_def = eqstr >> idexpr;
auto const selexpr_def = idexpr >> '.' >> x3::uint_;

BOOST_SPIRIT_DEFINE(idexpr, varexpr, notexpr, andexpr, orexpr, impexpr);
BOOST_SPIRIT_DEFINE(gexpr, yexpr, oexpr, sexpr, termexpr);
BOOST_SPIRIT_DEFINE(eqlexpr, selexpr);
}  // namespace grammar

grammar::varexpr_t parser() { return grammar::varexpr; }

}  // namespace sexpr

#endif
