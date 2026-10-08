// xpeel2.cc: implementation of xpeel2.h.  Build: g++ -O3 -march=native -std=c++17 -c xpeel2.cc   (with xpeel.cc for Static)
//
// Certificate bytes: the 27.11 format of xpeel.cc (items = [u64 len][len bytes LE Nat]):
//   node record : nQ, Q*, ndict, (row id, residual at Q)*, nnode, (dictionary index of a node-matrix row)*
//   child       : kind, bb, u, t, Fu, ncr, (dictionary index of a child row)*, tree
//   tree        : leaf 0, ns, (X, d)*, finX, finD  |  node 1, ns, (X, d)*, v, c2, nb, (dictionary index)*, left, right
//                 |  cut 2, 0 (Params2::cut: the path has more than t in-branch picks; hybrid trees K2.XT3)
// Here Fu = Fn & above(u) & ~Anode[u] for the final node matrix, so the composed checker can recompute it from the frame.
//
// Semantics used for generation and replay are the kernel's (K2.checkXT): an in-branch on v adds c2t[v] (without row and
// column v) to every row and the cliques U \ {v} of its listed rows; so a certificate stays valid when the root shrinks or the
// matrix grows, which the joint generation relies on (children generated early are emitted against the final node).
#include "xpeel2.h"
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <algorithm>
#include <chrono>
#include <functional>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <map>
namespace xp2 {
using xpeel::bzero; using xpeel::pc; using xpeel::tst; using xpeel::set1; using xpeel::clr1;
static inline BS band(const BS& a,const BS& b){ BS c; for(int k=0;k<8;k++) c.w[k]=a.w[k]&b.w[k]; return c; }
static inline BS bandn(const BS& a,const BS& b){ BS c; for(int k=0;k<8;k++) c.w[k]=a.w[k]&~b.w[k]; return c; }
static inline BS bor(const BS& a,const BS& b){ BS c; for(int k=0;k<8;k++) c.w[k]=a.w[k]|b.w[k]; return c; }
static inline bool bnz(const BS& a){ for(int k=0;k<8;k++) if(a.w[k]) return true; return false; }
#if defined(__AVX512VPOPCNTDQ__) && defined(__AVX512F__)
#include <immintrin.h>
static inline int pcand(const BS& a,const BS& b){ return (int)_mm512_reduce_add_epi64(_mm512_popcnt_epi64(_mm512_and_si512(_mm512_loadu_si512(a.w),_mm512_loadu_si512(b.w)))); }
static inline int pcandn(const BS& a,const BS& c_){ return (int)_mm512_reduce_add_epi64(_mm512_popcnt_epi64(_mm512_andnot_si512(_mm512_loadu_si512(c_.w),_mm512_loadu_si512(a.w)))); }
#else
static inline int pcand(const BS& a,const BS& b){ int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(a.w[k]&b.w[k]); return c; }
static inline int pcandn(const BS& a,const BS& c_){ int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(a.w[k]&~c_.w[k]); return c; }
#endif
template<class F> static inline void forbits(const BS& a,F f){ for(int k=0;k<8;k++){ u64 x=a.w[k]; while(x){ int v=k*64+__builtin_ctzll(x); x&=x-1; f(v); } } }
static BS above(int u){ BS a; bzero(a); for(int l=u+1;l<511;l++) set1(a,l); return a; }
typedef std::chrono::steady_clock CK;
double gProf[8]={0}; long gProfN[8]={0};   // profiling of the cover's parts (single-threaded runs)
static inline double usSince(CK::time_point t){ return std::chrono::duration<double,std::micro>(CK::now()-t).count(); }

struct TNode { std::vector<std::pair<int,int>> steps; bool leaf=false, cut=false; int fk=-1, fd=0; int v=-1; std::vector<int> brows; int l=-1, r=-1; };

struct Node2::Impl {
  const Static& S; Params2 P; std::vector<int> Q; BS Pm, Fn; std::vector<RowIn> rows;
  std::vector<std::vector<int>> byPt;       // label -> rows holding it (built on demand: needPts)
  std::vector<char> ptBuilt;
  void needPts(const BS& labels){ BS need; bzero(need); for(int l=0;l<511;l++) if(tst(labels,l) && !ptBuilt[l]){ set1(need,l); ptBuilt[l]=1; }
    if(!bnz(need)) return; for(size_t ix=0;ix<rows.size();ix++){ BS m=band(rows[ix].m,need); if(bnz(m)) forbits(m,[&](int l){ byPt[l].push_back(ix); }); } }
  const std::vector<int>& pts(int l){ if(!ptBuilt[l]){ BS b; bzero(b); set1(b,l); needPts(b); } return byPt[l]; }
  std::vector<int> res1;                    // residual-1 rows
  std::vector<BS> NM;                       // node matrix within Fn: conf1 | c2t[p] (p in Q) | cliques of the node rows (511 slots)
  std::vector<char> l1, inDict, nodeRole; std::vector<int> dict, dpos;
  std::vector<std::vector<int>> dict2By;    // label -> residual-2 dictionary rows holding it
  std::vector<int> dX, dD; std::vector<BS> dH;   // node deficits: functional X, need at Q (>= 1), hyperplane mask
  std::vector<std::vector<int>> Brows; std::vector<std::vector<char>> inB; std::vector<char> Bused;   // hybrid: per-label aggregates B_x
  bool inBx(int x,int ix) const { return !inB[x].empty() && inB[x][ix]; }
  void addB(int x,int ix){ if(inB[x].empty()) inB[x].assign(rows.size(),0); if(!inB[x][ix]){ inB[x][ix]=1; Brows[x].push_back(ix); } }
  struct Child {
    int u=0, t=0, kind=0; long bb=0; int mode=0; BS Fu0, Fu; std::vector<BS> D; std::vector<int> Dd, DX;
    std::vector<int> nodeR, childR, excl;            // full mode: node-row candidates, child rows, exclusions in use
    std::vector<TNode> T; int root=-1; long nodes=0; bool fail=false; bool allowBr=false, allowCR=false, freeOnly=false;
    std::vector<char> selC, c2; std::set<int> selB; std::vector<int> selN; std::set<std::pair<int,int>> selP;   // selP: hybrid (label, row) pairs
  };
  std::vector<Child> kids;
  Stats2* cur=nullptr;                      // phase timers of the child being generated
  std::function<void(int, std::vector<RowIn>&)> fetch2; std::vector<char> fetched;
  // residual-2 rows through u from the caller (last fallback); appended rows get fresh indices
  bool fetchedAll=false;
  void fetchRows(int u){ if(!fetch2 || fetchedAll || (u>=0 && fetched[u])) return; if(u>=0) fetched[u]=1; else fetchedAll=true;
    std::vector<RowIn> more; fetch2(u,more);   // u = -1: every residual-2 big row
    std::unordered_set<int> have; if(u>=0){ for(int ix:pts(u)) have.insert(rows[ix].id); } else for(auto& R:rows) have.insert(R.id);
    for(auto& R:more){ if(have.count(R.id)) continue; int ix=rows.size(); rows.push_back(R); l1.push_back(0); inDict.push_back(0); nodeRole.push_back(0); dpos.push_back(-1);
      forbits(R.m,[&](int l){ if(ptBuilt[l]) byPt[l].push_back(ix); }); }
    for(auto& v:inB) if(!v.empty()) v.resize(rows.size(),0); }
  Impl(const Static& S_, const NodeIn2& in, const Params2& P_): S(S_), P(P_), Q(in.Q), Fn(in.Fn), rows(in.rows), fetch2(in.fetch2) {
    fetched.assign(511,0);
    bzero(Pm); for(int q:Q) set1(Pm,q);
    byPt.assign(511,{}); ptBuilt.assign(511,0); for(size_t ix=0;ix<rows.size();ix++) if(rows[ix].res==1) res1.push_back(ix);
    NM.assign(511,BS());
    for(int v=0;v<511;v++){ BS a=S.conf1[v]; for(int p:Q) a=bor(a,S.c2t[(size_t)p*511+v]); NM[v]=band(a,Fn); clr1(NM[v],v); }
    Brows.assign(511,{}); inB.assign(511,{}); Bused.assign(511,0);
    l1.assign(rows.size(),0); inDict.assign(rows.size(),0); nodeRole.assign(rows.size(),0); dpos.assign(rows.size(),-1); dict2By.assign(511,{});
    auto find=[&](int id)->int{ size_t lo=0, hi=rows.size(); while(lo<hi){ size_t mid=(lo+hi)/2; if(rows[mid].id<id) lo=mid+1; else hi=mid; } return (lo<rows.size() && rows[lo].id==id)? (int)lo : -1; };
    for(int id:in.l1R1){ int ix=find(id); if(ix>=0 && rows[ix].res==1) l1[ix]=1; }
    for(int id:in.l1R2){ int ix=find(id); if(ix>=0 && rows[ix].res==2) l1[ix]=1; }
    if(P.l1Node) for(size_t ix=0;ix<rows.size();ix++) if(l1[ix] && rows[ix].res==1) addNode(ix);
    for(int X=1;X<512;X++){ int dl=S.NEED[X]-pcand(S.HITL[X],Pm); if(dl>=1){ dX.push_back(X); dD.push_back(dl); dH.push_back(S.HITL[X]); } }
  }
  void addDict(int ix){ if(!inDict[ix]){ inDict[ix]=1; dpos[ix]=dict.size(); dict.push_back(ix); if(rows[ix].res==2) forbits(rows[ix].m,[&](int l){ dict2By[l].push_back(ix); }); } }
  void addNode(int ix){ if(nodeRole[ix]) return; nodeRole[ix]=1; addDict(ix); const BS m=rows[ix].m; forbits(m,[&](int v){ NM[v]=bor(NM[v],m); clr1(NM[v],v); }); }
  bool freeRow(int ix) const { return inDict[ix] || l1[ix]; }
  static void addClique(std::vector<BS>& adj,const BS& mm){ forbits(mm,[&](int w){ adj[w]=bor(adj[w],mm); clr1(adj[w],w); }); }
  BS smallBr(const Child& C,int p,int w) const { BS m=band(S.c2t[(size_t)p*511+w],C.Fu0); clr1(m,p); return m; }
  // the in-branch matrix update of the kernel: c2t[v] without row / column v, in every row of the window
  void addC2(const Child& C,std::vector<BS>& adj,int v) const { if(P.noC2v) return; forbits(C.Fu0,[&](int w){ if(w!=v) adj[w]=bor(adj[w],smallBr(C,v,w)); }); }
  BS xstep(const Child& C,const BS& cand,const std::vector<BS>& adj,int k) const {
    BS Y=band(cand,C.D[k]); BS nc=cand; int d=C.Dd[k]; int ny=pc(Y);
    if(ny<d) return BS();
    forbits(cand,[&](int v){ if(ny-pcand(Y,adj[v])<d) clr1(nc,v); });
    return nc; }
  int globalFail(const Child& C,const BS& cand) const { for(size_t k=0;k<C.D.size();k++) if(pcand(cand,C.D[k])<C.Dd[k]) return (int)k; return -1; }
  // the peel: repeated X-steps, each the largest removal among the K tightest demands (all demands when K = 0); a step
  // that closes some tight demand wins.  Returns the failing demand (leaf) or -1.
  int peel(const Child& C,BS& cand,const std::vector<BS>& adj,std::vector<std::pair<int,int>>& steps) const {
    const int K=P.peelK; std::vector<std::pair<int,int>> sl; sl.reserve(C.D.size());
    for(int it=0;it<400;it++){
      sl.clear(); for(size_t k=0;k<C.D.size();k++){ int s_=pcand(cand,C.D[k])-C.Dd[k]; if(s_<0) return (int)k; sl.push_back({s_,(int)k}); }
      if(K>0 && (int)sl.size()>K){ std::nth_element(sl.begin(),sl.begin()+K,sl.end()); sl.resize(K); bool h0=false; for(auto& x:sl) h0|=x.second==0; if(!h0) sl.push_back({0,0}); }
      int best=-1, bestRem=0; BS bestNC=cand; int nc0=pc(cand);
      for(auto& x:sl){ int k=x.second; BS nc=xstep(C,cand,adj,k); int rem=nc0-pc(nc); if(rem<=0) continue;
        bool closes=false;
        if(K>0){ for(auto& y:sl) if(pcand(nc,C.D[y.second])<C.Dd[y.second]){ closes=true; break; } }
        else closes=globalFail(C,nc)>=0;
        if(closes){ best=k; bestNC=nc; break; }
        if(rem>bestRem){ bestRem=rem; best=k; bestNC=nc; } }
      if(best<0) return -1;
      steps.push_back({best,C.Dd[best]}); cand=bestNC; }
    return -1; }
  int pick(const Child& C,const BS& cand,const BS& picked,const std::vector<BS>& adj) const {
    int bk=-1, bs=1<<30; int BR=P.branchRule;
    if(BR!=3) for(size_t k=1;k<C.D.size();k++){ if(pcand(picked,C.D[k])>=C.Dd[k]) continue; int sl=pcand(cand,C.D[k])-C.Dd[k]; if(sl<bs){ bs=sl; bk=(int)k; } }
    BS Y=bandn(bk>=0? band(cand,C.D[bk]) : cand, picked); if(!bnz(Y)) Y=bandn(cand,picked); if(!bnz(Y)) return -1;
    if(BR==0){ for(int k=0;k<8;k++) if(Y.w[k]) return k*64+__builtin_ctzll(Y.w[k]); return -1; }
    int bv=-1; long bsc=-(1L<<40);
    forbits(Y,[&](int v){ int dg=pcand(adj[v],cand); long sc=(BR>=2)? -dg : dg; if(sc>bsc){ bsc=sc; bv=v; } });
    return bv; }
  // branch rows of an in-branch on v: residual-2 rows not through u, through v; in the free mode (or when not allowed) only
  // dictionary rows
  template<class F> void forBranchRows(const Child& C,int v,F f) const {
    if(!C.allowBr) return;
    if(C.freeOnly){ for(int ix:dict2By[v]) if(!tst(rows[ix].m,C.u)) f(ix); }
    else for(int ix:const_cast<Impl*>(this)->pts(v)){ const RowIn& R=rows[ix]; if(R.res==2 && !tst(R.m,C.u)) f(ix); } }
  bool cutNow=false;   // Params2::cut 2/3: the retry of a failing child
  bool cutOn(const Child& C) const { return P.agg==2 && (P.cut==1 || cutNow || (P.cut==3 && !C.freeOnly)); }   // hybrid trees only (K2.XT3)
  int rec(Child& C,BS cand,std::vector<BS>& adj,BS picked){
    if(C.fail) return -1; if(++C.nodes>P.lim){ C.fail=true; return -1; }
    int id=C.T.size(); C.T.push_back(TNode()); TNode nd;
    if(cutOn(C) && pc(picked)>C.t){ nd.leaf=true; nd.cut=true; C.T[id]=nd; return id; }   // budget cut: more than t picks
    int g=peel(C,cand,adj,nd.steps);
    if(g>=0){ nd.leaf=true; nd.fk=g; nd.fd=C.Dd[g]; C.T[id]=nd; return id; }
    int v=pick(C,cand,picked,adj); if(v<0){ C.fail=true; return -1; }
    nd.v=v; BS c1=bandn(cand,adj[v]);
    std::vector<BS> adj1=adj; addC2(C,adj1,v);
    if(P.agg) for(int ix:Brows[v]){ BS m2=band(rows[ix].m,C.Fu0); clr1(m2,v); addClique(adj1,m2); }
    forBranchRows(C,v,[&](int ix){ if(P.agg && inBx(v,ix)) return; BS mm=band(rows[ix].m,c1); clr1(mm,v); if(pc(mm)<P.brMin) return; nd.brows.push_back(ix); BS m2=band(rows[ix].m,C.Fu0); clr1(m2,v); addClique(adj1,m2); });
    BS p1=picked; set1(p1,v); C.T[id]=nd;
    int l=rec(C,c1,adj1,p1); if(C.fail) return -1;
    BS c0=cand; clr1(c0,v); int r=rec(C,c0,adj,picked); if(C.fail) return -1;
    C.T[id].l=l; C.T[id].r=r; return id; }
  struct Ev { int v; BS X; int need; int tn; BS cov; };
  // events of the full replay (each removal needs |X ∩ A_v| >= |X| - d + 1, each pick all of cand ∩ A_v); eb/ee: the event
  // range of every tree node's subtree (events are appended in DFS order)
  void recEv(const Child& C,int id,BS cand,std::vector<BS>& adjF,std::vector<Ev>& ev,std::vector<int>& eb,std::vector<int>& ee,const std::vector<BS>& adjS0) const {
    const std::vector<BS>& adjS=adjS0;
    const TNode& nd=C.T[id]; eb[id]=ev.size();
    for(auto& s:nd.steps){ BS X=band(cand,C.D[s.first]); BS nc=xstep(C,cand,adjF,s.first); int need=pc(X)-s.second+1;
      BS gone=bandn(cand,nc); forbits(gone,[&](int v){ Ev e; e.v=v; e.X=X; e.need=need; e.tn=id; e.cov=band(X,adjS[v]); ev.push_back(e); }); cand=nc; }
    if(nd.leaf){ ee[id]=ev.size(); return; }
    int v=nd.v; { Ev e; e.v=v; e.X=band(cand,adjF[v]); e.need=pc(e.X); e.tn=id; e.cov=band(e.X,adjS[v]); ev.push_back(e); }
    BS c1=bandn(cand,adjF[v]);
    std::vector<BS> aF=adjF; addC2(C,aF,v);
    for(int ix:nd.brows){ BS mm=band(rows[ix].m,C.Fu0); clr1(mm,v); addClique(aF,mm); }
    if(P.agg){ std::vector<BS> aS=adjS; addC2(C,aS,v); for(int ix:Brows[v]){ BS mm=band(rows[ix].m,C.Fu0); clr1(mm,v); addClique(aS,mm); addClique(aF,mm); } recEv(C,nd.l,c1,aF,ev,eb,ee,aS); }
    else recEv(C,nd.l,c1,aF,ev,eb,ee,adjS);
    BS c0=cand; clr1(c0,v); recEv(C,nd.r,c0,adjF,ev,eb,ee,adjS);
    ee[id]=ev.size(); }
  // the cover: items (0 node row, 1 child row, 2 branch row, 3 the c2t flag of an in-branch) with their contributions to the
  // unsatisfied events, a lazy cost-weighted greedy, then an event-exact redundancy prune (every event stays covered, so the
  // replay with the selection equals the full replay)
  struct It { int kind, pos, ix, tn; double cost; std::vector<std::pair<int,BS>> ez; };
  void cover(Child& C,const std::vector<BS>& adjF,const std::vector<BS>& adjS,bool useNode){
    auto tq=CK::now();
    std::vector<Ev> ev; std::vector<int> eb(C.T.size(),0), ee(C.T.size(),0);
    { std::vector<BS> aF=adjF; recEv(C,C.root,C.Fu,aF,ev,eb,ee,adjS); }
    gProf[0]+=usSince(tq); gProfN[0]+=ev.size(); tq=CK::now();
    std::vector<char> uns(ev.size(),0); std::vector<std::vector<int>> evByV(511);
    for(size_t i=0;i<ev.size();i++) if(pc(ev[i].cov)<ev[i].need){ uns[i]=1; evByV[ev[i].v].push_back(i); }
    std::vector<It> items;
    auto rowItem=[&](int kind,int pos,int ix,double cost){ It it{kind,pos,ix,-1,cost,{}}; const BS m=band(rows[ix].m,C.Fu0);
      forbits(m,[&](int v){ for(int ei:evByV[v]){ BS z=band(m,ev[ei].X); clr1(z,v); if(pcandn(z,ev[ei].cov)>0) it.ez.push_back({ei,z}); } });
      if(!it.ez.empty()) items.push_back(std::move(it)); };
    if(useNode) for(int ix:C.nodeR) rowItem(0,-1,ix,(freeRow(ix)?0.0:P.cDict)+P.cNode);
    for(size_t j=0;j<C.childR.size();j++){ int ix=C.childR[j]; rowItem(1,(int)j,ix,(freeRow(ix)?0.0:P.cDict)+P.cCR); }
    gProf[1]+=usSince(tq); gProfN[1]+=items.size(); tq=CK::now();
    { // in-branch rows: per in-branch, its subtree's unsatisfied events bucketed by vertex; one item per row (27.11) or per
      // (label, row) pair (hybrid), contributions OR-ed over the in-branches that list it
      std::unordered_map<long long,int> keyItem; std::vector<std::vector<std::pair<int,BS>>> accs; std::vector<std::pair<int,int>> keys;
      std::vector<std::vector<int>> bucket(511); std::vector<int> touched;
      for(size_t t=0;t<C.T.size();t++){ const TNode& nd=C.T[t]; if(nd.leaf || nd.brows.empty()) continue; int L=nd.l, pv=nd.v;
        touched.clear(); for(int ei=eb[L];ei<ee[L];ei++){ if(!uns[ei] || ev[ei].v==pv) continue; int v=ev[ei].v; if(bucket[v].empty()) touched.push_back(v); bucket[v].push_back(ei); }
        for(int ix:nd.brows){ long long key=P.agg? (((long long)pv)<<32)|(unsigned)ix : (long long)ix; auto f=keyItem.find(key); int k;
          if(f==keyItem.end()){ k=accs.size(); keyItem[key]=k; accs.emplace_back(); keys.push_back({pv,ix}); } else k=f->second;
          BS m=band(rows[ix].m,C.Fu0); clr1(m,pv);
          forbits(m,[&](int v){ for(int ei:bucket[v]){ BS z=band(m,ev[ei].X); clr1(z,v); if(!bnz(z)) continue; accs[k].push_back({ei,z}); } }); }
        for(int v:touched) bucket[v].clear(); }
      for(size_t k=0;k<accs.size();k++){ int pv=keys[k].first, ix=keys[k].second;
        It it{P.agg?4:2,P.agg?pv:-1,ix,-1,(freeRow(ix)?0.0:P.cDict)+(P.agg?P.cPair:P.cUse),{}};
        auto& A=accs[k]; std::sort(A.begin(),A.end(),[](const std::pair<int,BS>& x,const std::pair<int,BS>& y){ return x.first<y.first; });
        for(size_t q=0;q<A.size();){ size_t r=q+1; BS z=A[q].second; while(r<A.size() && A[r].first==A[q].first){ z=bor(z,A[r].second); r++; } if(pcandn(z,ev[A[q].first].cov)>0) it.ez.push_back({A[q].first,z}); q=r; }
        if(!it.ez.empty()) items.push_back(std::move(it)); } }
    gProf[2]+=usSince(tq); gProfN[2]+=items.size(); tq=CK::now();
    if(!P.agg) for(size_t i=0;i<C.T.size();i++) if(!C.T[i].leaf){ int L=C.T[i].l, p=C.T[i].v; It it{3,-1,-1,(int)i,P.cC2,{}};
      for(int ei=eb[L];ei<ee[L];ei++){ if(!uns[ei] || ev[ei].v==p) continue; BS z=band(smallBr(C,p,ev[ei].v),ev[ei].X); if(pcandn(z,ev[ei].cov)>0) it.ez.push_back({ei,z}); }
      if(!it.ez.empty()) items.push_back(std::move(it)); }
    auto score=[&](const It& it)->long{ long sc=0; for(auto& q:it.ez){ const Ev& e=ev[q.first]; int rem=e.need-pc(e.cov); if(rem<=0) continue; sc+=std::min(rem,pcandn(q.second,e.cov)); } return sc; };
    gProf[3]+=usSince(tq); tq=CK::now();
    std::vector<std::pair<double,int>> heap;
    for(size_t k=0;k<items.size();k++){ long sc=score(items[k]); if(sc>0) heap.push_back({items[k].cost>0? sc/items[k].cost : 1e18,(int)k}); }
    std::make_heap(heap.begin(),heap.end());
    std::vector<BS> cov0(ev.size()); for(size_t i=0;i<ev.size();i++) cov0[i]=ev[i].cov;
    std::vector<int> sel;
    while(!heap.empty()){
      std::pop_heap(heap.begin(),heap.end()); auto top=heap.back(); heap.pop_back();
      const It& it=items[top.second];
      long sc=score(it); if(sc<=0) continue; double pr=it.cost>0? sc/it.cost : 1e18;
      if(!heap.empty() && pr<heap.front().first){ heap.push_back({pr,top.second}); std::push_heap(heap.begin(),heap.end()); continue; }
      sel.push_back(top.second);
      for(auto& q:it.ez) ev[q.first].cov=bor(ev[q.first].cov,q.second); }
    gProf[4]+=usSince(tq); gProfN[4]+=sel.size(); tq=CK::now();
    std::vector<char> on(items.size(),0); for(int k:sel) on[k]=1;
    if(P.prune>=1){   // event-exact redundancy prune, last selected first
      std::vector<std::vector<int>> byEv(ev.size()); for(int k:sel) for(size_t j=0;j<items[k].ez.size();j++) byEv[items[k].ez[j].first].push_back(k);
      auto zOf=[&](int k,int ei)->BS{ for(auto& q:items[k].ez) if(q.first==ei) return q.second; return BS(); };
      for(auto it=sel.rbegin(); it!=sel.rend(); ++it){ int k=*it; bool need=false;
        for(auto& q:items[k].ez){ int ei=q.first; const Ev& e=ev[ei]; BS c=cov0[ei]; for(int j:byEv[ei]) if(j!=k && on[j]) c=bor(c,zOf(j,ei)); if(pcand(c,e.X)<e.need){ need=true; break; } }
        if(!need) on[k]=0; } }
    gProf[5]+=usSince(tq);
    C.selC.assign(C.childR.size(),0); C.c2.assign(C.T.size(),P.agg?1:0); C.selB.clear(); C.selN.clear(); C.selP.clear();
    for(int k:sel) if(on[k]){ const It& it=items[k]; if(it.kind==0) C.selN.push_back(it.ix); else if(it.kind==1) C.selC[it.pos]=1; else if(it.kind==2) C.selB.insert(it.ix); else if(it.kind==3) C.c2[it.tn]=1; else C.selP.insert({it.pos,it.ix}); }
  }
  bool repRec(const Child& C,int id,BS cand,std::vector<BS>& adj,BS picked) const {
    const TNode& nd=C.T[id];
    if(nd.cut) return pc(picked)>C.t;
    for(auto& s:nd.steps) cand=xstep(C,cand,adj,s.first);
    if(nd.leaf) return pcand(cand,C.D[nd.fk])<nd.fd;
    int v=nd.v; BS c1=bandn(cand,adj[v]); std::vector<BS> adj1=adj; inBranchAdj(C,id,adj1);
    BS p1=picked; set1(p1,v);
    if(!repRec(C,nd.l,c1,adj1,p1)) return false;
    BS c0=cand; clr1(c0,v); return repRec(C,nd.r,c0,adj,picked); }
  // the in-branch matrix update of tree node id (the kernel's: aggregate B_v, or c2t[v] and the selected branch rows)
  void inBranchAdj(const Child& C,int id,std::vector<BS>& adj1) const {
    const TNode& nd=C.T[id]; const int v=nd.v;
    if(P.agg){ addC2(C,adj1,v); for(int ix:Brows[v]){ BS mm=band(rows[ix].m,C.Fu0); clr1(mm,v); addClique(adj1,mm); }
      for(int ix:nd.brows) if(!inBx(v,ix) && C.selP.count({v,ix})){ BS mm=band(rows[ix].m,C.Fu0); clr1(mm,v); addClique(adj1,mm); } }
    else { if(C.c2[id]) addC2(C,adj1,v);
      for(int ix:nd.brows) if(C.selB.count(ix)){ BS mm=band(rows[ix].m,C.Fu0); clr1(mm,v); addClique(adj1,mm); } } }
  // incremental step prune (pruneSteps 2): top-down over the tree with each node's input state; a step goes when the node's
  // subtree still replays without it.  Ancestors are final when a node is pruned, and every later removal below is checked on
  // its own subtree with the same inputs, so the final tree replays.
  void pruneRec(Child& C,int id,BS cand,std::vector<BS>& adj,BS picked){
    TNode& nd=C.T[id];
    if(nd.cut) return;
    auto& stp=nd.steps;
    for(int j=(int)stp.size()-1;j>=0;j--){ auto save=stp[j]; stp.erase(stp.begin()+j); if(!repRec(C,id,cand,adj,picked)) stp.insert(stp.begin()+j,save); }
    for(auto& s:stp) cand=xstep(C,cand,adj,s.first);
    if(nd.leaf) return;
    const int v=nd.v; BS c1=bandn(cand,adj[v]); std::vector<BS> adj1=adj; inBranchAdj(C,id,adj1);
    BS p1=picked; set1(p1,v);
    pruneRec(C,nd.l,c1,adj1,p1);
    BS c0=cand; clr1(c0,v); pruneRec(C,nd.r,c0,adj,picked); }
  // the child's matrix from the current node matrix, c2t[u], extra node rows `xn` (not yet node rows) and the selected child rows
  void childAdj(const Child& C,std::vector<BS>& adj,const std::vector<int>& xn) const {
    adj.assign(511,BS());
    forbits(C.Fu0,[&](int v){ adj[v]=band(P.noC2u? NM[v] : bor(NM[v],S.c2t[(size_t)C.u*511+v]),C.Fu0); clr1(adj[v],v); });
    for(int ix:xn) addClique(adj,band(rows[ix].m,C.Fu0));
    for(size_t j=0;j<C.childR.size();j++) if(C.selC[j]) addClique(adj,band(rows[C.childR[j]].m,C.Fu0)); }
  bool replay(const Child& C,const BS& Fu,const std::vector<int>& xn) const { std::vector<BS> adj; childAdj(C,adj,xn); BS p0; bzero(p0); return repRec(C,C.root,Fu,adj,p0); }
  BS fuNow(const Child& C) const { return bandn(C.Fu0,NM[C.u]); }
  void setup(Child& C,const ChildIn2& ci){
    C.u=ci.u; C.kind=ci.kind; C.bb=ci.bb; C.t=22-(int)Q.size()-1;
    { BS a=S.conf1[C.u]; for(int p:Q) a=bor(a,S.c2t[(size_t)p*511+C.u]); C.Fu0=bandn(band(Fn,above(C.u)),a); }   // Fn above u outside N'[u]
    C.D.clear(); C.Dd.clear(); C.DX.clear();
    C.D.push_back(C.Fu0); C.Dd.push_back(C.t); C.DX.push_back(0);
    for(size_t i=0;i<dX.size();i++){ int dl=dD[i]-(int)tst(dH[i],C.u); if(dl>=1){ C.D.push_back(dH[i]); C.Dd.push_back(dl); C.DX.push_back(dX[i]); } }
    C.allowCR = (C.kind>=4) || P.childRowsK23; C.allowBr = (C.kind==5 && P.brK5) || (C.kind==4 && P.brK4) || (C.kind<=3 && P.branchRowsK23);
  }
  // free mode: the node matrix as it is, dictionary child and branch rows (kinds 4/5), no new rows
  bool attemptFree(Child& C,bool semi=false){
    auto t0=CK::now();
    C.T.clear(); C.root=-1; C.nodes=0; C.fail=false; C.freeOnly=true; C.selB.clear(); C.selN.clear(); C.excl.clear(); C.nodeR.clear(); C.childR.clear();
    C.Fu=fuNow(C);
    if(semi){ for(int ix:pts(C.u)) if(rows[ix].res==2 && pcand(rows[ix].m,C.Fu)>=2) C.childR.push_back(ix); }   // semi-free: every child row may be new
    else if(C.allowCR) for(int ix:dict2By[C.u]) if(pcand(rows[ix].m,C.Fu)>=2) C.childR.push_back(ix);
    C.selC.assign(C.childR.size(),0);
    std::vector<BS> adjS; childAdj(C,adjS,{});
    std::vector<BS> adj=adjS; for(int ix:C.childR) addClique(adj,band(rows[ix].m,C.Fu0));
    if(cur) cur->usSetup+=usSince(t0); t0=CK::now();
    C.root=rec(C,C.Fu,adj,BS());
    if(cur) cur->usTree+=usSince(t0);
    if(C.fail) return false;
    bool anyBr=false; for(auto& t:C.T) if(!t.brows.empty()) anyBr=true;
    if(C.childR.empty() && !anyBr && !P.pruneC2){ C.c2.assign(C.T.size(),1); return true; }   // nothing to choose
    t0=CK::now(); cover(C,adj,adjS,false); if(cur) cur->usCover+=usSince(t0);
    return true; }
  // full mode: every exclusion and every clique row, then the cover (dictionary rows free) and a replay prune of the new exclusions
  bool attemptFull(Child& C){
    auto t0=CK::now();
    C.T.clear(); C.root=-1; C.nodes=0; C.fail=false; C.freeOnly=false; C.selB.clear(); C.selN.clear(); C.excl.clear(); C.nodeR.clear(); C.childR.clear();
    for(int ix:pts(C.u)){ const RowIn& R=rows[ix]; if(R.res!=1 || nodeRole[ix]) continue; if(pcand(R.m,C.Fu0)<1) continue; C.excl.push_back(ix); }
    BS Fu=fuNow(C); for(int ix:C.excl) Fu=bandn(Fu,rows[ix].m);
    if(P.nodeCand) for(int ix:res1){ if(nodeRole[ix]) continue; const RowIn& R=rows[ix]; if(tst(R.m,C.u)) continue; if(pcand(R.m,Fu)>=2) C.nodeR.push_back(ix); }
    if(C.allowCR){ for(int ix:pts(C.u)){ const RowIn& R=rows[ix]; if(R.res==2 && pcand(R.m,Fu)>=2) C.childR.push_back(ix); } }
    else for(int ix:dict2By[C.u]) if(pcand(rows[ix].m,Fu)>=2) C.childR.push_back(ix);
    C.Fu=Fu;
    std::vector<BS> adjS; C.selC.assign(C.childR.size(),0); childAdj(C,adjS,{});       // free part: node matrix + c2t[u]
    std::vector<BS> adj=adjS; for(int ix:C.nodeR) addClique(adj,band(rows[ix].m,C.Fu0)); for(int ix:C.childR) addClique(adj,band(rows[ix].m,C.Fu0));
    if(cur) cur->usSetup+=usSince(t0); t0=CK::now();
    C.root=rec(C,Fu,adj,BS());
    if(cur) cur->usTree+=usSince(t0);
    if(C.fail) return false;
    t0=CK::now(); cover(C,adj,adjS,true); if(cur) cur->usCover+=usSince(t0);
    if(P.verify>=2 && !replay(C,C.Fu,C.selN)){ C.fail=true; if(cur) cur->coverFail=1; return false; }
    // exclusion prune: drop new exclusion rows whose points the certificate can live with (fewest unique points first)
    if(P.exclPrune && !P.allExcl){ t0=CK::now();
      std::vector<std::pair<int,int>> ord;
      for(int ix:C.excl){ BS rest; bzero(rest); for(int jx:C.excl) if(jx!=ix) rest=bor(rest,rows[jx].m); ord.push_back({pcandn(band(rows[ix].m,C.Fu0),rest),ix}); }
      std::sort(ord.begin(),ord.end());
      for(auto& pr:ord){ int ix=pr.second; std::vector<int> ex2; for(int jx:C.excl) if(jx!=ix) ex2.push_back(jx);
        BS F2=fuNow(C); for(int jx:ex2) F2=bandn(F2,rows[jx].m);
        if(replay(C,F2,C.selN)){ C.excl=ex2; C.Fu=F2; } }
      if(cur) cur->usExcl+=usSince(t0); }
    if(P.prune>=2){ t0=CK::now();   // replay prune of the selection (finds rows the event cover could not prove redundant)
      for(auto it=C.selN.rbegin(); it!=C.selN.rend(); ++it){ int ix=*it; std::vector<int> save=C.selN; C.selN.erase(std::find(C.selN.begin(),C.selN.end(),ix)); if(!replay(C,C.Fu,C.selN)) C.selN=save; }
      for(size_t j=0;j<C.childR.size();j++) if(C.selC[j]){ C.selC[j]=0; if(!replay(C,C.Fu,C.selN)) C.selC[j]=1; }
      std::vector<int> bk(C.selB.begin(),C.selB.end());
      for(int ix:bk){ C.selB.erase(ix); if(!replay(C,C.Fu,C.selN)) C.selB.insert(ix); }
      for(size_t i=0;i<C.T.size();i++) if(C.c2[i]){ C.c2[i]=0; if(!replay(C,C.Fu,C.selN)) C.c2[i]=1; }
      if(cur) cur->usPrune+=usSince(t0); }
    return true;
  }
  // estimated kernel cost (ms) of a child's certificate (model of 27.11 (3), window 400): declaration, X-steps (9 + 3(d-1)
  // operations), in-branches, listed rows and C2 flags, child-row cliques
  double certCost(const Child& C) const {
    const double W=(510-C.u)/400.0; double c=P.cChild;
    for(size_t i=0;i<C.T.size();i++){ const TNode& t=C.T[i];
      if(t.cut){ c+=P.cCut; continue; }
      for(auto& s:t.steps) c+=P.cStep*W*(9+3*(s.second-1))/16.5;
      if(!t.leaf){ if(P.agg){ c+=P.cBrH*W; continue; } c+=P.cBr*W; int nb=0; for(int ix:t.brows) nb+=C.selB.count(ix); c+=nb*P.cUse*W; if(!C.c2.empty() && C.c2[i]) c+=P.cC2*W; } }
    for(char x:C.selC) if(x) c+=P.cCR*W;
    return c; }
  double newRowCost(const Child& C,int* n1=nullptr,int* n2=nullptr) const {
    std::unordered_set<int> r1, r2;
    for(int ix:C.excl) if(!nodeRole[ix]) r1.insert(ix);
    for(int ix:C.selN) if(!nodeRole[ix]) r1.insert(ix);
    for(size_t j=0;j<C.childR.size();j++) if(C.selC[j] && !freeRow(C.childR[j])) r2.insert(C.childR[j]);
    for(int ix:C.selB) if(!freeRow(ix)) r2.insert(ix);
    for(auto& pr:C.selP) if(!freeRow(pr.second)) r2.insert(pr.second);
    double c=0; for(int ix:r1) c+=(freeRow(ix)?0.0:P.cDict)+P.cNode; c*=P.amort1; c+=r2.size()*P.cDict;
    if(n1) *n1=r1.size(); if(n2) *n2=r2.size(); return c; }
  // drop X-steps the replay does not need (last first); the replay uses the node as it is now, and later node rows only shrink F_u
  void pruneStepsOf(Child& C){
    auto t0=CK::now(); std::vector<int> xn=C.selN;
    if(P.pruneSteps==2){ std::vector<BS> adj; childAdj(C,adj,xn); BS p0; bzero(p0); pruneRec(C,C.root,C.Fu,adj,p0); if(cur) cur->usPrune+=usSince(t0); return; }
    for(size_t i=0;i<C.T.size();i++){ auto& stp=C.T[i].steps;
      for(int j=(int)stp.size()-1;j>=0;j--){ auto save=stp[j]; stp.erase(stp.begin()+j); if(!replay(C,C.Fu,xn)) stp.insert(stp.begin()+j,save); } }
    if(cur) cur->usPrune+=usSince(t0); }
  void commit(Child& C,Stats2* st){
    int nr=0, ne=0;
    auto cnt=[&](int ix){ if(!inDict[ix] && !l1[ix]) nr++; };
    for(int ix:C.excl) if(!nodeRole[ix]){ cnt(ix); ne++; addNode(ix); }
    for(int ix:C.selN) if(!nodeRole[ix]){ cnt(ix); addNode(ix); }
    for(size_t j=0;j<C.childR.size();j++) if(C.selC[j]){ cnt(C.childR[j]); addDict(C.childR[j]); }
    for(int ix:C.selB){ cnt(ix); addDict(ix); }
    if(P.agg){ int np=0; for(auto& pr:C.selP){ cnt(pr.second); addDict(pr.second); if(!inBx(pr.first,pr.second)){ addB(pr.first,pr.second); np++; } }
      for(auto& t:C.T) if(!t.leaf) Bused[t.v]=1; if(st) st->branchUses=np; }
    if(st){ st->newRows=nr; st->newExcl=ne; }
  }
};

Node2::Node2(const Static& S, const NodeIn2& in, const Params2& P): I(new Impl(S,in,P)) {}
Node2::~Node2(){ delete I; }
int Node2::dictSize() const { return I->dict.size(); }
int Node2::nodeRows() const { int c=0; for(int ix:I->dict) c+=I->nodeRole[ix]; return c; }
int Node2::extraRows() const { int c=0; for(int ix:I->dict) c+=!I->l1[ix]; return c; }
int Node2::extra1() const { int c=0; for(int ix:I->dict) c+=(!I->l1[ix] && I->rows[ix].res==1); return c; }

namespace { struct Out { std::vector<uint8_t>& b; void nat(uint64_t x){ uint8_t t[8]; int n=0; while(x){ t[n++]=x&255; x>>=8; } for(int i=0;i<8;i++) b.push_back(i==0?n:0); b.insert(b.end(),t,t+n); }
  void bits(const BS& m){ uint8_t v[64]; memset(v,0,64); int mx=-1; for(int l=0;l<512;l++) if(tst(m,l)){ v[l>>3]|=1<<(l&7); mx=l; } int n=mx>=0? mx/8+1:0; for(int i=0;i<8;i++) b.push_back(i==0?n:0); b.insert(b.end(),v,v+n); } }; }

void Node2::genAll(const std::vector<ChildIn2>& kidsIn, std::vector<std::vector<uint8_t>>& certs, std::vector<char>& ok, std::vector<Stats2>* st){
  Impl& M=*I; const size_t n=kidsIn.size(); M.kids.assign(n,Impl::Child()); certs.assign(n,{}); ok.assign(n,0);
  std::vector<Stats2> st0; if(!st) st=&st0; st->assign(n,Stats2());
  for(size_t i=0;i<n;i++){ auto t0=CK::now(); M.setup(M.kids[i],kidsIn[i]); (*st)[i].usSetup+=usSince(t0); }
  { BS need; bzero(need); bool all=false;   // the row index for the labels the full-mode children need (all labels when a child has in-branch rows)
    for(auto& C:M.kids){ bool full=M.P.fullOnly || C.kind>=4 || (C.kind==3 && C.bb>=M.P.fullBB3) || (C.kind==2 && C.bb>=M.P.fullBB2) || (C.kind<=3 && M.P.semi23); if(full) set1(need,C.u); if(full && C.allowBr) all=true; }
    if(all) for(int l=0;l<511;l++) set1(need,l);
    auto t0=CK::now(); M.needPts(need); if(n) (*st)[0].usSetup+=usSince(t0); }
  // order: the full-mode classes first (heavy first), so their new node rows serve the free-mode children
  std::vector<int> ord(n); for(size_t i=0;i<n;i++) ord[i]=i;
  auto isFull=[&](const Impl::Child& C){ return M.P.fullOnly || C.kind>=4 || (C.kind==3 && C.bb>=M.P.fullBB3) || (C.kind==2 && C.bb>=M.P.fullBB2); };
  std::stable_sort(ord.begin(),ord.end(),[&](int a,int b){ bool fa=isFull(M.kids[a]), fb=isFull(M.kids[b]); if(fa!=fb) return fa; return M.kids[a].bb>M.kids[b].bb; });
  for(int i:ord){ auto t0=CK::now(); Impl::Child& C=M.kids[i]; M.cur=&(*st)[i]; bool g=false;
   for(int pass=0;pass<2 && !g;pass++){
    if(pass==1){ if(M.P.cut<2) break; M.cutNow=true; C.allowCR=(C.kind>=4) || M.P.childRowsK23; C.allowBr=(C.kind==5 && M.P.brK5) || (C.kind==4 && M.P.brK4) || (C.kind<=3 && M.P.branchRowsK23); }   // retry with budget cuts
    if(isFull(C)){
      g=M.attemptFull(C); if(g) C.mode=2;
      if(!g && C.allowBr && M.P.brMin>2){ int bm=M.P.brMin; M.P.brMin=2; g=M.attemptFull(C); if(g) C.mode=2; M.P.brMin=bm; }   // fallback: every in-branch row
      if(!g && !C.allowBr && C.kind>=4){ C.allowBr=true; g=M.attemptFull(C); if(g) C.mode=2; else C.allowBr=false; }   // fallback: in-branch rows for kind 4
      if(!g && M.P.limRetry>M.P.lim){ long l0=M.P.lim; int k0=M.P.peelK; M.P.lim=M.P.limRetry; M.P.peelK=0; int b0=M.P.brMin; M.P.brMin=2; bool br=C.allowBr; C.allowBr=true; M.fetchRows(-1); g=M.attemptFull(C); if(g) C.mode=2; else C.allowBr=br; M.P.lim=l0; M.P.peelK=k0; M.P.brMin=b0; }   // fallback: every demand, in-branch rows, a larger tree
      if(g && M.P.tryFree){ int n1=0,n2=0; double cF=M.certCost(C)+M.newRowCost(C,&n1,&n2);
        if(n1+n2>0){ Impl::Child save=C; if(M.attemptFree(C) && M.certCost(C)<=cF) C.mode=1; else C=save; } }
      if(!g){ g=M.attemptFree(C); if(g) C.mode=1; } }
    else {
      g=M.attemptFree(C,M.P.semi23); if(g) C.mode=M.P.semi23?3:1;
      // a free certificate with in-branches: the full mode may avoid them with a few rows; the cheaper wins
      if(g && M.P.tryFull){ int nb=0; for(auto& t:C.T) nb+=!t.leaf;
        if(nb>=M.P.tryFull){ double cF=M.certCost(C); Impl::Child save=C;
          if(M.attemptFull(C) && M.certCost(C)+M.newRowCost(C)<cF) C.mode=2; else C=save; } }
      if(!g){ g=M.attemptFull(C); if(g) C.mode=2; }
      if(!g){ bool cr=C.allowCR; long l0=M.P.lim; int k0=M.P.peelK; C.allowCR=true; M.P.lim=std::max(M.P.lim,M.P.limRetry); M.P.peelK=0; int b0=M.P.brMin; M.P.brMin=2; bool br=C.allowBr; C.allowBr=true; M.fetchRows(-1); g=M.attemptFull(C); if(g) C.mode=2; else { C.allowCR=cr; C.allowBr=br; } M.P.lim=l0; M.P.peelK=k0; M.P.brMin=b0; } }   // fallback: child rows, every demand, a larger tree
   }
    M.cutNow=false;
    if(g && M.P.pruneSteps && (C.kind>=M.P.pruneStepsKind)) M.pruneStepsOf(C);
    if(g){ ok[i]=1; M.commit(C,&(*st)[i]); }
    (*st)[i].usGen+=usSince(t0); M.cur=nullptr; }
  // emission against the final node: Fu = Fu0 minus every node row through u; node matrix = the final one
  for(size_t i=0;i<n;i++){ if(!ok[i]) continue; Impl::Child& C=M.kids[i]; auto t0=CK::now();
    BS Fu=M.fuNow(C);
    if(M.P.verify && !M.replay(C,Fu,{})){ ok[i]=0; (*st)[i].coverFail=1; continue; }
    std::vector<uint8_t>& cert=certs[i]; Out o{cert};
    o.nat(C.kind); o.nat(C.bb); o.nat(C.u); o.nat(C.t); o.bits(Fu);
    int ncr=0; for(char x:C.selC) ncr+=x; o.nat(ncr); for(size_t j=0;j<C.childR.size();j++) if(C.selC[j]) o.nat(M.dpos[C.childR[j]]);
    int nst=0, nbn=0, nlv=0, nbu=0, nc2=0, ncut=0;
    std::function<void(int)> emit=[&](int id){ const TNode& t=C.T[id];
      if(t.cut){ o.nat(2); o.nat(0); ncut++; return; }   // budget cut (K2.XT3.cut)
      o.nat(t.leaf?0:1); o.nat(t.steps.size()); for(auto& s:t.steps){ o.nat(C.DX[s.first]); o.nat(s.second); } nst+=t.steps.size();
      if(t.leaf){ o.nat(C.DX[t.fk]); o.nat(t.fd); nlv++; return; }
      nbn++; o.nat(t.v-(C.u+1));
      if(M.P.agg){ emit(t.l); emit(t.r); return; }   // hybrid (K2.XT2): the in-branch adds the node's aggregate B_v
      o.nat(C.c2[id]?1:0); nc2+=C.c2[id];
      std::vector<int> br; for(int ix:t.brows) if(C.selB.count(ix)) br.push_back(M.dpos[ix]);
      o.nat(br.size()); for(int d:br) o.nat(d); nbu+=br.size(); emit(t.l); emit(t.r); };
    emit(C.root);
    Stats2& s=(*st)[i]; s.ok=1; s.mode=C.mode; s.nodes=C.nodes; s.steps=nst; s.inBranches=nbn; s.leaves=nlv; s.childRows=ncr; if(!M.P.agg) s.branchUses=nbu; s.c2Uses=nc2; s.cuts=ncut;
    s.usEmit+=usSince(t0);
  }
}

void Node2::nodeRecord(std::vector<uint8_t>& out) const {
  Out o{out}; const Impl& M=*I;
  o.nat(M.Q.size()); for(int q:M.Q) o.nat(q);
  o.nat(M.dict.size()); for(int ix:M.dict){ o.nat(M.rows[ix].id); o.nat(M.rows[ix].res); }
  std::vector<int> nl; for(size_t d=0;d<M.dict.size();d++) if(M.nodeRole[M.dict[d]]) nl.push_back(d);
  o.nat(nl.size()); for(int d:nl) o.nat(d);
  if(M.P.agg){ std::vector<int> xs; for(int x=0;x<511;x++) if(M.Bused[x]) xs.push_back(x);
    o.nat(xs.size()); for(int x:xs){ o.nat(x); o.nat(M.Brows[x].size()); for(int ix:M.Brows[x]) o.nat(M.dpos[ix]); } }
}
void Node2::aggStats(long& pairs, int& labels) const { pairs=0; labels=0; for(int x=0;x<511;x++) if(I->Bused[x]){ labels++; pairs+=I->Brows[x].size(); } }
}
