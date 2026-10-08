// rootcut.h: tsolve's root test inside prof7 (prof7L77 --rootcut).  For first factors a_1..a_r and a functional X on A let
// u(X) = #{t : X(a_t) = 1}; T(X) is the 9x9 matrix of (b, c) -> tr(X b c), of rank 3 rank(X) (= hypNeed[X]).  In any decomposition
// T = sum_t a_t (x) b_t (x) c_t (all factors nonzero), T(X) = sum_{t : X(a_t)=1} b_t (x) c_t, so u(X) >= rank T(X), and:
//  * X tight (u(X) = rank T(X)): the b_t of its terms form a basis of col T(X) and the c_t a basis of row T(X) with
//    T(X) = sum b_t c_t^T, so for each such term b_t in col T(X), c_t in row T(X) (c_t . k = 0 for k in rker T(X)) and
//    c_t . x = 1 for any x with T(X) x = b_t (well defined since c_t is orthogonal to rker T(X));
//  * X with u(X) = rank T(X) + 1: rank(T(X) - b_t c_t^T) <= u(X) - 1 = rank T(X) forces b_t in col T(X) or c_t in row T(X).
// A term t for which no nonzero (b, c) satisfies all conditions of the X through a_t proves that no decomposition exists: the
// leaf is dropped.  This is exactly the zero-candidate test of tens/tsolve.cc at its root (no term assigned, Res(X) = T(X)), and
// requires c != 0 as well.  T(X) is fixed, so its column/row bases, kernels and preimage combinations are computed once.
#pragma once
#include <bits/stdc++.h>
namespace rootcut {
typedef uint16_t u16;
static bool ON=false; static std::atomic<long long> gCalls{0}, gCut{0};
struct Info { int rk; u16 cb[9], cc[9]; int ncb; u16 rker[9]; int nrk; u16 lker[9]; int nlk; };
static Info INF[512]; static int NEED[512]; static std::vector<int> XS[512];
struct Sys { u16 m[9]; uint8_t r[9]; bool bad; void clear(){ memset(m,0,sizeof m); memset(r,0,sizeof r); bad=false; }
  void add(u16 mask,int rhs){ if(bad) return; while(mask){ int h=31-__builtin_clz(mask); if(!m[h]){ m[h]=mask; r[h]=(uint8_t)rhs; return; } mask^=m[h]; rhs^=r[h]; } if(rhs) bad=true; }
  int rank() const { int k=0; for(int h=0;h<9;h++) if(m[h]) k++; return k; } };
static inline bool inCol(const Info& I,int b,int& x){ u16 a=(u16)b; x=0; for(int i=0;i<I.ncb;i++){ int h=31-__builtin_clz(I.cb[i]); if((a>>h)&1){ a^=I.cb[i]; x^=I.cc[i]; } } return a==0; }
static void init(){
  static int Tt[9][9][9]; memset(Tt,0,sizeof Tt); for(int i=0;i<3;i++) for(int j=0;j<3;j++) for(int k=0;k<3;k++) Tt[3*i+j][3*j+k][3*k+i]=1;
  for(int X=1;X<512;X++){ u16 Res[9], ResT[9];
    for(int y=0;y<9;y++){ int row=0; for(int z=0;z<9;z++){ int v=0; for(int x=0;x<9;x++) if((X>>x)&1) v^=Tt[x][y][z]; row|=v<<z; } Res[y]=(u16)row; }
    for(int z=0;z<9;z++){ int row=0; for(int y=0;y<9;y++) if((Res[y]>>z)&1) row|=1<<y; ResT[z]=(u16)row; }
    Info& I=INF[X]; u16 bv[9]={0}, bc[9]={0}; int rk=0; I.ncb=0; I.nrk=0;   // as tsolve computeInfo
    for(int z=0;z<9;z++){ u16 a=ResT[z], k=(u16)(1<<z); while(a){ int h=31-__builtin_clz(a); if(!bv[h]){ bv[h]=a; bc[h]=k; rk++; break; } a^=bv[h]; k^=bc[h]; } if(!a) I.rker[I.nrk++]=k; }
    I.rk=rk; for(int h=8;h>=0;h--) if(bv[h]){ I.cb[I.ncb]=bv[h]; I.cc[I.ncb]=bc[h]; I.ncb++; }
    u16 lv[9]={0}, lc[9]={0}; I.nlk=0; for(int y=0;y<9;y++){ u16 a=Res[y], k=(u16)(1<<y); while(a){ int h=31-__builtin_clz(a); if(!lv[h]){ lv[h]=a; lc[h]=k; break; } a^=lv[h]; k^=lc[h]; } if(!a) I.lker[I.nlk++]=k; }
    NEED[X]=rk; }
  for(int a=1;a<512;a++){ XS[a].clear(); for(int X=1;X<512;X++) if(__builtin_parity(a&X)) XS[a].push_back(X); } }
// true iff the term with first factor a has a nonzero (b, c) meeting the conditions of every tight / slack-1 X through a
static bool termOK(int a,const int* hits){
  int tight[256], s1[256], nt=0, ns=0;
  for(int X:XS[a]){ int s=hits[X]-NEED[X]; if(s==0) tight[nt++]=X; else if(s==1) s1[ns++]=X; }
  if(nt==0 && ns==0) return true;
  Sys bs; bs.clear(); Sys base; base.clear();
  for(int i=0;i<nt;i++){ const Info& I=INF[tight[i]]; for(int k=0;k<I.nlk;k++) bs.add(I.lker[k],0); for(int k=0;k<I.nrk;k++) base.add(I.rker[k],0); }
  int fr[9], nf=0; for(int h=0;h<9;h++) if(!bs.m[h]) fr[nf++]=h;
  for(int sidx=1;sidx<(1<<nf);sidx++){ int b=0; for(int i=0;i<nf;i++) if((sidx>>i)&1) b|=1<<fr[i];
    for(int h=0;h<9;h++) if(bs.m[h]){ int val=bs.r[h]^__builtin_parity(bs.m[h]&b&((1<<h)-1)); if(val) b|=1<<h; }
    if(!b) continue;
    Sys s=base; bool ok=true;
    for(int i=0;i<nt;i++){ int x; if(!inCol(INF[tight[i]],b,x)){ ok=false; break; } s.add((u16)x,1); if(s.bad){ ok=false; break; } }
    if(!ok) continue;
    for(int i=0;i<ns&&!s.bad;i++){ int x; const Info& I=INF[s1[i]]; if(!inCol(I,b,x)) for(int k=0;k<I.nrk;k++) s.add(I.rker[k],0); }
    if(s.bad) continue;
    if(nt>0 || s.rank()<9) return true; }
  return false; }
static bool leafOK(const int* vals,int n,const int* hits){ gCalls++; for(int t=0;t<n;t++) if(!termOK(vals[t],hits)){ gCut++; return false; } return true; }
}
