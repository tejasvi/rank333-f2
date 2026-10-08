// wcut2.h = wcut.h + the |W| = 10 condition (prof7L76 --wcut --wk10): if exactly 10 first factors lie in W, their W0 images (with at
// most one term vanishing) decompose T mod_C D for a rank-9 6-dim D >= C' (LEMMA.md, part (c); 11 GL3 orbits, wcut_k10.h).  When
// a W reaches 10 points whose set fails (c) and has no extension a with I+a in the dictionary of (b), add() fails; a leaf with a W at
// 10 failing (c) is rejected.
// wcut.h: the W-type tight-quotient cut for r = 22 (prof7L75 --wcut).  The 14 W-type subspaces of A are W_u = {a : u^T a = 0}
// (row type) and W_v = {a : a v = 0} (column type), u, v in F2^3 \ 0; T mod W = <1,3,3>, rank 9 = the rank of its B-flattening
// (row type; C-flattening for the column type).  Lemma (r22/wtight/LEMMA.md): in a decomposition of T with 22 terms, at most 11
// first factors lie in W, and if exactly 11 do, those 11 (mapped to W0 = {row 2 = 0} by an automorphism of T, 2x3 coordinates
// x = 3i+j, i < 2) are the first factors of a decomposition of T' = <2,3,2> = sum_{i,k<2, j<3} e_{3i+j} (x) e_{3j+k} (x) e_{3k+i}
// with 11 nonzero terms.  dictOK decides the second condition with an embedded copy of tens/tsolve4 (no symmetry, target T'),
// memoized under GL2 x GL3 (P a Q on 2x3 matrices, which preserves the set of such first-factor multisets).
#pragma once
#include <bits/stdc++.h>
#include "wcut_k10.h"
namespace wcut {
typedef unsigned __int128 u128;
static bool ON=false, K10=false;
static uint16_t WM[512];          // bit w set: vector v lies in W-type subspace w (w = 0..6 rows u = 1..7, 7..13 columns v = 1..7)
static uint8_t W0C[14][512];      // coordinates in W0 (bits 0..5) of v in W_w
static uint8_t G6[1008][64];      // GL2 x GL3 acting on W0 coordinates
static std::atomic<long long> gCap{0}, gCalls{0}, gCut{0}, gSolve{0}, gSolveSat{0}, gTL{0};
static std::atomic<long long> gK10calls{0}, gK10tl{0}, gK10miss{0}, gK10false{0}, gK10ext{0}, gK10cut{0}, gK10leaf{0}, gK10solves{0};
static inline int bitm(int a,int i,int j){ return (a>>(3*i+j))&1; }
static int matmul(const int P[3][3],int a){ int r=0; for(int i=0;i<3;i++) for(int j=0;j<3;j++){ int s=0; for(int k=0;k<3;k++) s^=P[i][k]&bitm(a,k,j); r|=s<<(3*i+j); } return r; }
static int transp(int a){ int r=0; for(int i=0;i<3;i++) for(int j=0;j<3;j++) r|=bitm(a,i,j)<<(3*j+i); return r; }
static int rank3rows(int r0,int r1,int r2){ int b[3]={0,0,0}, n=0; int v[3]={r0,r1,r2}; for(int t=0;t<3;t++){ int x=v[t]; for(int s=0;s<n;s++) if((x^b[s])<x) x^=b[s]; if(x){ b[n++]=x; std::sort(b,b+n,std::greater<int>()); } } return n; }
// ---- embedded tsolve4 for the fixed target T' (functionals X < 64, R = 11, no GL3 symmetry) ----
struct Target { uint16_t TX[64][9], TXT[64][9]; };
static Target TG11, TGK[K10N];
static void buildTarget(Target& t,const int (*tr)[3],int n){ int Tt[9][9][9]; memset(Tt,0,sizeof Tt); for(int i=0;i<n;i++) Tt[tr[i][0]][tr[i][1]][tr[i][2]]^=1;
  for(int X=1;X<64;X++){ for(int y=0;y<9;y++){ int row=0; for(int z=0;z<9;z++){ int v=0; for(int x=0;x<6;x++) if((X>>x)&1) v^=Tt[x][y][z]; row|=v<<z; } t.TX[X][y]=row; }
    for(int z=0;z<9;z++){ int row=0; for(int y=0;y<9;y++) if((t.TX[X][y]>>z)&1) row|=1<<y; t.TXT[X][z]=row; } } }
static inline int rank9(const uint16_t* m){ uint16_t bas[9]={0}; int rk=0; for(int i=0;i<9;i++){ uint16_t v=m[i]; while(v){ int h=31-__builtin_clz(v); if(!bas[h]){ bas[h]=v; rk++; break; } v^=bas[h]; } } return rk; }
struct Info { int rk; int u; uint16_t cb[9]; uint16_t cc[9]; int ncb; uint16_t rker[9]; int nrk; uint16_t lker[9]; int nlk; };
struct Sys { uint16_t m[9]; uint8_t r[9]; bool bad; void clear(){ memset(m,0,sizeof m); memset(r,0,sizeof r); bad=false; }
  void add(uint16_t mask,int rhs){ if(bad) return; while(mask){ int h=31-__builtin_clz(mask); if(!m[h]){ m[h]=mask; r[h]=(uint8_t)rhs; return; } mask^=m[h]; rhs^=r[h]; } if(rhs) bad=true; }
  int rank() const { int k=0; for(int h=0;h<9;h++) if(m[h]) k++; return k; }
  void solutions(std::vector<int>& out) const { out.clear(); if(bad) return; int fr[9], nf=0; for(int h=0;h<9;h++) if(!m[h]) fr[nf++]=h;
    for(int s=0;s<(1<<nf);s++){ int c=0; for(int i=0;i<nf;i++) if((s>>i)&1) c|=1<<fr[i];
      for(int h=0;h<9;h++) if(m[h]){ int val=r[h]^__builtin_parity(m[h]&c&((1<<h)-1)); if(val) c|=1<<h; } out.push_back(c); } } };
struct Solver {
  int R=0; int A[16]; int GRP[16], GSZ[16]; std::vector<int> XS[16];
  uint16_t Res[64][9], ResT[64][9]; int u[64]; uint32_t assigned=0; int B[16], C[16];
  long long nodes=0; bool found=false; Info inf[64]; const Target* TG=nullptr;
  void setup(const Target* tg,const int* a,int r){ TG=tg; R=r; for(int l=0;l<R;l++){ A[l]=a[l]; XS[l].clear(); for(int X=1;X<64;X++) if(__builtin_parity(A[l]&X)) XS[l].push_back(X); }
    for(int l=0;l<R;l++){ GRP[l]=l; for(int l2=0;l2<l;l2++) if(A[l2]==A[l]){ GRP[l]=GRP[l2]; break; } } for(int l=0;l<R;l++) GSZ[l]=0; for(int l=0;l<R;l++) GSZ[GRP[l]]++;
    for(int X=1;X<64;X++){ memcpy(Res[X],TG->TX[X],18); memcpy(ResT[X],TG->TXT[X],18); u[X]=0; } for(int l=0;l<R;l++) for(int X:XS[l]) u[X]++; assigned=0; nodes=0; found=false; }
  bool pre(){ for(int X=1;X<64;X++) if(rank9(TG->TX[X])>u[X]) return false; return true; }
  inline void apply(int l,int b,int c){ for(int X:XS[l]){ for(int y=0;y<9;y++) if((b>>y)&1) Res[X][y]^=c; for(int z=0;z<9;z++) if((c>>z)&1) ResT[X][z]^=b; u[X]--; } }
  inline void unapply(int l,int b,int c){ for(int X:XS[l]){ for(int y=0;y<9;y++) if((b>>y)&1) Res[X][y]^=c; for(int z=0;z<9;z++) if((c>>z)&1) ResT[X][z]^=b; u[X]++; } }
  bool checkAfter(int l){ for(int X:XS[l]){ if(rank9(Res[X])>u[X]) return false; } return true; }
  void computeInfo(int X){ Info& I=inf[X]; I.u=u[X];
    uint16_t v[9], cmb[9]; for(int z=0;z<9;z++){ v[z]=ResT[X][z]; cmb[z]=1<<z; }
    int rk=0; I.ncb=0; I.nrk=0; uint16_t bv[9]={0}, bc[9]={0};
    for(int z=0;z<9;z++){ uint16_t a=v[z], k=cmb[z]; while(a){ int h=31-__builtin_clz(a); if(!bv[h]){ bv[h]=a; bc[h]=k; rk++; break; } a^=bv[h]; k^=bc[h]; } if(!a) I.rker[I.nrk++]=k; }
    I.rk=rk; for(int h=8;h>=0;h--) if(bv[h]){ I.cb[I.ncb]=bv[h]; I.cc[I.ncb]=bc[h]; I.ncb++; }
    uint16_t lv[9]={0}, lc[9]={0}; I.nlk=0;
    for(int y=0;y<9;y++){ uint16_t a=Res[X][y], k=1<<y; while(a){ int h=31-__builtin_clz(a); if(!lv[h]){ lv[h]=a; lc[h]=k; break; } a^=lv[h]; k^=lc[h]; } if(!a) I.lker[I.nlk++]=k; } }
  bool inCol(const Info& I,int b,int& x){ uint16_t a=b; x=0; for(int i=0;i<I.ncb;i++){ int h=31-__builtin_clz(I.cb[i]); if((a>>h)&1){ a^=I.cb[i]; x^=I.cc[i]; } } return a==0; }
  long long candidates(int l,std::vector<std::pair<int,int>>* out,long long cap){
    std::vector<int> tight, s1; for(int X:XS[l]){ int s=inf[X].u-inf[X].rk; if(s==0) tight.push_back(X); else if(s==1) s1.push_back(X); }
    Sys bs; bs.clear(); for(int X:tight){ const Info& I=inf[X]; for(int i=0;i<I.nlk;i++) bs.add(I.lker[i],0); }
    Sys base; base.clear(); for(int X:tight){ const Info& I=inf[X]; for(int i=0;i<I.nrk;i++) base.add(I.rker[i],0); }
    std::vector<int> bl; bs.solutions(bl); long long tot=0; std::vector<int> cl;
    for(int b:bl){ if(!b) continue; Sys s=base; bool ok=true;
      for(int X:tight){ int x; if(!inCol(inf[X],b,x)){ ok=false; break; } s.add(x,1); if(s.bad){ ok=false; break; } }
      if(!ok) continue;
      for(int X:s1){ int x; if(!inCol(inf[X],b,x)){ const Info& I=inf[X]; for(int i=0;i<I.nrk;i++) s.add(I.rker[i],0); if(s.bad) break; } }
      if(s.bad) continue;
      int nf=9-s.rank(); long long cnt=(1LL<<nf);
      if(out){ s.solutions(cl); for(int c:cl) if(c) out->push_back({b,c}); }
      tot+=cnt; if(tot>cap) return tot; }
    return tot; }
  void dfs(){
    if(found) return; ++nodes;
    if(assigned==((1u<<R)-1)){ for(int X=1;X<64;X++) for(int y=0;y<9;y++) if(Res[X][y]) return; found=true; return; }
    for(int X=1;X<64;X++) if(u[X]>0) computeInfo(X); else { inf[X].u=0; inf[X].rk=0; }
    int best=-1; long long bc=LLONG_MAX;
    for(int l=0;l<R;l++) if(!((assigned>>l)&1)){ long long c=candidates(l,nullptr,bc); if(c<bc){ bc=c; best=l; if(c==0) break; } }
    if(best<0||bc==0) return;
    std::vector<std::pair<int,int>> cand; candidates(best,&cand,LLONG_MAX);
    int l=best; assigned|=1u<<l;
    for(auto& bc2:cand){ int b=bc2.first, c=bc2.second;
      if(GSZ[GRP[l]]>1){ int key=512*b+c; bool bad=false;
        for(int l2=0;l2<R && !bad;l2++) if(l2!=l && GRP[l2]==GRP[l] && ((assigned>>l2)&1)){ int k2=512*B[l2]+C[l2]; if((l2<l && key<k2) || (l2>l && key>k2)) bad=true; }
        if(bad) continue; }
      apply(l,b,c);
      if(checkAfter(l)){ B[l]=b; C[l]=c; dfs(); }
      unapply(l,b,c); if(found) break; }
    assigned&=~(1u<<l); }
};
static bool solveT(const Target& tg,const int* a,int r){ thread_local Solver* S=nullptr; if(!S) S=new Solver(); S->setup(&tg,a,r); if(!S->pre()) return false; S->dfs(); return S->found; }
static bool solve11(const int* a){ return solveT(TG11,a,11); }
// ---- memo: canonical 11-multiset (sorted, 6 bits each) -> SAT ----
struct Shard { std::mutex mu; std::unordered_map<uint64_t,uint8_t> m; char pad[64]; };
static Shard SH[64];
static inline uint64_t packSorted(const int* c){ uint64_t k=0; for(int i=0;i<11;i++) k=(k<<6)|(uint64_t)c[i]; return k; }
static uint64_t packN(const int* c,int n){ uint64_t k=0; for(int i=0;i<n;i++) k=(k<<6)|(uint64_t)c[i]; return k; }
static uint64_t canonN(const int* c,int n,int* out){ int best[11]; bool have=false; int img[11];
  for(int g=0;g<1008;g++){ const uint8_t* P=G6[g]; for(int i=0;i<n;i++){ int x=P[c[i]]; int j=i; while(j>0 && img[j-1]>x){ img[j]=img[j-1]; j--; } img[j]=x; }
    if(!have){ memcpy(best,img,sizeof(int)*n); have=true; continue; }
    for(int i=0;i<n;i++){ if(img[i]<best[i]){ memcpy(best,img,sizeof(int)*n); break; } if(img[i]>best[i]) break; } }
  if(out) memcpy(out,best,sizeof(int)*n); return packN(best,n); }
static uint64_t canon(const int* c){ int best[11]; bool have=false; int img[11];
  for(int g=0;g<1008;g++){ const uint8_t* P=G6[g]; for(int i=0;i<11;i++){ int x=P[c[i]]; int j=i; while(j>0 && img[j-1]>x){ img[j]=img[j-1]; j--; } img[j]=x; }
    if(!have){ memcpy(best,img,sizeof img); have=true; continue; }
    for(int i=0;i<11;i++){ if(img[i]<best[i]){ memcpy(best,img,sizeof img); break; } if(img[i]>best[i]) break; } }
  return packSorted(best); }
static bool dictOK(const uint8_t* w11){
  gCalls++;
  int c[11]; for(int i=0;i<11;i++) c[i]=w11[i]; std::sort(c,c+11);
  uint64_t raw=packSorted(c);
  struct TLC { uint64_t k[1<<14]; uint8_t v[1<<14]; TLC(){ memset(k,0xff,sizeof k); } };
  thread_local TLC* tl=nullptr; if(!tl) tl=new TLC();
  size_t h=(raw*0x9E3779B97F4A7C15ULL)>>50;
  if(tl->k[h]==raw){ gTL++; bool ok=tl->v[h]; if(!ok) gCut++; return ok; }
  uint64_t key=canon(c); Shard& s=SH[(key*0xBF58476D1CE4E5B9ULL)>>58]; int res=-1;
  { std::lock_guard<std::mutex> lk(s.mu); auto it=s.m.find(key); if(it!=s.m.end()) res=it->second; }
  if(res<0){ int a[11]; for(int i=0;i<11;i++) a[i]=(int)((key>>(6*(10-i)))&63); res=solve11(a)?1:0; gSolve++; if(res) gSolveSat++;
    std::lock_guard<std::mutex> lk(s.mu); s.m[key]=(uint8_t)res; }
  tl->k[h]=raw; tl->v[h]=(uint8_t)res; if(!res) gCut++; return res; }

// ---- part (c): |W| = 10.  Memo value: bit0 = (c) holds, bit1 = some a gives I+a in the dictionary (computed only when (c) fails) ----
static int k10compute(const int* c){   // c sorted (canonical), 10 entries
  for(int t=0;t<K10N;t++){ gK10solves++; if(solveT(TGK[t],c,10)) return 1; }
  for(int t=0;t<K10N;t++) for(int d=0;d<10;d++){ if(d>0 && c[d]==c[d-1]) continue; int c9[9], m=0; for(int i=0;i<10;i++) if(i!=d) c9[m++]=c[i]; gK10solves++; if(solveT(TGK[t],c9,9)) return 1; }
  gK10false++; int v=0;
  for(int a=1;a<64 && !v;a++){ uint8_t w11[11]; for(int i=0;i<10;i++) w11[i]=(uint8_t)c[i]; w11[10]=(uint8_t)a; if(dictOK(w11)) v=2; }
  if(v) gK10ext++; return v; }
static int k10val(const uint8_t* w10){
  gK10calls++;
  int c[10]; for(int i=0;i<10;i++) c[i]=w10[i]; std::sort(c,c+10);
  uint64_t raw=packN(c,10)|(1ULL<<62);
  struct TLC { uint64_t k[1<<14]; uint8_t v[1<<14]; TLC(){ memset(k,0xff,sizeof k); } };
  thread_local TLC* tl=nullptr; if(!tl) tl=new TLC();
  size_t h=(raw*0x9E3779B97F4A7C15ULL)>>50;
  if(tl->k[h]==raw){ gK10tl++; return tl->v[h]; }
  int cc[10]; uint64_t key=canonN(c,10,cc)|(1ULL<<62); Shard& s=SH[(key*0xBF58476D1CE4E5B9ULL)>>58]; int res=-1;
  { std::lock_guard<std::mutex> lk(s.mu); auto it=s.m.find(key); if(it!=s.m.end()) res=it->second; }
  if(res<0){ gK10miss++; res=k10compute(cc); std::lock_guard<std::mutex> lk(s.mu); s.m[key]=(uint8_t)res; }
  tl->k[h]=raw; tl->v[h]=(uint8_t)res; return res; }
static void init(){
  // target T' = <2,3,2> in W0 coordinates
  { int tr[12][3], n=0; for(int i=0;i<2;i++) for(int j=0;j<3;j++) for(int k=0;k<2;k++){ tr[n][0]=3*i+j; tr[n][1]=3*j+k; tr[n][2]=3*k+i; n++; } buildTarget(TG11,tr,n); }
  for(int t=0;t<K10N;t++){ int tr[64][3]; for(int i=0;i<K10LEN[t];i++) for(int e=0;e<3;e++) tr[i][e]=K10T[t][i][e]; buildTarget(TGK[t],tr,K10LEN[t]); }
  // the 14 W-type subspaces and their maps onto W0 (same choice of P as r22/wtight/wmap.py)
  memset(WM,0,sizeof WM); memset(W0C,0,sizeof W0C);
  for(int u=1;u<8;u++){ int P[3][3]; bool got=false;
    for(int r0=1;r0<8 && !got;r0++) for(int r1=1;r1<8 && !got;r1++) if(rank3rows(r0,r1,u)==3){ int rows[3]={r0,r1,u}; for(int i=0;i<3;i++) for(int k=0;k<3;k++) P[i][k]=(rows[i]>>k)&1; got=true; }
    for(int a=1;a<512;a++){
      int s=0; for(int j=0;j<3;j++){ int t=0; for(int i=0;i<3;i++) if((u>>i)&1) t^=bitm(a,i,j); s|=t; }
      if(!s){ int m=matmul(P,a); if(m>=64){ fprintf(stderr,"wcut map row %d\n",u); exit(2); } WM[a]|=1<<(u-1); W0C[u-1][a]=(uint8_t)m; }
      int s2=0; for(int i=0;i<3;i++){ int t=0; for(int j=0;j<3;j++) if((u>>j)&1) t^=bitm(a,i,j); s2|=t; }
      if(!s2){ int m=matmul(P,transp(a)); if(m>=64){ fprintf(stderr,"wcut map col %d\n",u); exit(2); } WM[a]|=1<<(7+u-1); W0C[7+u-1][a]=(uint8_t)m; } } }
  for(int w=0;w<14;w++){ int n=0; std::set<int> img; for(int a=1;a<512;a++) if((WM[a]>>w)&1){ n++; img.insert(W0C[w][a]); } if(n!=63||(int)img.size()!=63){ fprintf(stderr,"wcut W %d: %d points\n",w,n); exit(2); } }
  // GL2 x GL3 on 2x3 matrices: x -> P x Q
  int g=0;
  for(int p0=1;p0<4;p0++) for(int p1=1;p1<4;p1++){ if(p0==p1) continue;
    for(int q0=1;q0<8;q0++) for(int q1=1;q1<8;q1++) for(int q2=1;q2<8;q2++){ if(rank3rows(q0,q1,q2)!=3) continue;
      int P[2][2]={{p0&1,(p0>>1)&1},{p1&1,(p1>>1)&1}}; int Q[3][3]; int qr[3]={q0,q1,q2}; for(int j=0;j<3;j++) for(int k=0;k<3;k++) Q[j][k]=(qr[j]>>k)&1;
      for(int c=0;c<64;c++){ int X[2][3]; for(int i=0;i<2;i++) for(int j=0;j<3;j++) X[i][j]=(c>>(3*i+j))&1;
        int r=0; for(int i=0;i<2;i++) for(int k=0;k<3;k++){ int s=0; for(int i2=0;i2<2;i2++) for(int j=0;j<3;j++) s^=P[i][i2]&X[i2][j]&Q[j][k]; r|=s<<(3*i+k); }
        G6[g][c]=(uint8_t)r; }
      g++; } }
  if(g!=1008){ fprintf(stderr,"wcut group %d\n",g); exit(2); }
}
static void stats(FILE* o){ fprintf(o," | wcut cap12 %lld dict calls %lld (tl hits %lld) cut %lld solves %lld (sat %lld)",(long long)gCap,(long long)gCalls,(long long)gTL,(long long)gCut,(long long)gSolve,(long long)gSolveSat);
  if(K10) fprintf(o," | wk10 calls %lld (tl %lld) new sets %lld (c fails %lld, extendable %lld) solves %lld, add cuts %lld, leaf rejects %lld",(long long)gK10calls,(long long)gK10tl,(long long)gK10miss,(long long)gK10false,(long long)gK10ext,(long long)gK10solves,(long long)gK10cut,(long long)gK10leaf); }
}
