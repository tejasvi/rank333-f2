// xpeel.cc: implementation of xpeel.h (see there).  Build: g++ -O3 -march=native -std=c++17 -c xpeel.cc
//
// Certificate bytes (items = [u64 len][len bytes little-endian Nat], as every kill2 stream):
//   node record : nQ, Q labels*, ndict, (row id, residual at Q)*, nnode, (dictionary index of a node-matrix row)*
//   child       : kind, bb, u, t, Fu (label mask), ncr, (dictionary index of a child row)*, tree
//   tree        : leaf: 0, nsteps, (X, d)*, finX, finD          (X = functional 1..511 of a deficit; 0 = the degree test, d = t)
//                 node: 1, nsteps, (X, d)*, v, c2, nb, (dictionary index)*, left, right
//                       (v = window index, label u+1+v; c2 = 1: add c2t[u+1+v] without row/column v; the listed rows: cliques U\{v})
// Generation: the peel B&B with every applicable big row, then a cost-weighted greedy cover of the replay's events (each
// exclusion needs |X ∩ A_v| >= |X| - d + 1, each in-branch needs all of cand ∩ A_v), reusing the node's dictionary rows for free.
// A covered replay equals the full-row replay, so the certificate is accepted; later children only add node-matrix rows, and
// more conflicts never break a certificate (all candidate sets shrink).
#include "xpeel.h"
#include <cstdio>
#include <cstring>
#include <algorithm>
#include <chrono>
#include <functional>
#include <unordered_map>
#include <set>
namespace xpeel {
static inline BS band(const BS& a,const BS& b){ BS c; for(int k=0;k<8;k++) c.w[k]=a.w[k]&b.w[k]; return c; }
static inline BS bandn(const BS& a,const BS& b){ BS c; for(int k=0;k<8;k++) c.w[k]=a.w[k]&~b.w[k]; return c; }
static inline BS bor(const BS& a,const BS& b){ BS c; for(int k=0;k<8;k++) c.w[k]=a.w[k]|b.w[k]; return c; }
static inline bool bnz(const BS& a){ for(int k=0;k<8;k++) if(a.w[k]) return true; return false; }
static inline int pcand(const BS& a,const BS& b){ int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(a.w[k]&b.w[k]); return c; }
static inline int pcandn(const BS& a,const BS& c_){ int c=0; for(int k=0;k<8;k++) c+=__builtin_popcountll(a.w[k]&~c_.w[k]); return c; }
template<class F> static inline void forbits(const BS& a,F f){ for(int k=0;k<8;k++){ u64 x=a.w[k]; while(x){ int v=k*64+__builtin_ctzll(x); x&=x-1; f(v); } } }
static int rank3(int x){ int r[3]={x&7,(x>>3)&7,(x>>6)&7}; int rk=0; for(int bit=0;bit<3;bit++){ int piv=-1; for(int i=0;i<3;i++) if(r[i]>=0 && (r[i]>>bit)&1){ piv=i; break; } if(piv<0) continue; int pv=r[piv]; r[piv]=-1; rk++; for(int i=0;i<3;i++) if(r[i]>=0 && (r[i]>>bit)&1) r[i]^=pv; } return rk; }

bool Static::load(const char* c2tFile){
  for(int v=0;v<512;v++) RANK[v]=v?rank3(v):0;
  { int k=0; for(int t=1;t<=3;t++) for(int v=1;v<512;v++) if(RANK[v]==t){ LABV[k]=v; VLAB[v]=k; k++; } VLAB[0]=-1; }
  for(int X=0;X<512;X++){ bzero(HITL[X]); for(int l=0;l<511;l++) if(__builtin_popcount(LABV[l]&X)&1) set1(HITL[X],l); NEED[X]=3*RANK[X]; }
  FILE* f=fopen(c2tFile,"rb"); if(!f) return false;
  c2t.resize((size_t)511*511); conf1.resize(511);
  bool ok = fread(c2t.data(),64,c2t.size(),f)==c2t.size() && fread(conf1.data(),64,511,f)==511;
  fclose(f); return ok;
}

struct TNode { std::vector<std::pair<int,int>> steps; bool leaf=false; int fk=-1, fd=0; int v=-1; std::vector<int> brows; int l=-1, r=-1; };
struct NodeCtx::Impl {
  const Static& S; Params P; std::vector<int> Q; BS Pm, F; std::vector<RowIn> rows;
  std::vector<BS> Nsmall;                 // node small conflicts, restricted to F
  std::vector<char> inDict, nodeRole; std::vector<int> dict; std::vector<int> dpos;
  std::vector<int> res1;                          // indices of residual-1 rows
  std::vector<std::vector<int>> byPt;             // label -> indices of residual-2/3 rows holding it
  bool agg=false; std::vector<std::vector<int>> Brows; std::vector<std::vector<char>> inB; std::vector<char> Bused;   // per-label aggregates
  Impl(const Static& S_, const NodeIn& in, const Params& P_): S(S_), P(P_), Q(in.Q), F(in.F), rows(in.rows) {
    byPt.assign(511,{});
    for(size_t ix=0;ix<rows.size();ix++){ if(rows[ix].res==1){ res1.push_back(ix); continue; } forbits(rows[ix].m,[&](int l){ byPt[l].push_back(ix); }); }
    bzero(Pm); for(int q:Q) set1(Pm,q);
    Nsmall.assign(511,BS());
    for(int v=0;v<511;v++){ if(!tst(F,v)){ bzero(Nsmall[v]); continue; } BS a=S.conf1[v]; for(int p:Q) a=bor(a,S.c2t[(size_t)p*511+v]); Nsmall[v]=band(a,F); }
    inDict.assign(rows.size(),0); nodeRole.assign(rows.size(),0); dpos.assign(rows.size(),-1);
    agg=P.agg; Brows.assign(511,{}); inB.assign(511,{}); Bused.assign(511,0);
  }
  bool inBx(int x,int ix) const { return !inB[x].empty() && inB[x][ix]; }
  void addB(int x,int ix){ if(inB[x].empty()) inB[x].assign(rows.size(),0); if(!inB[x][ix]){ inB[x][ix]=1; Brows[x].push_back(ix); } }
  // ---- per child ----
  struct Child { int u, t; BS Fu; std::vector<BS> D; std::vector<int> Dd, DX; std::vector<BS> adj0; std::vector<int> nodeR, childR, brR; std::vector<TNode> T; int root=-1; long nodes=0; bool fail=false; };
  static void addClique(std::vector<BS>& adj,const BS& mm){ forbits(mm,[&](int w){ adj[w]=bor(adj[w],mm); clr1(adj[w],w); }); }
  BS smallBr(const Child& C,int p,int w) const { BS m=band(S.c2t[(size_t)p*511+w],C.Fu); clr1(m,p); return m; }   // conflicts of w via cap-2 rows through p
  BS xstep(const Child& C,const BS& cand,const std::vector<BS>& adj,int k) const {
    BS Y=band(cand,C.D[k]); BS nc=cand; int d=C.Dd[k]; int ny=pc(Y);
    if(ny<d) return BS();      // global failure; caller handles
    forbits(cand,[&](int v){ if(ny-pcand(Y,adj[v])<d) clr1(nc,v); });   // |Y \ A_v| = |Y| - |Y ∩ A_v|
    return nc; }
  int globalFail(const Child& C,const BS& cand) const { for(size_t k=0;k<C.D.size();k++) if(pcand(cand,C.D[k])<C.Dd[k]) return (int)k; return -1; }
  int peel(const Child& C,BS& cand,const std::vector<BS>& adj,std::vector<std::pair<int,int>>& steps) const {
    for(int it=0;it<400;it++){
      int g=globalFail(C,cand); if(g>=0) return g;
      int best=-1, bestRem=0; BS bestNC=cand; int nc0=pc(cand);
      for(size_t k=0;k<C.D.size();k++){ BS nc=xstep(C,cand,adj,(int)k); int rem=nc0-pc(nc); if(rem<=0) continue;
        if(globalFail(C,nc)>=0){ best=(int)k; bestNC=nc; break; }
        if(rem>bestRem){ bestRem=rem; best=(int)k; bestNC=nc; } }
      if(best<0) return -1;
      steps.push_back({best,C.Dd[best]}); cand=bestNC; }
    return -1; }
  // targeted closing: for the K tightest demands f, steps chosen by removals inside H_f; the cheapest closing sequence
  int peelTarget(const Child& C,BS cand0,const std::vector<BS>& adj,std::vector<std::pair<int,int>>& steps,int K) const {
    std::vector<std::pair<int,int>> sl; for(size_t k=0;k<C.D.size();k++){ int s_=pcand(cand0,C.D[k])-C.Dd[k]; sl.push_back({s_,(int)k}); }
    std::sort(sl.begin(),sl.end()); int bestG=-1; long bestCost=1L<<40; std::vector<std::pair<int,int>> bestSt;
    for(int t=0;t<K && t<(int)sl.size();t++){ int f=sl[t].second; BS cand=cand0; std::vector<std::pair<int,int>> st_; long cost=0; int g=-1;
      for(int it=0;it<200;it++){ g=globalFail(C,cand); if(g>=0) break;
        int best=-1; long bsc=0; BS bnc=cand; int n0=pc(cand), h0=pcand(cand,C.D[f]);
        for(size_t k=0;k<C.D.size();k++){ BS nc=xstep(C,cand,adj,(int)k); int rem=n0-pc(nc); if(rem<=0) continue;
          if(globalFail(C,nc)>=0){ best=(int)k; bnc=nc; bsc=1L<<40; break; }
          long sc=(long)(h0-pcand(nc,C.D[f]))*1000+rem; if(sc>bsc){ bsc=sc; best=(int)k; bnc=nc; } }
        if(best<0){ g=-1; break; }
        st_.push_back({best,C.Dd[best]}); cost+=9+3*(C.Dd[best]-1); cand=bnc; }
      if(g>=0 && cost<bestCost){ bestCost=cost; bestG=g; bestSt=st_; } }
    if(bestG>=0) steps=bestSt;
    return bestG; }
  int pick(const Child& C,const BS& cand,const BS& picked,const std::vector<BS>& adj) const {
    int bk=-1, bs=1<<30; int BR=P.branchRule;
    if(BR==4){ for(size_t k=1;k<C.D.size();k++){ if(pcand(picked,C.D[k])>=C.Dd[k]) continue; int sz=pcand(cand,C.D[k]); if(sz<bs){ bs=sz; bk=(int)k; } } }
    else if(BR!=3) for(size_t k=1;k<C.D.size();k++){ if(pcand(picked,C.D[k])>=C.Dd[k]) continue; int sl=pcand(cand,C.D[k])-C.Dd[k]; if(sl<bs){ bs=sl; bk=(int)k; } }
    BS Y=bandn(bk>=0? band(cand,C.D[bk]) : cand, picked); if(!bnz(Y)) Y=bandn(cand,picked); if(!bnz(Y)) return -1;
    if(BR==0){ for(int k=0;k<8;k++) if(Y.w[k]) return k*64+__builtin_ctzll(Y.w[k]); return -1; }
    int bv=-1; long bsc=-(1L<<40);
    if(BR==5){   // most unmet demands containing v, then fewest conflicts
      forbits(Y,[&](int v){ int nd=0; for(size_t k=1;k<C.D.size();k++) if(tst(C.D[k],v) && pcand(picked,C.D[k])<C.Dd[k] && pcand(cand,C.D[k])-C.Dd[k]<=2) nd++;
        long sc=(long)nd*1000-pcand(adj[v],cand); if(sc>bsc){ bsc=sc; bv=v; } }); return bv; }
    if(BR==6){   // out-branch lookahead: one greedy step after removing v (removals; a closing branch wins)
      forbits(Y,[&](int v){ BS c0=cand; clr1(c0,v); long sc;
        if(globalFail(C,c0)>=0) sc=1L<<30; else { int best=0; int n0=pc(c0); for(size_t k=0;k<C.D.size();k++){ BS nc=xstep(C,c0,adj,(int)k); int rem=n0-pc(nc); if(globalFail(C,nc)>=0){ best=1<<20; break; } best=std::max(best,rem); } sc=best*1000L-pcand(adj[v],cand); }
        if(sc>bsc){ bsc=sc; bv=v; } }); return bv; }
    forbits(Y,[&](int v){ int dg=pcand(adj[v],cand); long sc=(BR==2||BR==3||BR==4)? -dg : dg; if(sc>bsc){ bsc=sc; bv=v; } });
    return bv; }
  int rec(Child& C,BS cand,std::vector<BS>& adj,BS picked){
    if(C.fail) return -1; if(++C.nodes>P.lim){ C.fail=true; return -1; }
    int id=C.T.size(); C.T.push_back(TNode()); TNode nd;
    BS cand0=cand;
    int g=peel(C,cand,adj,nd.steps);
    if(g>=0 && P.leafSearch>0 && nd.steps.size()>1){
      long c0=0; for(auto& s_:nd.steps) c0+=9+3*(s_.second-1);
      std::vector<std::pair<int,int>> st2; int g2=peelTarget(C,cand0,adj,st2,P.leafSearch);
      long c2=0; for(auto& s_:st2) c2+=9+3*(s_.second-1);
      if(g2>=0 && c2<c0){ nd.steps=st2; g=g2; } }
    if(g>=0){ nd.leaf=true; nd.fk=g; nd.fd=C.Dd[g]; C.T[id]=nd; return id; }
    int v=pick(C,cand,picked,adj); if(v<0){ C.fail=true; return -1; }
    nd.v=v; BS c1=bandn(cand,adj[v]);
    std::vector<BS> adj1=adj;
    forbits(c1,[&](int w){ if(w!=v) adj1[w]=bor(adj1[w],smallBr(C,v,w)); });
    for(int ix:byPt[v]){ const RowIn& R=rows[ix]; bool th=tst(R.m,C.u); if(agg ? R.res!=2 : !((R.res==2 && !th) || (R.res==3 && th))) continue;
      BS mm=band(R.m,c1); clr1(mm,v); if(pc(mm)<2) continue; nd.brows.push_back(ix); addClique(adj1,mm); }
    BS p1=picked; set1(p1,v); C.T[id]=nd;
    int l=rec(C,c1,adj1,p1); if(C.fail) return -1;
    BS c0=cand; clr1(c0,v); int r=rec(C,c0,adj,picked); if(C.fail) return -1;
    C.T[id].l=l; C.T[id].r=r; return id; }
  // ---- events of the full-row replay ----
  struct Ev { int v; BS X; int need; int tn; BS cov; };
  void recEv(const Child& C,int id,BS cand,std::vector<BS>& adjF,std::vector<Ev>& ev,std::vector<std::vector<std::pair<int,int>>>& anc,std::vector<std::pair<int,int>>& path,const std::vector<BS>& adjS) const {
    const TNode& nd=C.T[id]; anc[id]=path;
    for(auto& s:nd.steps){ BS X=band(cand,C.D[s.first]); BS nc=xstep(C,cand,adjF,s.first); int need=pc(X)-s.second+1;
      BS gone=bandn(cand,nc); forbits(gone,[&](int v){ Ev e; e.v=v; e.X=X; e.need=need; e.tn=id; e.cov=band(X,adjS[v]); ev.push_back(e); }); cand=nc; }
    if(nd.leaf) return;
    int v=nd.v; { Ev e; e.v=v; e.X=band(cand,adjF[v]); e.need=pc(e.X); e.tn=id; e.cov=band(e.X,adjS[v]); ev.push_back(e); }
    BS c1=bandn(cand,adjF[v]);
    std::vector<BS> aF=adjF; forbits(c1,[&](int w){ if(w!=v) aF[w]=bor(aF[w],smallBr(C,v,w)); });
    for(int ix:nd.brows){ BS mm=band(rows[ix].m,C.Fu); clr1(mm,v); addClique(aF,mm); }
    path.push_back({id,v}); recEv(C,nd.l,c1,aF,ev,anc,path,adjS); path.pop_back();
    BS c0=cand; clr1(c0,v); recEv(C,nd.r,c0,adjF,ev,anc,path,adjS); }
  // replay of the tree with a selection (the kernel's semantics): node rows in `nodeOn`, child rows `selC`, branch rows `selB`, C2 flags
  bool repRec(const Child& C,int id,BS cand,std::vector<BS>& adj,const std::unordered_map<int,char>& selB,const std::vector<char>& c2) const {
    const TNode& nd=C.T[id];
    for(auto& s:nd.steps) cand=xstep(C,cand,adj,s.first);
    if(nd.leaf) return pcand(cand,C.D[nd.fk])<nd.fd;
    int v=nd.v; BS c1=bandn(cand,adj[v]); std::vector<BS> adj1=adj;
    if(c2[id]) forbits(c1,[&](int w){ if(w!=v) adj1[w]=bor(adj1[w],smallBr(C,v,w)); });
    for(int ix:nd.brows) if(selB.count(ix)){ BS mm=band(rows[ix].m,C.Fu); clr1(mm,v); addClique(adj1,mm); }
    if(!repRec(C,nd.l,c1,adj1,selB,c2)) return false;
    BS c0=cand; clr1(c0,v); return repRec(C,nd.r,c0,adj,selB,c2); }
  bool replay(const Child& C,const std::vector<char>& nodeOn,const std::vector<char>& selC,const std::unordered_map<int,char>& selB,const std::vector<char>& c2) const {
    std::vector<BS> adj=C.adj0;
    for(int ix:C.nodeR) if(nodeOn[ix]) addClique(adj,band(rows[ix].m,C.Fu));
    for(size_t j=0;j<C.childR.size();j++) if(selC[j]) addClique(adj,band(rows[C.childR[j]].m,C.Fu));
    return repRec(C,C.root,C.Fu,adj,selB,c2); }
};

static bool genAgg(NodeCtx::Impl& M, const ChildIn& ci, std::vector<uint8_t>& cert, GenStats* st);
NodeCtx::NodeCtx(const Static& S, const NodeIn& in, const Params& P): I(new Impl(S,in,P)) {}
NodeCtx::~NodeCtx(){ delete I; }
int NodeCtx::dictSize() const { return I->dict.size(); }
void NodeCtx::preload(const std::vector<int>& rtIds){
  std::unordered_map<int,int> byId; for(size_t ix=0;ix<I->rows.size();ix++) byId[I->rows[ix].id]=ix;
  for(int id:rtIds){ auto it=byId.find(id); if(it==byId.end()) continue; int ix=it->second; if(!I->inDict[ix]){ I->inDict[ix]=1; I->dpos[ix]=I->dict.size(); I->dict.push_back(ix); } } }
int NodeCtx::nodeRowCount() const { int c=0; for(int ix:I->dict) c+=I->nodeRole[ix]; return c; }
void NodeCtx::aggStats(long& pairs, int& labels) const { pairs=0; labels=0; for(int x=0;x<511;x++) if(I->Bused[x]){ labels++; pairs+=I->Brows[x].size(); } }

struct Out { std::vector<uint8_t>& b; void nat(uint64_t x){ uint8_t t[8]; int n=0; while(x){ t[n++]=x&255; x>>=8; } for(int i=0;i<8;i++) b.push_back(i==0?n:0); b.insert(b.end(),t,t+n); }
  void bits(const BS& m){ uint8_t v[64]; memset(v,0,64); int mx=-1; for(int l=0;l<512;l++) if(tst(m,l)){ v[l>>3]|=1<<(l&7); mx=l; } int n=mx>=0? mx/8+1:0; for(int i=0;i<8;i++) b.push_back(i==0?n:0); b.insert(b.end(),v,v+n); } };

bool NodeCtx::gen(const ChildIn& ci, std::vector<uint8_t>& cert, GenStats* st){
  if(I->agg) return genAgg(*I,ci,cert,st);
  Impl& M=*I; auto t0=std::chrono::steady_clock::now();
  Impl::Child C; C.u=ci.u; C.Fu=ci.Fu; C.t=22-(int)M.Q.size()-1;
  // demands: 0 = degree (F_u, t); deficits at Q+u
  C.D.push_back(C.Fu); C.Dd.push_back(C.t); C.DX.push_back(0);
  BS Pp=M.Pm; set1(Pp,C.u);
  for(int X=1;X<512;X++){ int dl=M.S.NEED[X]-pcand(M.S.HITL[X],Pp); if(dl>=1){ C.D.push_back(M.S.HITL[X]); C.Dd.push_back(dl); C.DX.push_back(X); } }
  // small conflicts: node small rows and cap-2 rows through u
  C.adj0.assign(511,BS());
  forbits(C.Fu,[&](int v){ C.adj0[v]=band(bor(M.Nsmall[v],M.S.c2t[(size_t)C.u*511+v]),C.Fu); clr1(C.adj0[v],v); });
  // big rows by role
  for(int ix:M.res1){ const RowIn& R=M.rows[ix]; if(!tst(R.m,C.u) && pcand(R.m,C.Fu)>=2) C.nodeR.push_back(ix); }
  for(int ix:M.byPt[C.u]){ const RowIn& R=M.rows[ix]; if(R.res==2 && pcand(R.m,C.Fu)>=2) C.childR.push_back(ix); }
  std::vector<BS> adj=C.adj0;
  for(int ix:C.nodeR) Impl::addClique(adj,band(M.rows[ix].m,C.Fu));
  for(int ix:C.childR) Impl::addClique(adj,band(M.rows[ix].m,C.Fu));
  C.root=M.rec(C,C.Fu,adj,BS());
  auto t1=std::chrono::steady_clock::now();
  if(C.fail){ if(st){ st->ok=0; st->nodes=C.nodes; st->usGen=std::chrono::duration<double,std::micro>(t1-t0).count(); } return false; }
  // events and cover
  std::vector<BS> adjS=C.adj0; for(int ix:C.nodeR) if(M.inDict[ix]) Impl::addClique(adjS,band(M.rows[ix].m,C.Fu));
  std::vector<Impl::Ev> ev; std::vector<std::vector<std::pair<int,int>>> anc(C.T.size()); std::vector<std::pair<int,int>> path;
  M.recEv(C,C.root,C.Fu,adj,ev,anc,path,adjS);
  std::vector<std::vector<int>> evByV(511); for(size_t i=0;i<ev.size();i++) if(pc(ev[i].cov)<ev[i].need) evByV[ev[i].v].push_back(i);
  // items: 0 node row, 1 child row, 2 branch row, 3 C2 of an in-branch (tree node)
  struct It { int kind, pos, ix, tn; double cost; std::vector<int> tnodes; };
  std::vector<It> items;
  for(int ix:C.nodeR) if(!M.inDict[ix]) items.push_back({0,-1,ix,-1,M.P.cite+M.P.outerNode,{}});
  for(size_t j=0;j<C.childR.size();j++){ int ix=C.childR[j]; items.push_back({1,(int)j,ix,-1,(M.inDict[ix]?0.0:M.P.cite)+M.P.outer,{}}); }
  std::unordered_map<int,int> brItem;
  for(size_t i=0;i<C.T.size();i++) if(!C.T[i].leaf){ for(int ix:C.T[i].brows){ auto it=brItem.find(ix); int k; if(it==brItem.end()){ k=items.size(); brItem[ix]=k; items.push_back({2,-1,ix,-1,(M.inDict[ix]?0.0:M.P.cite)+M.P.outer,{}}); } else k=it->second; items[k].tnodes.push_back(i); }
    items.push_back({3,-1,-1,(int)i,M.P.dropC2?0.1:0.0,{}}); }
  auto isAnc=[&](int tn,int a)->int{ for(auto& x:anc[tn]) if(x.first==a) return x.second; return -1; };
  auto contrib=[&](const It& it,int ei)->BS{ const Impl::Ev& e=ev[ei]; BS z; bzero(z);
    if(it.kind==3){ int p=isAnc(e.tn,it.tn); if(p<0 || p==e.v) return z; return band(M.smallBr(C,p,e.v),e.X); }
    const BS& m=M.rows[it.ix].m; if(!tst(m,e.v)) return z;
    if(it.kind<2){ z=band(m,e.X); clr1(z,e.v); return z; }
    for(auto& a:anc[e.tn]) if(a.second!=e.v && tst(m,a.second)) for(int t:it.tnodes) if(t==a.first){ BS y=band(m,e.X); clr1(y,e.v); clr1(y,a.second); z=bor(z,y); break; }
    return z; };
  auto score=[&](const It& it)->long{ long sc=0;
    auto addv=[&](int v){ for(int ei:evByV[v]){ const Impl::Ev& e=ev[ei]; int rem=e.need-pc(e.cov); if(rem<=0) continue; BS z=contrib(it,ei); int g=pcandn(z,e.cov); sc+=std::min(rem,g); } };
    if(it.kind==3){ for(int v=0;v<511;v++) if(!evByV[v].empty()) addv(v); }
    else forbits(band(M.rows[it.ix].m,C.Fu),addv);
    return sc; };
  std::vector<std::pair<double,int>> heap;
  for(size_t k=0;k<items.size();k++){ long sc=score(items[k]); if(sc>0) heap.push_back({items[k].cost>0? sc/items[k].cost : 1e18,(int)k}); }
  std::make_heap(heap.begin(),heap.end());
  std::vector<char> selC(C.childR.size(),0), c2(C.T.size(),M.P.dropC2?0:1); std::vector<int> newNode; std::unordered_map<int,char> selB;
  if(!M.P.dropC2){ // C2 always on: pre-cover
    for(size_t ei=0;ei<ev.size();ei++) for(auto& a:anc[ev[ei].tn]) if(a.second!=ev[ei].v) ev[ei].cov=bor(ev[ei].cov,band(M.smallBr(C,a.second,ev[ei].v),ev[ei].X)); }
  while(!heap.empty()){
    std::pop_heap(heap.begin(),heap.end()); auto top=heap.back(); heap.pop_back();
    const It& it=items[top.second]; if(it.kind==3 && !M.P.dropC2) continue;
    long sc=score(it); if(sc<=0) continue; double pr=it.cost>0? sc/it.cost : 1e18;
    if(!heap.empty() && pr<heap.front().first){ heap.push_back({pr,top.second}); std::push_heap(heap.begin(),heap.end()); continue; }
    if(it.kind==0) newNode.push_back(it.ix); else if(it.kind==1) selC[it.pos]=1; else if(it.kind==2) selB[it.ix]=1; else c2[it.tn]=1;
    for(size_t ei=0;ei<ev.size();ei++){ if(ev[ei].need<=pc(ev[ei].cov)) continue; BS z=contrib(it,(int)ei); ev[ei].cov=bor(ev[ei].cov,z); } }
  if(M.P.prune){
    std::vector<char> nodeOn(M.rows.size(),0); for(int ix:C.nodeR) if(M.inDict[ix]) nodeOn[ix]=1; for(int ix:newNode) nodeOn[ix]=1;
    auto stepPass=[&](){ for(size_t i=0;i<C.T.size();i++){ auto& stp=C.T[i].steps;
        for(int j=(int)stp.size()-1;j>=0;j--){ auto save=stp[j]; stp.erase(stp.begin()+j); if(!M.replay(C,nodeOn,selC,selB,c2)) stp.insert(stp.begin()+j,save); } } };
    auto rowPass=[&](){
      std::vector<int> keepN; for(auto it=newNode.rbegin(); it!=newNode.rend(); ++it){ nodeOn[*it]=0; if(!M.replay(C,nodeOn,selC,selB,c2)){ nodeOn[*it]=1; keepN.push_back(*it); } }
      newNode=keepN;
      for(size_t j=0;j<C.childR.size();j++) if(selC[j]){ selC[j]=0; if(!M.replay(C,nodeOn,selC,selB,c2)) selC[j]=1; }
      std::vector<int> bk; for(auto& kv:selB) bk.push_back(kv.first); std::sort(bk.begin(),bk.end());
      for(int ix:bk){ selB.erase(ix); if(!M.replay(C,nodeOn,selC,selB,c2)) selB[ix]=1; }
      for(size_t i=0;i<C.T.size();i++) if(c2[i]){ c2[i]=0; if(!M.replay(C,nodeOn,selC,selB,c2)) c2[i]=1; } };
    if(M.replay(C,nodeOn,selC,selB,c2)){
      if(M.P.pruneSteps==2){ stepPass(); rowPass(); stepPass(); }
      else { rowPass(); if(M.P.pruneSteps) stepPass(); }
    } else if(st) st->coverFail=1;
  }
  auto t2=std::chrono::steady_clock::now();
  // dictionary update
  auto addDict=[&](int ix){ if(!M.inDict[ix]){ M.inDict[ix]=1; M.dpos[ix]=M.dict.size(); M.dict.push_back(ix); } };
  int newRows=0;
  for(int ix:newNode){ if(!M.inDict[ix]) newRows++; addDict(ix); M.nodeRole[ix]=1; }
  for(size_t j=0;j<C.childR.size();j++) if(selC[j]){ if(!M.inDict[C.childR[j]]) newRows++; addDict(C.childR[j]); }
  for(auto& kv:selB){ if(!M.inDict[kv.first]) newRows++; addDict(kv.first); }
  // certificate
  Out o{cert};
  o.nat(ci.kind); o.nat(ci.bb); o.nat(C.u); o.nat(C.t); o.bits(C.Fu);
  int ncr=0; for(char x:selC) ncr+=x; o.nat(ncr); for(size_t j=0;j<C.childR.size();j++) if(selC[j]) o.nat(M.dpos[C.childR[j]]);
  int nst=0, nbn=0, nlv=0, nbu=0, nc2=0;
  std::function<void(int)> emit=[&](int id){ const TNode& n=C.T[id];
    o.nat(n.leaf?0:1); o.nat(n.steps.size()); for(auto& s:n.steps){ o.nat(C.DX[s.first]); o.nat(s.second); } nst+=n.steps.size();
    if(n.leaf){ o.nat(C.DX[n.fk]); o.nat(n.fd); nlv++; return; }
    nbn++; o.nat(n.v-(C.u+1)); o.nat(c2[id]?1:0); nc2+=c2[id];
    std::vector<int> br; for(int ix:n.brows) if(selB.count(ix)) br.push_back(M.dpos[ix]);
    o.nat(br.size()); for(int d:br) o.nat(d); nbu+=br.size(); emit(n.l); emit(n.r); };
  emit(C.root);
  if(st){ st->ok=1; st->nodes=C.nodes; st->steps=nst; st->inBranches=nbn; st->leaves=nlv; st->childRows=ncr; st->branchUses=nbu; st->c2Uses=nc2; st->newRows=newRows;
    st->usGen=std::chrono::duration<double,std::micro>(t1-t0).count(); st->usCover=std::chrono::duration<double,std::micro>(t2-t1).count(); }
  return true;
}

void NodeCtx::nodeRecord(std::vector<uint8_t>& out) const {
  Out o{out}; const Impl& M=*I;
  o.nat(M.Q.size()); for(int q:M.Q) o.nat(q);
  o.nat(M.dict.size()); for(int ix:M.dict){ o.nat(M.rows[ix].id); o.nat(M.rows[ix].res); }
  std::vector<int> nl; for(size_t d=0;d<M.dict.size();d++) if(M.nodeRole[M.dict[d]]) nl.push_back(d);
  o.nat(nl.size()); for(int d:nl) o.nat(d);
  if(M.agg){ std::vector<int> xs; for(int x=0;x<511;x++) if(M.Bused[x]) xs.push_back(x);
    o.nat(xs.size()); for(int x:xs){ o.nat(x); o.nat(M.Brows[x].size()); for(int ix:M.Brows[x]) o.nat(M.dpos[ix]); } }
}

// ---------------------------------------------------------------------------------------------------------------------
// aggregate mode (K2.childL2 / K2.XT2): the child matrix adds B_u, an in-branch on p adds B_p; B_x = c2t[x] without row and
// column x, plus the cliques U \ {x} of the node's residual-2 rows through x chosen so far by any child of the node.
static bool genAgg(NodeCtx::Impl& M, const ChildIn& ci, std::vector<uint8_t>& cert, GenStats* st){
  typedef NodeCtx::Impl Impl;
  auto t0=std::chrono::steady_clock::now();
  Impl::Child C; C.u=ci.u; C.Fu=ci.Fu; C.t=22-(int)M.Q.size()-1;
  C.D.push_back(C.Fu); C.Dd.push_back(C.t); C.DX.push_back(0);
  BS Pp=M.Pm; set1(Pp,C.u);
  for(int X=1;X<512;X++){ int dl=M.S.NEED[X]-pcand(M.S.HITL[X],Pp); if(dl>=1){ C.D.push_back(M.S.HITL[X]); C.Dd.push_back(dl); C.DX.push_back(X); } }
  C.adj0.assign(511,BS());
  forbits(C.Fu,[&](int v){ C.adj0[v]=band(bor(M.Nsmall[v],M.S.c2t[(size_t)C.u*511+v]),C.Fu); clr1(C.adj0[v],v); });
  for(int ix:M.res1){ const RowIn& R=M.rows[ix]; if(!tst(R.m,C.u) && pcand(R.m,C.Fu)>=2) C.nodeR.push_back(ix); }
  for(int ix:M.byPt[C.u]){ const RowIn& R=M.rows[ix]; if(R.res==2 && pcand(R.m,C.Fu)>=2) C.childR.push_back(ix); }
  std::vector<BS> adj=C.adj0;
  for(int ix:C.nodeR) Impl::addClique(adj,band(M.rows[ix].m,C.Fu));
  for(int ix:C.childR) Impl::addClique(adj,band(M.rows[ix].m,C.Fu));
  C.root=M.rec(C,C.Fu,adj,BS());
  auto t1=std::chrono::steady_clock::now();
  if(C.fail){ if(st){ st->ok=0; st->nodes=C.nodes; st->usGen=std::chrono::duration<double,std::micro>(t1-t0).count(); } return false; }
  const bool hyb = M.P.agg==2;          // hybrid: child rows per child (window), aggregates only for picks
  std::vector<BS> adjS=C.adj0;
  for(int ix:C.nodeR) if(M.inDict[ix]) Impl::addClique(adjS,band(M.rows[ix].m,C.Fu));
  if(!hyb) for(int ix:M.Brows[C.u]) Impl::addClique(adjS,band(M.rows[ix].m,C.Fu));
  std::vector<Impl::Ev> ev; std::vector<std::vector<std::pair<int,int>>> anc(C.T.size()); std::vector<std::pair<int,int>> path;
  M.recEv(C,C.root,C.Fu,adj,ev,anc,path,adjS);
  for(auto& e:ev) for(auto& a:anc[e.tn]){ int p=a.second; if(p==e.v) continue;
    e.cov=bor(e.cov,band(M.smallBr(C,p,e.v),e.X));
    for(int ix:M.Brows[p]){ const BS& m=M.rows[ix].m; if(!tst(m,e.v)) continue; BS y=band(m,e.X); clr1(y,e.v); clr1(y,p); e.cov=bor(e.cov,y); } }
  std::vector<std::vector<int>> evByV(511); for(size_t i=0;i<ev.size();i++) if(pc(ev[i].cov)<ev[i].need) evByV[ev[i].v].push_back(i);
  struct It { int kind, pos, ix, p; double cost; };
  std::vector<It> items;
  for(int ix:C.nodeR) if(!M.inDict[ix]) items.push_back({0,-1,ix,-1,M.P.cite+M.P.outerNode});
  for(size_t j=0;j<C.childR.size();j++){ int ix=C.childR[j]; if(!hyb && M.inBx(C.u,ix)) continue; items.push_back({1,(int)j,ix,C.u,(M.inDict[ix]?0.0:M.P.cite)+(hyb? M.P.outer : M.P.outerAgg)}); }
  std::set<std::pair<int,int>> seenB;
  for(size_t i=0;i<C.T.size();i++) if(!C.T[i].leaf){ int p=C.T[i].v; for(int ix:C.T[i].brows){ if(M.inBx(p,ix)) continue; if(seenB.insert({p,ix}).second) items.push_back({2,-1,ix,p,(M.inDict[ix]?0.0:M.P.cite)+M.P.outerAgg}); } }
  auto contrib=[&](const It& it,int ei)->BS{ const Impl::Ev& e=ev[ei]; BS z; bzero(z); const BS& m=M.rows[it.ix].m; if(!tst(m,e.v)) return z;
    if(it.kind<2){ z=band(m,e.X); clr1(z,e.v); return z; }
    for(auto& a:anc[e.tn]) if(a.second==it.p && it.p!=e.v){ z=band(m,e.X); clr1(z,e.v); clr1(z,it.p); break; }
    return z; };
  auto score=[&](const It& it)->long{ long sc=0;
    forbits(band(M.rows[it.ix].m,C.Fu),[&](int v){ for(int ei:evByV[v]){ const Impl::Ev& e=ev[ei]; int rem=e.need-pc(e.cov); if(rem<=0) continue; BS z=contrib(it,ei); int g=pcandn(z,e.cov); sc+=std::min(rem,g); } });
    return sc; };
  std::vector<std::pair<double,int>> heap;
  for(size_t k=0;k<items.size();k++){ long sc=score(items[k]); if(sc>0) heap.push_back({items[k].cost>0? sc/items[k].cost : 1e18,(int)k}); }
  std::make_heap(heap.begin(),heap.end());
  std::vector<char> selC(C.childR.size(),0); std::vector<int> newNode; std::set<std::pair<int,int>> selB;
  while(!heap.empty()){
    std::pop_heap(heap.begin(),heap.end()); auto top=heap.back(); heap.pop_back();
    const It& it=items[top.second]; long sc=score(it); if(sc<=0) continue; double pr=it.cost>0? sc/it.cost : 1e18;
    if(!heap.empty() && pr<heap.front().first){ heap.push_back({pr,top.second}); std::push_heap(heap.begin(),heap.end()); continue; }
    if(it.kind==0) newNode.push_back(it.ix); else if(it.kind==1) selC[it.pos]=1; else selB.insert({it.p,it.ix});
    for(size_t ei=0;ei<ev.size();ei++){ if(ev[ei].need<=pc(ev[ei].cov)) continue; BS z=contrib(it,(int)ei); ev[ei].cov=bor(ev[ei].cov,z); } }
  std::vector<char> nodeOn(M.rows.size(),0); for(int ix:C.nodeR) if(M.inDict[ix]) nodeOn[ix]=1; for(int ix:newNode) nodeOn[ix]=1;
  static bool SPAN=getenv("XP_SPAN")!=nullptr; bool spanOn=false;
  std::function<bool(int,BS,std::vector<BS>&)> rep=[&](int id,BS cand,std::vector<BS>& a)->bool{
    const TNode& nd=C.T[id];
    for(auto& s_:nd.steps){ if(spanOn){ int lo=-1,hi=-1; for(int l=0;l<511;l++) if(tst(cand,l)){ if(lo<0) lo=l; hi=l; } if(lo>=0) fprintf(stderr,"SPAN %d %d %d %d\n",510-C.u,hi-lo+1,pc(cand),ci.bb); } cand=M.xstep(C,cand,a,s_.first); }
    if(nd.leaf) return pcand(cand,C.D[nd.fk])<nd.fd;
    int v=nd.v; BS c1=bandn(cand,a[v]); std::vector<BS> a1=a;
    forbits(c1,[&](int w){ if(w!=v) a1[w]=bor(a1[w],M.smallBr(C,v,w)); });
    auto addR=[&](int ix){ BS mm=band(M.rows[ix].m,C.Fu); clr1(mm,v); Impl::addClique(a1,mm); };
    for(int ix:M.Brows[v]) addR(ix);
    for(auto it=selB.lower_bound({v,-1}); it!=selB.end() && it->first==v; ++it) if(!M.inBx(v,it->second)) addR(it->second);
    if(!rep(nd.l,c1,a1)) return false;
    BS c0=cand; clr1(c0,v); return rep(nd.r,c0,a); };
  auto replay=[&]()->bool{ std::vector<BS> a=C.adj0;
    for(int ix:C.nodeR) if(nodeOn[ix]) Impl::addClique(a,band(M.rows[ix].m,C.Fu));
    if(!hyb) for(int ix:M.Brows[C.u]) Impl::addClique(a,band(M.rows[ix].m,C.Fu));
    for(size_t j=0;j<C.childR.size();j++) if(selC[j] && (hyb || !M.inBx(C.u,C.childR[j]))) Impl::addClique(a,band(M.rows[C.childR[j]].m,C.Fu));
    return rep(C.root,C.Fu,a); };
  bool ok=replay();
  if(!ok && st) st->coverFail=1;
  if(ok && M.P.prune){
    std::vector<int> keepN; for(auto it=newNode.rbegin(); it!=newNode.rend(); ++it){ nodeOn[*it]=0; if(!replay()){ nodeOn[*it]=1; keepN.push_back(*it); } }
    newNode=keepN;
    for(size_t j=0;j<C.childR.size();j++) if(selC[j]){ selC[j]=0; if(!replay()) selC[j]=1; }
    std::vector<std::pair<int,int>> bk(selB.begin(),selB.end());
    for(auto& b:bk){ selB.erase(b); if(!replay()) selB.insert(b); }
    if(M.P.pruneSteps) for(size_t i=0;i<C.T.size();i++){ auto& stp=C.T[i].steps;
      for(int j=(int)stp.size()-1;j>=0;j--){ auto save=stp[j]; stp.erase(stp.begin()+j); if(!replay()) stp.insert(stp.begin()+j,save); } }
  }
  if(SPAN && ok){ spanOn=true; replay(); spanOn=false; }
  auto t2=std::chrono::steady_clock::now();
  auto addDict=[&](int ix){ if(!M.inDict[ix]){ M.inDict[ix]=1; M.dpos[ix]=M.dict.size(); M.dict.push_back(ix); } };
  int newRows=0, newB=0;
  for(int ix:newNode){ if(!M.inDict[ix]) newRows++; addDict(ix); M.nodeRole[ix]=1; }
  if(!hyb) M.Bused[C.u]=1;
  int ncr=0;
  for(size_t j=0;j<C.childR.size();j++) if(selC[j]){ int ix=C.childR[j]; if(!M.inDict[ix]) newRows++; addDict(ix); ncr++; if(!hyb && !M.inBx(C.u,ix)){ newB++; M.addB(C.u,ix); } }
  for(auto& b:selB){ if(!M.inDict[b.second]) newRows++; addDict(b.second); if(!M.inBx(b.first,b.second)){ newB++; M.addB(b.first,b.second); } }
  for(size_t i=0;i<C.T.size();i++) if(!C.T[i].leaf) M.Bused[C.T[i].v]=1;
  Out o{cert};
  o.nat(ci.kind); o.nat(ci.bb); o.nat(C.u); o.nat(C.t); o.bits(C.Fu);
  if(hyb){ o.nat(ncr); for(size_t j=0;j<C.childR.size();j++) if(selC[j]) o.nat(M.dpos[C.childR[j]]); }
  int nst=0, nbn=0, nlv=0;
  std::function<void(int)> emit=[&](int id){ const TNode& n=C.T[id];
    o.nat(n.leaf?0:1); o.nat(n.steps.size()); for(auto& s_:n.steps){ o.nat(C.DX[s_.first]); o.nat(s_.second); } nst+=n.steps.size();
    if(n.leaf){ o.nat(C.DX[n.fk]); o.nat(n.fd); nlv++; return; }
    nbn++; o.nat(n.v-(C.u+1)); emit(n.l); emit(n.r); };
  emit(C.root);
  if(st){ st->ok=1; st->nodes=C.nodes; st->steps=nst; st->inBranches=nbn; st->leaves=nlv; st->childRows=ncr; st->branchUses=newB; st->c2Uses=nbn; st->newRows=newRows;
    st->usGen=std::chrono::duration<double,std::micro>(t1-t0).count(); st->usCover=std::chrono::duration<double,std::micro>(t2-t1).count(); }
  return ok;
}

}
