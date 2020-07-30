#ifndef __FORMULA_H_DEFINED__
#define __FORMULA_H_DEFINED__

#include <iostream>
#include <map>
#include <string>
#include <vector>
#include "trace.h"

namespace HyperPLTL {

class VarMap;
class Formula;
class TraceProp;
class HyperProp;
class Term;
class TermArrayVar;

typedef std::shared_ptr<VarMap> PVarMap;
typedef std::shared_ptr<Formula> PFormula;
typedef std::shared_ptr<TraceProp> PTraceProp;
typedef std::shared_ptr<HyperProp> PHyperProp;
typedef std::shared_ptr<Term> PTerm;
typedef std::shared_ptr<TermArrayVar> PTermArray;

// varinfo_t tuple (varIndex, arraySize)
using varinfo_t = std::pair<unsigned, unsigned>;

enum class VarType { INT_VAR, ARRAY_VAR, PROP_VAR };

class VarMap {
  // TODO :
  // - keep a single vector for names, else it will allow propvar and termvar

  std::vector<std::string> varNames;
  std::vector<std::string> propNames;
  std::map<std::string, VarType> varInfo;

 public:
  unsigned addArrayVar(const std::string&);
  unsigned addIntVar(const std::string&);
  unsigned addPropVar(const std::string&);
  unsigned addVar(const std::string&, VarType);

  unsigned getVarIndex(const std::string& name) const;
  unsigned getPropIndex(const std::string& name) const;
  VarType getVarType(const std::string& name) const;
  const std::string& getVarName(unsigned i) const;

  bool hasVar(const std::string& name);
  bool hasArrayVar(const std::string& name);
  bool hasIntVar(const std::string& name);
  bool hasPropVar(const std::string& name);
};

class Formula {
 protected:
  PVarMap var_map;
  std::vector<PFormula> args;
  // constructor.
  Formula(PVarMap m) : var_map(m) {}

 public:
  // write this formula to the screen.
  virtual void display(std::ostream& out) const = 0;

  /** Return the id for this term variable. */
  unsigned getVarId(std::string const& varName) { return var_map->getVarIndex(varName); }

  unsigned getPropId(std::string const& varName) {
    return var_map->getPropIndex(varName);
  }
};

// integer-sorted terms.
class Term : public Formula {
 protected:
  Term(PVarMap m) : Formula(m) {}

 public:
  virtual ValueType termValue(uint32_t cycle, unsigned trace,
                              const TraceList& traces) = 0;
};

// trace propositions (booleans).
class TraceProp : public Formula {
 protected:
  TraceProp(PVarMap m) : Formula(m) {}

 public:
  // evaluate the proposition in a particular trace.
  virtual bool propValue(uint32_t cycle, unsigned trace, const TraceList& traces) = 0;
};

// hyper-propositions (defined over multiple traces).
class HyperProp : public Formula {
 protected:
  HyperProp(PVarMap m) : Formula(m) {}

 public:
  // evaluate the formula at this time index.
  virtual bool eval(uint32_t cycle, const TraceList& traces) = 0;
};

/** Formula TermVar(name): this is an integer valued variable. */
class TermVar : public Term {
  unsigned index;

 public:
  TermVar(PVarMap m, unsigned i) : Term(m), index(i) {}

  virtual void display(std::ostream& out) const;
  virtual ValueType termValue(uint32_t cycle, unsigned trace, const TraceList& traces);
};

class TermArrayVar : public Term {
  unsigned index;

 public:
  TermArrayVar(PVarMap m, unsigned vi) : Term(m), index(vi) {}

  virtual void display(std::ostream& out) const;
  virtual ValueType termValue(uint32_t cycle, unsigned trace, const TraceList& traces);
};

/** Formula PropVar(name): this is a boolean variable. */
class PropVar : public TraceProp {
  unsigned index;

 public:
  PropVar(PVarMap m, unsigned i) : TraceProp(m), index(i) {}

  virtual void display(std::ostream& out) const;
  virtual bool propValue(uint32_t cycle, unsigned trace, const TraceList& traces);
};

/** Formula true. */
class True : public TraceProp {
 public:
  True(PVarMap m) : TraceProp(m) {}

  virtual void display(std::ostream& out) const;
  virtual bool propValue(uint32_t cycle, unsigned trace, const TraceList& traces);
};

/** Predicate (eq v_1,v_2,...,v_n). */
class Equal : public HyperProp {
 public:
  Equal(PVarMap m, PTerm term) : HyperProp(m) { args.push_back(term); }
  Equal(PVarMap m, PTermArray termArr) : HyperProp(m) { args.push_back(termArr); }
  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

/** TraceSelect. */
class TraceSelect : public HyperProp {
  unsigned trace;

 public:
  TraceSelect(PVarMap m, unsigned tr, PTraceProp p) : HyperProp(m), trace(tr) {
    args.push_back(p);
  }
  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

/** Formula !a */
class Not : public HyperProp {
 public:
  Not(PVarMap m, PHyperProp f) : HyperProp(m) { args.push_back(f); }
  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

/** Formula a /\ b */
class And : public HyperProp {
 public:
  And(PVarMap m, PHyperProp a, PHyperProp b) : HyperProp(m) {
    args.push_back(a);
    args.push_back(b);
  }
  And(PVarMap m, std::vector<PHyperProp> props) : HyperProp(m) {
    std::copy(props.begin(), props.end(), std::back_inserter(args));
  }
  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

/** Formula a \/ b */
class Or : public HyperProp {
 public:
  Or(PVarMap m, PHyperProp a, PHyperProp b) : HyperProp(m) {
    args.push_back(a);
    args.push_back(b);
  }
  Or(PVarMap m, std::vector<PHyperProp> props) : HyperProp(m) {
    std::copy(props.begin(), props.end(), std::back_inserter(args));
  }
  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

/** Formula a => b */
class Implies : public HyperProp {
 public:
  Implies(PVarMap m, PHyperProp a, PHyperProp b) : HyperProp(m) {
    args.push_back(a);
    args.push_back(b);
  }
  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

/** Formula G(phi). */
class Always : public HyperProp {
  bool past;

 public:
  Always(PVarMap m, PHyperProp f) : HyperProp(m), past(true) { args.push_back(f); }

  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

class Yesterday : public HyperProp {
  bool present;

 public:
  Yesterday(PVarMap m, PHyperProp f) : HyperProp(m), present(false) { args.push_back(f); }

  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

class Once : public HyperProp {
  bool valid;

 public:
  Once(PVarMap m, PHyperProp f) : HyperProp(m), valid(false) { args.push_back(f); }

  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

///////////////////////////////////////////////////////
// f1 S f2 : f2 occured at some past time and f1 has //
//           held since that time until present      //
///////////////////////////////////////////////////////

class Since : public HyperProp {
  bool validF1, validF2;

 public:
  Since(PVarMap m, PHyperProp f1, PHyperProp f2)
      : HyperProp(m), validF1(true), validF2(false) {
    args.push_back(f1);
    args.push_back(f2);
  }

  virtual void display(std::ostream& out) const;
  virtual bool eval(uint32_t cycle, const TraceList& traces);
};

}  // namespace HyperPLTL

#endif
