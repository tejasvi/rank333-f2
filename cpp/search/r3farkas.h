// r3farkas.h (prof7R3): Farkas certificates over 0/1 points for the X kills of the child screen (L2, r22/lean/DESIGN.md 24; the
// method of r22/lean/mis/inst.py + cov.py, in C++ on the search's own node data).
// Instance: points 0..n-1 (the child's free set f), x in {0,1}^n with
//   sum_{K} x <= rhs for the listed clique / row constraints (base: always in the LP; lazy: added when violated),
//   sum_{H} x >= rhs for the deficits (base), sum x = t (slot).
// fkSolve: cutting planes on the LP relaxation (violated lazy rows, then cliques of the conflict graph adj by greedy growth from the
// heaviest points, then an exact maximum-weight clique on the LP support), until the LP is infeasible; then the L1-minimal
// multipliers of the final constraint set (the Farkas LP of inst.farkas), scaled to integers and verified exactly:
//   K + sum_v max(0, c_v) < 0,  K = sum_<= m rhs - sum_>= m rhs - w t,  c_v = w - sum_{<= through v} m + sum_{>= through v} m.
// Every point list is sorted and duplicate-free; added cliques are maximal cliques of adj.
// check6 mode (noCliques, pCost 1, maxSup 31; r22/lean/DESIGN.md 27, kill2's K2.check6): no clique cuts (rows, deficits and the slot
// only), the Farkas LP minimises the number of check6 units (multipliers, |w|, and the per-point terms, each one singleton supply unit),
// and an integer certificate is accepted only if every point's supply count (rows, slot as supply, singletons) is <= maxSup (six planes:
// the counter starts at 32 and must not carry out).
#pragma once
#include <vector>
#include <array>
#include <cmath>
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <x86intrin.h>
#include <functional>
namespace fkx {
typedef int HInt;
extern "C" {
void* Highs_create(void); void Highs_destroy(void* h); HInt Highs_run(void* h); HInt Highs_clearModel(void* h);
HInt Highs_setBoolOptionValue(void* h, const char* o, const HInt v);
HInt Highs_setIntOptionValue(void* h, const char* o, const HInt v);
HInt Highs_setDoubleOptionValue(void* h, const char* o, const double v);
HInt Highs_setStringOptionValue(void* h, const char* o, const char* v);
HInt Highs_addVars(void* h, const HInt n, const double* lo, const double* up);
HInt Highs_addRows(void* h, const HInt n, const double* lo, const double* up, const HInt nnz, const HInt* starts, const HInt* idx, const double* val);
HInt Highs_changeColsCostByRange(void* h, const HInt from, const HInt to, const double* cost);
HInt Highs_getModelStatus(const void* h);
HInt Highs_getSolution(const void* h, double* cv, double* cd, double* rv, double* rd);
double Highs_getInfinity(const void* h);
}
static const int ST_OPT = 7, ST_INF = 8;
typedef std::array<uint64_t,8> B512;
struct Con { std::vector<int> pts; int rhs; int sense; int type; int ref; };   // sense +1: <=, -1: >=; type/ref: caller's tags
struct Inst { int n=0, t=0; std::vector<B512> adj; std::vector<Con> base, lazy; std::function<int(const std::vector<double>&,std::vector<Con>&)> sep; };   // sep: the caller's separator of violated lazy rows (may be empty)
struct Cert { std::vector<Con> con; std::vector<long long> mult; long long w=0; int rounds=0, lpRows=0, D=1; long long value=0, units=0; int maxsup=0; };   // units, maxsup: check6 units and the largest per-point supply count
struct Stats { long long calls=0, cert=0, feas=0, err=0, rounds=0, lps=0, cliques=0, lazyAdded=0, mwcCalls=0, mwcCut=0, over=0, units=0, sing=0; unsigned long long cyc[6]={0,0,0,0,0,0}; };   // cyc: first LP, later LPs, Farkas LP, integerization, lazy separation, clique separation
struct Gen {
  void* h=nullptr; double inf=1e30; Stats st; int maxRounds=40, maxCliquesPerRound=60, maxLazyPerRound=1<<30; bool lazyBase=false;   // lazyBase: base rows enter only when violated
  bool noCliques=false; double pCost=1e-4; int maxSup=0;   // check6 mode: no clique cuts, per-point terms cost one unit each, supply count bound (0: none)
  ~Gen(){ if(h) Highs_destroy(h); }
  void init(){ if(h) return; h=Highs_create(); inf=Highs_getInfinity(h); Highs_setBoolOptionValue(h,"output_flag",0); Highs_setStringOptionValue(h,"presolve","off");
    Highs_setIntOptionValue(h,"threads",1); Highs_setStringOptionValue(h,"solver","simplex"); Highs_setIntOptionValue(h,"simplex_strategy",1); }
  void addRow(const Con& c){ std::vector<HInt> ix(c.pts.begin(),c.pts.end()); std::vector<double> va(ix.size(),1.0); HInt st0=0;
    double lo=c.sense>0?-inf:(double)c.rhs, up=c.sense>0?(double)c.rhs:inf; Highs_addRows(h,1,&lo,&up,(HInt)ix.size(),&st0,ix.data(),va.data()); }
  static bool bit(const B512& b,int i){ return (b[i>>6]>>(i&63))&1; }
  // greedy clique separation (inst.sep_cliques): grow from each support point, heaviest first; maximal cliques with weight > 1
  void sepGreedy(const Inst& I,const std::vector<double>& x,std::vector<std::vector<int>>& out){
    std::vector<int> ord; for(int i=0;i<I.n;i++) if(x[i]>1e-7) ord.push_back(i); std::sort(ord.begin(),ord.end(),[&](int a,int b){ return x[a]>x[b] || (x[a]==x[b] && a<b); });
    for(int s:ord){ std::vector<int> K{s}; B512 cand=I.adj[s]; double w=x[s];
      while(true){ int best=-1; double bx=1e-7; for(int k=0;k<8;k++){ uint64_t m=cand[k]; while(m){ int b=k*64+__builtin_ctzll(m); m&=m-1; if(b<I.n && x[b]>bx){ bx=x[b]; best=b; } } }
        if(best<0){ for(int k=0;k<8 && best<0;k++) if(cand[k]){ int b=k*64+__builtin_ctzll(cand[k]); if(b<I.n) best=b; } }
        if(best<0) break; K.push_back(best); w+=x[best]; for(int k=0;k<8;k++) cand[k]&=I.adj[best][k]; }
      if(w>1+1e-6){ std::sort(K.begin(),K.end()); if(std::find(out.begin(),out.end(),K)==out.end()) out.push_back(K); if((int)out.size()>=maxCliquesPerRound) return; } } }
  // exact maximum-weight clique on the support (simple branch and bound), extended greedily to a maximal clique of adj
  std::vector<int> bestK; double bestW=0;
  long long mwcN=0, mwcLim=20000;
  void mwcRec(const Inst& I,const std::vector<double>& x,std::vector<int>& K,double w,std::vector<int> P){
    if(++mwcN>mwcLim) return; double ub=w; for(int v:P) ub+=x[v]; if(ub<=bestW+1e-9) return;
    if(P.empty()){ if(w>bestW){ bestW=w; bestK=K; } return; }
    while(!P.empty()){ double u2=w; for(int v:P) u2+=x[v]; if(u2<=bestW+1e-9) return;
      int v=P.back(); P.pop_back(); std::vector<int> Q; for(int q:P) if(bit(I.adj[v],q)) Q.push_back(q);
      K.push_back(v); mwcRec(I,x,K,w+x[v],Q); K.pop_back(); } }
  bool sepExact(const Inst& I,const std::vector<double>& x,std::vector<std::vector<int>>& out){
    std::vector<int> P; for(int i=0;i<I.n;i++) if(x[i]>1e-7) P.push_back(i); if(P.size()>90) return false;
    std::sort(P.begin(),P.end(),[&](int a,int b){ return x[a]<x[b]; });   // heaviest last: tried first
    bestK.clear(); bestW=1+1e-6; std::vector<int> K; mwcN=0; st.mwcCalls++; mwcRec(I,x,K,0.0,P); if(mwcN>mwcLim) st.mwcCut++;
    if(bestK.empty()) return false;
    B512 cand; for(int k=0;k<8;k++) cand[k]=~0ULL; for(int v:bestK) for(int k=0;k<8;k++) cand[k]&=I.adj[v][k];
    std::vector<int> Kx=bestK; for(int k=0;k<8;k++){ uint64_t m=cand[k]; while(m){ int b=k*64+__builtin_ctzll(m); m&=m-1; if(b>=I.n) break; bool ok=true; for(int q:Kx) if(!bit(I.adj[q],b)){ ok=false; break; } if(ok) Kx.push_back(b); } }
    std::sort(Kx.begin(),Kx.end()); out.push_back(Kx); return true; }
  // exact check of integer multipliers
  static bool verify(const Inst& I,const std::vector<Con>& C,const std::vector<long long>& m,long long w,long long& value){
    std::vector<long long> c(I.n,w); long long K=-w*(long long)I.t;
    for(size_t i=0;i<C.size();i++){ if(m[i]==0) continue; if(m[i]<0) return false; K+=(long long)C[i].sense*m[i]*C[i].rhs; for(int v:C[i].pts) c[v]-=(long long)C[i].sense*m[i]; }
    for(int v=0;v<I.n;v++) if(c[v]>0) K+=c[v]; value=K; return K<0; }
  // check6 form of integer multipliers: supply units (<= rows, the slot if w < 0, one singleton per unit of a positive c_v), demand units
  // (>= rows, the slot if w > 0); valid iff sum of supply rhs < sum of demand rhs (the same condition as verify); units, largest supply count
  static bool verify6(const Inst& I,const std::vector<Con>& C,const std::vector<long long>& m,long long w,long long& units,int& maxsup,long long& sing){
    std::vector<long long> sup(I.n,0), dem(I.n,0); long long R=0, Dm=0; units=0;
    for(size_t i=0;i<C.size();i++){ if(m[i]==0) continue; if(m[i]<0) return false; units+=m[i];
      if(C[i].sense>0){ R+=m[i]*C[i].rhs; for(int v:C[i].pts) sup[v]+=m[i]; } else { Dm+=m[i]*C[i].rhs; for(int v:C[i].pts) dem[v]+=m[i]; } }
    if(w>0){ Dm+=w*(long long)I.t; for(int v=0;v<I.n;v++) dem[v]+=w; units+=w; } else if(w<0){ R+=(-w)*(long long)I.t; for(int v=0;v<I.n;v++) sup[v]+=-w; units+=-w; }
    long long ms=0; sing=0; for(int v=0;v<I.n;v++){ if(dem[v]>sup[v]){ const long long s=dem[v]-sup[v]; sup[v]+=s; R+=s; sing+=s; } ms=std::max(ms,sup[v]); }
    units+=sing; maxsup=(int)std::min<long long>(ms,1<<30); return R<Dm; }
  // solve; 1 = certificate in out, 0 = the LP relaxation stays feasible, -1 = solver trouble
  int solve(const Inst& I,Cert& out){
    init(); st.calls++; std::vector<Con> C; std::vector<char> lazyIn(I.lazy.size(),0), baseIn(I.base.size(),0);
    if(!lazyBase){ C=I.base; std::fill(baseIn.begin(),baseIn.end(),1); }
    if(I.n<I.t){ out=Cert(); out.w=1; out.value=I.n-I.t; out.units=1+I.n; out.maxsup=1; st.cert++; st.units+=out.units; st.sing+=I.n; return 1; }   // count: w = 1 on the slot: K = -t, every c_v = 1
    Highs_clearModel(h); { std::vector<double> lo(I.n,0.0), up(I.n,1.0); Highs_addVars(h,I.n,lo.data(),up.data()); }
    for(const Con& c:C) addRow(c);
    { Con s; s.pts.resize(I.n); for(int i=0;i<I.n;i++) s.pts[i]=i; s.rhs=I.t; s.sense=0; std::vector<HInt> ix(s.pts.begin(),s.pts.end()); std::vector<double> va(I.n,1.0); HInt st0=0; double lo=I.t, up=I.t; Highs_addRows(h,1,&lo,&up,I.n,&st0,ix.data(),va.data()); }
    std::vector<double> x(I.n), cd(I.n), rv, rd; int r=0; unsigned long long tc=__rdtsc();
    for(;;r++){ tc=__rdtsc(); Highs_run(h); st.lps++; const int ms=Highs_getModelStatus(h); { const unsigned long long t2=__rdtsc(); st.cyc[r==0?0:1]+=t2-tc; tc=t2; }
      if(ms==ST_INF) break;
      if(ms!=ST_OPT){ st.err++; return -1; }
      rv.resize(C.size()+1); rd.resize(C.size()+1); Highs_getSolution(h,x.data(),cd.data(),rv.data(),rd.data());
      if(r>=maxRounds){ st.feas++; st.rounds+=r; return 0; }
      int added=0;
      { std::vector<std::pair<double,int>> vb; for(size_t j=0;j<I.base.size();j++){ if(baseIn[j]) continue; double s=0; for(int v:I.base[j].pts) s+=x[v]; const double viol=I.base[j].sense>0?s-I.base[j].rhs:I.base[j].rhs-s; if(viol>1e-6) vb.push_back({-viol,(int)j}); }
        std::sort(vb.begin(),vb.end()); for(size_t q=0;q<vb.size() && (int)q<maxLazyPerRound;q++){ const int j=vb[q].second; baseIn[j]=1; C.push_back(I.base[j]); addRow(I.base[j]); added++; } }
      for(size_t j=0;j<I.lazy.size();j++){ if(lazyIn[j]) continue; double s=0; for(int v:I.lazy[j].pts) s+=x[v]; if(s>I.lazy[j].rhs+1e-6){ lazyIn[j]=1; C.push_back(I.lazy[j]); addRow(I.lazy[j]); added++; st.lazyAdded++; } }
      if(I.sep){ std::vector<Con> V; I.sep(x,V); for(Con& c:V){ C.push_back(c); addRow(c); added++; st.lazyAdded++; } }
      { const unsigned long long t2=__rdtsc(); st.cyc[4]+=t2-tc; tc=t2; }
      std::vector<std::vector<int>> K; if(!noCliques){ sepGreedy(I,x,K); if(K.empty()) sepExact(I,x,K); }
      for(auto& k:K){ Con c; c.pts=k; c.rhs=1; c.sense=1; c.type=0; c.ref=-1; bool dup=false; for(const Con& e:C) if(e.sense==1 && e.rhs==1 && e.pts==k){ dup=true; break; } if(dup) continue; C.push_back(c); addRow(c); added++; st.cliques++; }
      st.cyc[5]+=__rdtsc()-tc;
      if(added==0){ st.feas++; st.rounds+=r; return 0; } }
    st.rounds+=r; tc=__rdtsc();
    // Farkas LP: lambda_i >= 0 (one per constraint), w+ w- >= 0, p_v >= 0; point rows: sum_i sg_i lambda_i [v in S_i] - w+ + w- + p_v >= 0;
    // value row: sum_i sg_i rhs_i lambda_i - t w+ + t w- + sum p <= -1; minimise sum lambda + w+ + w- + 1e-4 sum p
    const int K=(int)C.size(), n=I.n; Highs_clearModel(h);
    { std::vector<double> lo(K+2+n,0.0), up(K+2+n,inf), cost(K+2+n,1.0); for(int i=0;i<n;i++) cost[K+2+i]=pCost; Highs_addVars(h,K+2+n,lo.data(),up.data()); Highs_changeColsCostByRange(h,0,K+2+n-1,cost.data()); }
    { std::vector<std::vector<std::pair<int,double>>> rows(n+1);
      for(int i=0;i<K;i++){ const double sg=C[i].sense; for(int v:C[i].pts) rows[v].push_back({i,sg}); rows[n].push_back({i,sg*C[i].rhs}); }
      for(int v=0;v<n;v++){ rows[v].push_back({K,-1.0}); rows[v].push_back({K+1,1.0}); rows[v].push_back({K+2+v,1.0}); }
      rows[n].push_back({K,-(double)I.t}); rows[n].push_back({K+1,(double)I.t}); for(int v=0;v<n;v++) rows[n].push_back({K+2+v,1.0});
      std::vector<double> lo(n+1), up(n+1); std::vector<HInt> stt, ix; std::vector<double> va;
      for(int v=0;v<=n;v++){ stt.push_back((HInt)ix.size()); for(auto& p:rows[v]){ ix.push_back(p.first); va.push_back(p.second); } lo[v]=v<n?0.0:-inf; up[v]=v<n?inf:-1.0; }
      Highs_addRows(h,n+1,lo.data(),up.data(),(HInt)ix.size(),stt.data(),ix.data(),va.data()); }
    Highs_run(h); st.lps++; if(Highs_getModelStatus(h)!=ST_OPT){ st.err++; return -1; }
    std::vector<double> z(K+2+n), zd(K+2+n), zr(n+1), zrd(n+1); Highs_getSolution(h,z.data(),zd.data(),zr.data(),zrd.data());
    std::vector<double> lam(K); for(int i=0;i<K;i++) lam[i]=z[i]<1e-9?0.0:z[i]; const double w=z[K]-z[K+1]; { const unsigned long long t2=__rdtsc(); st.cyc[2]+=t2-tc; tc=t2; }
    struct T_{ unsigned long long& a; unsigned long long t; ~T_(){ a+=__rdtsc()-t; } } tq{st.cyc[3],tc};
    static const int Ds[]={1,2,3,4,5,6,8,10,12,16,20,24,30,32,48,60,64,120,128,240,256,512,1024};
    std::vector<long long> m(K); long long value=0;
    for(int D:Ds){ for(int i=0;i<K;i++) m[i]=llround(D*lam[i]); const long long wi=llround(D*w);
      if(verify(I,C,m,wi,value)){ long long un=0, sg=0; int mx=0; const bool ok6=verify6(I,C,m,wi,un,mx,sg);
        if(!ok6){ st.err++; return -1; }   // cannot happen (same condition)
        if(maxSup>0 && mx>maxSup){ st.over++; continue; }
        out=Cert(); for(int i=0;i<K;i++) if(m[i]){ out.con.push_back(C[i]); out.mult.push_back(m[i]); } out.w=wi; out.rounds=r; out.lpRows=K; out.D=D; out.value=value; out.units=un; out.maxsup=mx;
        st.cert++; st.units+=un; st.sing+=sg; return 1; } }
    st.err++; return -1; }
};
}
