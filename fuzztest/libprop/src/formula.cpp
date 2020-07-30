#include "formula.h"

namespace HyperPLTL {

std::ostream& operator<<(std::ostream& out, const Formula& t) {
  t.display(out);
  return out;
}

//////////////////////////////////////////////
// VarMap class member function definitions //
//////////////////////////////////////////////

const std::string& VarMap::getVarName(unsigned i) const {
  assert(i < varNames.size());
  return varNames[i];
}

unsigned VarMap::getVarIndex(const std::string& name) const {
  auto it = std::find(varNames.begin(), varNames.end(), name);
  assert(it != varNames.end());
  return it - varNames.begin();
}

unsigned VarMap::getPropIndex(const std::string& name) const {
  auto it = std::find(propNames.begin(), propNames.end(), name);
  assert(it != propNames.end());
  return it - propNames.begin();
}

VarType VarMap::getVarType(const std::string& name) const {
  auto it = varInfo.find(name);
  assert(it != varInfo.end());
  return it->second;
}

unsigned VarMap::addVar(const std::string& name, VarType type) {
  std::vector<std::string>::const_iterator it =
      std::find(varNames.begin(), varNames.end(), name);

  if (it != varNames.end()) {
    assert(varInfo[name] == type);
    return it - varNames.begin();
  }

  varInfo[name] = type;
  varNames.push_back(name);
  return varNames.size() - 1;
}

unsigned VarMap::addIntVar(const std::string& name) {
  return addVar(name, VarType::INT_VAR);
}

unsigned VarMap::addArrayVar(const std::string& name) {
  return addVar(name, VarType::ARRAY_VAR);
}

unsigned VarMap::addPropVar(const std::string& name) {
  std::vector<std::string>::const_iterator it =
      std::find(propNames.begin(), propNames.end(), name);

  if (it != propNames.end()) {
    assert(varInfo[name] == VarType::PROP_VAR);
    return it - propNames.begin();
  }

  varInfo[name] = VarType::PROP_VAR;
  propNames.push_back(name);
  return propNames.size() - 1;
}

bool VarMap::hasVar(const std::string& name) {
  return varInfo.find(name) != varInfo.end();
}

bool VarMap::hasArrayVar(const std::string& name) {
  auto it = varInfo.find(name);
  if (it == varInfo.end()) return false;
  return it->second == VarType::ARRAY_VAR;
}

bool VarMap::hasIntVar(const std::string& name) {
  auto it = varInfo.find(name);
  if (it == varInfo.end()) return false;
  return it->second == VarType::INT_VAR;
}

bool VarMap::hasPropVar(const std::string& name) {
  auto it = varInfo.find(name);
  if (it == varInfo.end()) return false;
  return it->second == VarType::PROP_VAR;
}

// ---------------------------------------------------------------------- //
//                               class True                               //
// ---------------------------------------------------------------------- //
void True::display(std::ostream& out) const { out << "true"; }

bool True::propValue(uint32_t cycle, unsigned trace, const TraceList& traces) {
  return true;
}

// ---------------------------------------------------------------------- //
//                            class TermVar                               //
// ---------------------------------------------------------------------- //
void TermVar::display(std::ostream& out) const { out << var_map->getVarName(index); }

ValueType TermVar::termValue(uint32_t cycle, unsigned trace, const TraceList& traces) {
  assert(traces.size() > trace);
  return traces[trace]->termValueAt(index, cycle);
}

// ---------------------------------------------------------------------- //
//                            class TermArrayVar                          //
// ---------------------------------------------------------------------- //

void TermArrayVar::display(std::ostream& out) const { out << var_map->getVarName(index); }

ValueType TermArrayVar::termValue(uint32_t cycle, unsigned trace,
                                  const TraceList& traces) {
  assert(traces.size() > trace);
  return traces[trace]->termValueAt(index, cycle);
}

// ---------------------------------------------------------------------- //
//                            class PropVar                               //
// ---------------------------------------------------------------------- //
void PropVar::display(std::ostream& out) const { out << var_map->getVarName(index); }

bool PropVar::propValue(uint32_t cycle, unsigned trace, const TraceList& traces) {
  // eval not well-defined when multiple traces are available.
  assert(trace < traces.size());
  return traces[trace]->propValueAt(index, cycle);
}

// ---------------------------------------------------------------------- //
//                             class Equal                                //
// ---------------------------------------------------------------------- //
void Equal::display(std::ostream& out) const {
  out << "(eq";
  for (auto arg : args) {
    out << " ";
    arg->display(out);
  }
  out << ")";
}

bool Equal::eval(uint32_t cycle, const TraceList& traces) {
  // eval not well-defined when multiple traces are available.
  assert(traces.size() > 0);

  if (PTermArray arg = std::dynamic_pointer_cast<TermArrayVar>(args[0]); arg) {
    ValueType vec0 = arg->termValue(cycle, 0, traces);
    //    assert(vec0.size() == arg->getSize());
    for (unsigned i = 1; i != traces.size(); i++) {
      if (arg->termValue(cycle, i, traces) != vec0) return false;
    }
    return true;
  }

  if (PTerm arg = std::dynamic_pointer_cast<Term>(args[0]); arg) {
    ValueType v0 = arg->termValue(cycle, 0, traces);
    for (unsigned i = 1; i != traces.size(); i++) {
      if (arg->termValue(cycle, i, traces) != v0) return false;
    }
    return true;
  }

  std::cerr << "Error : Invalid applicaiton of Equal operator\n";
  exit(1);
}

// ---------------------------------------------------------------------- //
//                          class TraceSelect                             //
// ---------------------------------------------------------------------- //
void TraceSelect::display(std::ostream& out) const {
  out << "(trace-select " << trace << " ";
  args[0]->display(out);
  out << ")";
}

bool TraceSelect::eval(uint32_t cycle, const TraceList& traces) {
  auto p = std::dynamic_pointer_cast<TraceProp>(args[0]);
  return p->propValue(cycle, trace, traces);
}

// ---------------------------------------------------------------------- //
//                              class Not                                 //
// ---------------------------------------------------------------------- //
void Not::display(std::ostream& out) const {
  out << "(not ";
  args[0]->display(out);
  out << ")";
}

bool Not::eval(uint32_t cycle, const TraceList& traces) {
  using namespace std;
  auto p = dynamic_pointer_cast<HyperProp>(args[0]);
  return !p->eval(cycle, traces);
}

// ---------------------------------------------------------------------- //
//                              class And                                 //
// ---------------------------------------------------------------------- //
void And::display(std::ostream& out) const {
  out << "(and ";
  for (auto arg : args) {
    out << " ";
    arg->display(out);
  }
  out << ")";
}

bool And::eval(uint32_t cycle, const TraceList& traces) {
  using namespace std;
  bool r = true;
  for (auto arg : args) {
    auto p = dynamic_pointer_cast<HyperProp>(arg);
    r = r && p->eval(cycle, traces);
  }
  return r;
}

// ---------------------------------------------------------------------- //
//                              class Or                                  //
// ---------------------------------------------------------------------- //
void Or ::display(std::ostream& out) const {
  out << "(or ";
  for (auto arg : args) {
    out << " ";
    arg->display(out);
  }
  out << ")";
}

bool Or::eval(uint32_t cycle, const TraceList& traces) {
  bool r = false;
  for (auto arg : args) {
    auto p = std::dynamic_pointer_cast<HyperProp>(arg);
    auto currval = p->eval(cycle, traces);
    r = r || currval;
  }
  return r;
}

// ---------------------------------------------------------------------- //
//                        class Implies                                   //
// ---------------------------------------------------------------------- //
void Implies ::display(std::ostream& out) const {
  out << "(=> ";
  for (auto arg : args) {
    out << " ";
    arg->display(out);
  }
  out << ")";
}

bool Implies ::eval(uint32_t cycle, const TraceList& traces) {
  auto p1 = std::dynamic_pointer_cast<HyperProp>(args[0]);
  auto p2 = std::dynamic_pointer_cast<HyperProp>(args[1]);
  auto left = p1->eval(cycle, traces);
  auto right = p2->eval(cycle, traces);
  return (!left) || right;
}

// ---------------------------------------------------------------------- //
//                            class Always                                //
// ---------------------------------------------------------------------- //

void Always::display(std::ostream& out) const {
  out << "(G ";
  args[0]->display(out);
  out << ")";
}

bool Always::eval(uint32_t cycle, const TraceList& traces) {
  auto f = std::dynamic_pointer_cast<HyperProp>(args[0]);
  past = past && f->eval(cycle, traces);
  return past;
}

// ---------------------------------------------------------------------- //
//                        class Yesterday                                 //
// ---------------------------------------------------------------------- //

void Yesterday::display(std::ostream& out) const {
  out << "(Y ";
  args[0]->display(out);
  out << ")";
}

bool Yesterday::eval(uint32_t cycle, const TraceList& traces) {
  // FIXME : need to fix yesterday computation logic or trace compression
  // mechanism, the evaluation seems to be returning past values

  auto f = std::dynamic_pointer_cast<HyperProp>(args[0]);
  bool past = present;
  present = f->eval(cycle, traces);
  return past;
}

// ---------------------------------------------------------------------- //
//                        class once                                      //
// ---------------------------------------------------------------------- //

void Once::display(std::ostream& out) const {
  out << "(O ";
  args[0]->display(out);
  out << ")";
}

bool Once::eval(uint32_t cycle, const TraceList& traces) {
  auto f = std::dynamic_pointer_cast<HyperProp>(args[0]);
  auto currval = f->eval(cycle, traces);
  valid = valid || currval;
  return valid;
}

// ---------------------------------------------------------------------- //
//                        class since                                     //
// ---------------------------------------------------------------------- //

void Since::display(std::ostream& out) const {
  out << "(S ";
  args[0]->display(out);
  args[1]->display(out);
  out << ")";
}

bool Since::eval(uint32_t cycle, const TraceList& traces) {
  // S(f1, f2) : f2 is true at some point in past and f1 is true since then
  auto f1 = std::dynamic_pointer_cast<HyperProp>(args[0]);
  auto f2 = std::dynamic_pointer_cast<HyperProp>(args[1]);

  if (validF2 == false) {
    validF2 = f2->eval(cycle, traces);
    return false;
  } else {
    validF1 = validF1 && f1->eval(cycle, traces);
    return validF1;
  }
}

}  // namespace HyperPLTL
