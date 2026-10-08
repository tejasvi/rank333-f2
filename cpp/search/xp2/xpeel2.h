// xpeel2.h: row-minimising bulk-peel generator (kill2, DESIGN 27.13).  Certificates in the 27.11 format (K2.childL, read by
// R3RT/Compose.lean), generated jointly for all bulk-peel children of a node so that they share as few dictionary rows as possible.
//
// What changes against xpeel.h (27.11):
//  * F_u is not an input.  It is derived from the node:  F_u = Fn ∩ above(u) \ Anode[u], where Fn is L1 v5's child window of the
//    node (node5's CH \ D'), and Anode = clrD(addCl N' rows) is the node matrix built from the node rows of the dictionary.  A node
//    row (residual 1 at Q) is a clique for the children outside it and an exclusion for the children in it, so no child cites its
//    own exclusion rows, and binding F_u to the frame is one slot test per child (`Fu = Fn & above(u) & ~Anode[u]`).
//  * L1's rows (the residual-1 rows of L1 v5's R1 list and the residual-2 rows of R2) are free: they are in the shared dictionary
//    already.  By default L1's residual-1 rows are node rows from the start (one outer product each in the node matrix).
//  * Generation is row-aware: every child first tries the free mode (exclusions and cliques from the dictionary only; existing
//    child and branch rows at their use cost).  Children that fail get the full mode (every exclusion and every clique row), a
//    cost-weighted cover with dictionary rows free, then a replay prune of the new exclusions and rows.  New residual-1 rows
//    become node rows and help every later child (more conflicts and smaller F_u never break a certificate).
//  * Emission happens after the whole node: each certificate carries the final F_u and is replayed against the final node.
//
// Usage:  xp2::Node2 N(S, nodeIn, params);  N.genAll(kids, certs, ok, &stats);  N.nodeRecord(bytes);
#pragma once
#include "xpeel.h"
#include <vector>
#include <cstdint>
#include <functional>
namespace xp2 {
using xpeel::BS; using xpeel::Static; using xpeel::RowIn; using xpeel::u64;
struct NodeIn2 {
  std::vector<int> Q;              // prefix labels (Q.back() = the node's label)
  BS Fn;                           // L1 v5's child window: labels above Q.back() outside D' (node5's Fn)
  std::vector<RowIn> rows;         // big rows (cap >= 3), residual 1 or 2 at Q, >= 2 points of Fn
  std::vector<int> l1R1, l1R2;     // RT ids of L1 v5's R1 (residual 1) and R2 (residual 2) lists: free dictionary rows
  // optional: residual-2 big rows through label u (u = -1: all of them; >= 3 points of Fn) that `rows` may lack, fetched for a
  // failing child's last fallback (child and in-branch rows); rows already present are skipped
  std::function<void(int, std::vector<RowIn>&)> fetch2;
};
struct ChildIn2 { int u; int kind; long bb; };
struct Params2 {
  long lim=4000; int branchRule=2; long limRetry=16000;   // B&B node limit; a failing full-mode child retries with limRetry
  int peelK=16;           // a peel step is the largest removal among the K tightest demands (0: all demands, as xpeel.cc)
  // cover costs (ms of kernel time): a new dictionary row, a node-matrix row, a child/branch clique use, an in-branch c2t flag
  double cDict=0.25, cNode=0.08, cUse=0.116, cC2=0.175, cCR=0.092;   // (cUse: a listed in-branch row, cCR: a child-row clique; per window 400)
  int childRowsK23=0;     // full mode: residual-2 child rows allowed for kinds 2/3 (their search did not use them)
  int branchRowsK23=0;    // branch rows allowed for kinds 2/3 (their search used none)
  int brMin=3;            // an in-branch row candidate needs >= brMin points in the in-branch's candidates (besides the pick); a failing
                          // child retries with 2
  int nodeCand=1;         // full mode: residual-1 rows outside the node matrix are clique candidates (else only exclusions)
  int brK5=1;             // branch rows allowed for kind 5 (crow kills)
  int brK4=0;             // branch rows allowed for kind 4 (its search used the residual-2 rows through u only); kind 5 always
  int fullBB3=1<<30;      // kind-3 kills with bb >= fullBB3 use the full mode first (default: free mode first)
  int fullBB2=1<<30;      // the same for kind 2
  int tryFree=0;          // full-mode classes: also try the free mode when the full certificate needs new rows; cheaper wins
  int semi23=0;           // kinds 2/3: the node matrix as it is plus any child row (residual 2 through u; a cover picks them)
  int tryFull=0;          // free-mode classes: a free certificate with >= tryFull in-branches also tries the full mode; cheaper wins (0: off)
  int exclPrune=1;        // replay prune of the new exclusion rows (full mode)
  int l1Node=1;           // L1's residual-1 rows are node rows from the start
  int prune=1;            // replay prune of the selected rows
  int pruneC2=0;          // free mode: also prune the in-branch c2t flags
  int fullOnly=0;         // every child in the full mode
  int allExcl=0;          // full mode: keep every exclusion (no exclusion choice)
  int verify=1;           // replay every certificate against the final node before emitting it (2: also after each cover)
  int agg=0;              // 0: the 27.11 format (K2.childL); 2: the hybrid format of 27.12 (K2.childL3: in-branch rows as per-label aggregates)
  int noC2u=0, noC2v=0;   // experiments: no c2t[u] in the child matrix / no c2t[v] in in-branches
  int cut=0;              // budget cuts (DESIGN 27.14): a tree path with more than t in-branch picks is a leaf (tree tag 2, K2.XT3);
                          // t = 22 - (|Q| + 1) labels lie above u in a completion (KD.above_le_tail).  1: always; 2: only when a child
                          // fails without (its attempts are repeated with cuts); 3: in the full mode, and as 2.  0 (off) until every
                          // checker reads tag 2.  Hybrid format only (agg 2): the 27.11 checker has no cut leaf
  double cCut=0.03;       // kernel cost of a cut leaf (ms): |P| > t on the path's pick mask
  int pruneSteps=0;       // drop X-steps the replay does not need (1: whole-tree replays; 2: incremental, each node's subtree from its input)
  int pruneStepsKind=2;   // ... for kills of kind >= this
  // certificate cost model (ms; window 400): child declaration, X-step at d = 3.5, in-branch; amortisation of new node rows
  double cChild=0.25, cStep=0.15, cBr=0.06, amort1=0.5;   // fitted per child with K2/XNodeT on 40,813 children of two generators (R2 0.986)
  double cPair=0.12, cBrH=0.08, cLab=0.1;   // hybrid: an aggregate (label, row) pair, an in-branch (shift + or of B_v), an aggregate label
};
struct Stats2 { int ok=0, mode=0, nodes=0, steps=0, inBranches=0, leaves=0, childRows=0, branchUses=0, c2Uses=0, newRows=0, newExcl=0, coverFail=0, cuts=0;
  double usGen=0, usSetup=0, usTree=0, usCover=0, usExcl=0, usPrune=0, usEmit=0; };
class Node2 {
 public:
  Node2(const Static& S, const NodeIn2& in, const Params2& P = Params2());
  ~Node2();
  // all bulk-peel children of the node; certs[i] empty when ok[i] = 0
  void genAll(const std::vector<ChildIn2>& kids, std::vector<std::vector<uint8_t>>& certs, std::vector<char>& ok, std::vector<Stats2>* st = nullptr);
  void nodeRecord(std::vector<uint8_t>& out) const;        // 27.11 node record: Q, dictionary (id, residual), node-row positions
  int dictSize() const;      // dictionary rows the certificates use (L1 rows included)
  int extraRows() const;     // dictionary rows outside L1's lists (r3c.py's X1 + X2)
  int nodeRows() const;      // node-matrix rows
  int extra1() const;        // extras of residual 1
  void aggStats(long& pairs, int& labels) const;   // hybrid: (label, row) pairs and labels of the node's aggregates
  struct Impl; Impl* I;
};
}
