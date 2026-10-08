// xpeel.h: bulk X-step peel B&B certificates for main-search child kills (kill2, DESIGN 27.11), checked by K2.childL.
//
// Coordinates: labels 0..510 (prof7 --rord 123).  A child u reads everything in its window: labels o = u+1 .. 510 (n = 510-u).
// Matrices: slot l at bits 512*l (label layout, as L1's N and the c2t slices).
//
// Per node (prefix Q):
//   node matrix  = L1's N' (CONF1 | c2t[p] for p in Q)  |  cliques of the dictionary rows with residual 1 at Q
//   dictionary   = big rows (cap >= 3) cited once per node (RT.K3eDL ids), shared by all children of the node
// Per child u (one certificate, K2.childL):
//   child matrix = node matrix | c2t[u] | cliques of the child's rows (dictionary rows through u with residual 2 at Q), in the window
//   tree         = X-steps (functional X, d) and branches on a window index v; the in-branch adds the cliques U\{v} of listed
//                  dictionary rows (residual 2 at Q+u, through v) and, if flagged, c2t[u+1+v] without row/column v
//
// Usage (inside prof7R3 or as a post-pass):
//   xpeel::Static S; S.load(c2tFile);                       // once: label order, deficit masks, L1's static tables
//   xpeel::NodeCtx N(S, nodeIn);                            // per node: prefix and its big rows with residual 1/2/3
//   for each X kill of kind 4/5 (or any kind): N.gen(childIn, certBytes, &stats)
//   N.nodeRecord(nodeBytes);                                // after the node's children: dictionary + node-matrix rows
// The certificate bytes are the stream read by K2/XNodeT.lean (#k2xnode); format in xpeel.cc (emitNode / emitChild).
#pragma once
#include <cstdint>
#include <vector>
#include <string>
namespace xpeel {
typedef uint64_t u64;
struct BS { u64 w[8]; };
inline void bzero(BS& a){ for(int k=0;k<8;k++) a.w[k]=0; }
inline int pc(const BS& a){ int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(a.w[k]); return c; }
inline bool tst(const BS& a,int i){ return (a.w[i>>6]>>(i&63))&1; }
inline void set1(BS& a,int i){ a.w[i>>6]|=1ULL<<(i&63); }
inline void clr1(BS& a,int i){ a.w[i>>6]&=~(1ULL<<(i&63)); }

struct Static {
  int LABV[511], VLAB[512], RANK[512], NEED[512]; BS HITL[512];
  std::vector<BS> c2t;    // 511*511 slots: c2t[p*511+u] = union of the cap-2 rows through p and u, minus u (L1's table)
  std::vector<BS> conf1;  // 511 slots: cap-1 rows through u, minus u
  bool load(const char* c2tFile);   // r22/lean/rerun/r3/rt/C3eD.c2t
};
struct RowIn { int id; int res; BS m; };    // a big row (cap >= 3): RT id, residual at the node prefix, label mask
struct NodeIn { std::vector<int> Q; BS F; std::vector<RowIn> rows; };   // rows: residual 1, 2 or 3, >= 2 points of F
struct ChildIn { int u; BS Fu; int kind; long bb; };
struct GenStats { int ok=0, nodes=0, steps=0, inBranches=0, leaves=0, childRows=0, branchUses=0, c2Uses=0, newRows=0, coverFail=0; double usGen=0, usCover=0; };
struct Params { long lim=4000; int branchRule=2; double cite=0.17, outer=0.04, outerNode=0.01; int dropC2=1; int prune=1; int pruneSteps=0; int agg=0; double outerAgg=0.12; int leafSearch=0; };

class NodeCtx {
 public:
  NodeCtx(const Static& S, const NodeIn& in, const Params& P = Params());
  ~NodeCtx();
  bool gen(const ChildIn& c, std::vector<uint8_t>& cert, GenStats* st = nullptr);
  // rows the node already cites for other certificates (L1's T/C rows, check6 roots): free for the cover; given as RT ids
  void preload(const std::vector<int>& rtIds);
  void nodeRecord(std::vector<uint8_t>& out) const;
  int dictSize() const;
  int nodeRowCount() const;
  void aggStats(long& pairs, int& labels) const;   // aggregate mode: (label, row) pairs and labels with an aggregate
 public:
  struct Impl; Impl* I;      // implementation (xpeel.cc)
};
}
