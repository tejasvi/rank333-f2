// d63 (from the glue agent's hpt copy, 2026-10-07): written duals fit the E1P/E1G stream (e1pemit.h): every dual has at most 63 rows
// (6-bit count) and entries below 2^36 (36-bit Y; an entry from 2^36 on is "big", where it was 1e12).  An LP kill whose dual has more
// rows is sparsified greedily (drop rows, smallest Y first, while certB still kills; any Y >= 0 is a valid bound); if that fails the
// node is not killed by it.  dvalid[d] (reuse at the child, fixing) is set from the latest LP round: false for a dual with a big entry
// or more than 63 rows.  Jobs whose duals already fit are unchanged.
#define YBIG 68719476736.0
#include <malloc.h>
// lineenum9qe (lenum speedups, native/xtier/lenum, 2026-10-07): the same search, the same trace bytes, the same st-nodes, leaves and
// canonical order as lineenum9qe for the same jobs per thread; only the implementation of these steps changed (each change is exact):
//  - node LP: packlp_avx.h (packlp.h's pivots and floating-point operations, AVX-512 layout; tableau rows filled from the masks);
//  - LP separation: rows 64 at a time from label->row bitmaps with an exact integer prefilter (saturating byte sums of ceil(8x));
//  - add/undo: masked byte adds of the label's row bitmap over 64-row words (same counts, same cap-reached rows);
//  - prep: act lists carry the rows' mask words and caps, the filter and the slack loop fused 8 rows at a time (N <= 128);
//  - post: slack buckets carry mask words and caps, 8 rows at a time; canonAdd and the image update 16 entries at a time;
//  - leaves: with every row tracked, the leaf recount equals the maintained counts (byte compare); --out /dev/null writes nothing;
//  - LP counters per State (added to the global totals when a State ends).
// Build exactly as before (g++ -O3 -march=native -std=c++17 ...) on a CPU with AVX-512 F/BW/VL/VPOPCNTDQ/VBMI (Zen 4/5).
// lineenum9qy: lineenum9q plus the lineenum9y check: a frontier job whose replayed prefix breaks a row cap or a label bound of this IP
// (a stronger IP than the one the frontier came from) is done with no leaves instead of being searched from an infeasible state.
// lineenum9q: lineenum9m with label multiplicities up to 6 (masks r5, r6; dim-4/5 quotients have cosets of bound 5-6).
// lineenum9m: lineenum9x with label multiplicities up to 4 (mask r4 beside allowed/r2/r3; plane quotients have cosets of bound 4).
// lineenum9x: lineenum9w + work stealing inside frontier jobs (--donate D, default 0 = off), as lineenum7s: idle workers take
// donated subtrees (depth < D) once the job list is exhausted; a job's state line is written when its root and all pieces end.
// Disabled with --cert, --budget or frontier collection.  Same tree and leaves; only who runs which subtree changes.
// Exhaustive enumeration of the solutions of a line-lemma occupation IP dumped by profS --dumpip.
// A solution is a multiset of R labels (points of V = A/E) with m(U) <= cap(U) for every dumped subspace U.
// Search: labels in nondecreasing order; a label is "allowed" while its multiplicity is below its point cap and
// no saturated subspace contains it, so every cap holds by construction.  Lookahead: for subspaces U of large
// dimension, the remaining slots that cannot go inside U must be fillable by allowed labels >= pos outside U.
// Symmetry: orderly generation under the dumped group G_E (sorted label sequence lex-min in its orbit; prefixes
// of canonical sequences are canonical, so each orbit is produced exactly once).
// LP bound (--lp dmin dmax): at nodes of depth dmin..dmax, prune when the LP relaxation of the remaining slots over
// the label suffix is < rem, certified by an exact integer weak-duality check (see State::lpPrune).
// --roots f K: the jobs are the nodes K levels below each label prefix listed in f (one per line, comma-separated).
// --root v1,..,vk: the jobs are the --frontier nodes of the subtree of that node (replayed with every check).
// --budget B --heavy f: a job visiting more than B nodes is abandoned (not recorded as done) and its prefix appended to f.
// --subroot D IX: the jobs are the --frontier nodes of the subtree of node IX of the depth-D frontier (split a heavy job).
// lineenum9qe (hcls/E1P): lineenum9qp plus --e1p P (with --e1g before it: the E1G stream format, N <= 127; with --e1pext,
// leaves gen7 cannot certify are emitted as E1G external leaves and listed in P_<pid>_ext_t<k>.txt, "job l1,..,lR"): each finished job is converted in the worker thread to E1P block literals
// (e1pemit.h: model check, emission, semantic mirror, glue) and written to P_<pid>_t<thread>.e1p; a job with leaves needs
// v7 certificates: with --e1pE E1,.. (the IP's basis E) the C++ gen7 computes them in the worker (gen7.h, e1pleaf.h);
// without it the trace goes to P_<pid>_leafjobs_t<thread>.bin for the two-pass route (e1pconv --leaves-out, py/leafcerts.py,
// e1pconv --leafcerts).  .e1p records: u32 0x4A503145, u32 job index, u32 literal count, then per literal
// u32 byte length and little-endian bytes.  A job whose conversion fails is reported and its trace written with the leaf jobs.
// lineenum9qp (hcls/E1P): lineenum9qy with the cut row (kind 1) and the lookahead row of P records written as varints
// (lineenum9qy wrote 16 bits, too few for the point IP's 416,943 rows).
// --cert P (lineenum3): write a proof trace of every completed search block to P_t<thread>.bin (jobs) and P_top.bin (the
// part above the frontier), for the independent checker lechk.  Replays of a subtree root (job, --root, --roots,
// --subroot) add the prefix labels only (no LP fixing along the prefix), so every block is self-contained.
// Record format (all integers little-endian, v = LEB128 varint, labels in search order):
//   block: 'T' n vec16*n frontierD8 | 'J' n vec16*n ;  node records ... ;  'Z' v(nodes)
//   node:  'L' leaf | 'F' frontier node | 'K' dual (LP kill over labels >= pos) |
//          'O' cut8 kind8 [row16 if kind 1] hasDual8 [dual] { 'C' label8 child }* 'E'
//          (no completion uses only labels >= cut: kind 0 cut = N, 1 row bound, 2 total weight, 3 LP-forced label cut)
//   child: node record, or 'P' kind8 [row16]: the child fails the lookahead after it is added (labels >= its label)
//   dual:  v(n) { row16 v(Y) }*n  (exact weak-duality certificate, scale 2^30)
// Usage: lineenum ipfile [--estimate K] [--threads T] [--frontier D] [--state f] [--out f] [--look kmin] [--seed s]
//        [--order f] [--check sols] [--lp dmin dmax] [--lpadd K] [--dumpnodes D] [--maxjobs K] [--skipk k]
#include <bits/stdc++.h>
#include <condition_variable>
#include <thread>
#include <atomic>
#include <mutex>
#include <unistd.h>
#include "packlp_avx.h"
#include "e1pleaf.h"
#include <immintrin.h>
static std::atomic<long long> gSparse{0}, gSparseFail{0};   // d63 counters
#if !(defined(__AVX512F__) && defined(__AVX512BW__) && defined(__AVX512VL__) && defined(__AVX512VPOPCNTDQ__) && defined(__AVX512VBMI__))
#error "this lineenum9qe needs AVX-512 F/BW/VL/VPOPCNTDQ/VBMI: build with -march=native on Zen 4/5 (or use the original lineenum9qe)"
#endif
typedef unsigned long long u64;
struct M128 { u64 w[4]; };   // lineenum9: 256-label masks (point quotients have 255 cosets); the type name is kept
static inline M128 AND(M128 x,M128 y){ return {{x.w[0]&y.w[0],x.w[1]&y.w[1],x.w[2]&y.w[2],x.w[3]&y.w[3]}}; }
static inline M128 ANDN(M128 x,M128 y){ return {{x.w[0]&~y.w[0],x.w[1]&~y.w[1],x.w[2]&~y.w[2],x.w[3]&~y.w[3]}}; }
static inline int PC(M128 x){ return __builtin_popcountll(x.w[0])+__builtin_popcountll(x.w[1])+__builtin_popcountll(x.w[2])+__builtin_popcountll(x.w[3]); }
static inline bool TST(M128 x,int l){ return (x.w[l>>6]>>(l&63))&1; }
static inline void CLR(M128& x,int l){ x.w[l>>6]&=~(1ULL<<(l&63)); }
static inline void SET(M128& x,int l){ x.w[l>>6]|=(1ULL<<(l&63)); }
static inline bool NZ(M128 x){ return (x.w[0]|x.w[1]|x.w[2]|x.w[3])!=0; }
#define FORBITS(m,l,BODY) for(int q_=0;q_<4;q_++) for(u64 w_=(m).w[q_]; w_; w_&=w_-1){ int l=64*q_+__builtin_ctzll(w_); BODY; }
static int R,N; static std::vector<int> vecs; static int ub[256]; static std::vector<char> SEPSKIP; static const char* SEPSKIPF=nullptr;   // lineenum9x: rows never separated (dominated: implied for the LP)
struct Row { M128 mask; int cap,size,k; };
static std::vector<Row> rows; static std::vector<std::vector<int>> inc; static std::vector<int> look; static int LOOKK=7;
static std::vector<std::vector<int>> G; static M128 suf[257];
static std::mutex outmu; static FILE* OUT=nullptr; static std::atomic<long long> nleaf{0};
static int DUMPD=-1; static std::vector<int> ORD; static std::mutex dumpmu;
static const char* CERTP=nullptr; static std::mutex certmu;
static double MAXRSS=0; static bool E1PMIRROR=true; static std::vector<int> E1PE; static bool E1PEXT=false; static const char* E1PP=nullptr; static e1p::IP* E1PIP=nullptr; static long long E1PLIMIT=1<<16; static size_t E1PRLIM=4000;
static std::atomic<long long> e1pJobs{0}, e1pLeafJobs{0}, e1pFail{0}, e1pLits{0}, e1pNodes{0}; static std::atomic<long long> e1pNs{0}; static std::atomic<long long> e1pNsCheck{0}, e1pNsEmit{0}, e1pNsMirror{0};
static std::atomic<long long> gPrefixCut{0}; static int DONATE_D=0; struct Piece { int ix; std::vector<int> seq; M128 a,b,c,e,f,g; /* allowed,r2..r6 at the donation point (carry LP fixes) */ }; static std::mutex qmu; static std::condition_variable qcv; static std::deque<Piece> PQ;
static std::atomic<int> idleN{0}; static std::atomic<int>* gOut=nullptr; static std::atomic<long long> donatedN{0}; static long long BUDGET_G=0;
static std::set<int> SKIPK; static int FRONTIER_D=-1; static bool collecting=false; static std::vector<std::vector<int>> frontier;

// HiGHS C API (libhighs.so.1 shipped in the highspy wheel; HighsInt is 32-bit there)
extern "C" {
void* Highs_create(void); void Highs_destroy(void*);
int Highs_passLp(void*,int,int,int,int,int,double,const double*,const double*,const double*,const double*,const double*,const int*,const int*,const double*);
int Highs_run(void*); int Highs_getModelStatus(const void*); double Highs_getObjectiveValue(const void*);
int Highs_getSolution(const void*,double*,double*,double*,double*);
int Highs_setBoolOptionValue(void*,const char*,int); int Highs_setStringOptionValue(void*,const char*,const char*); int Highs_setIntOptionValue(void*,const char*,int);
int Highs_addRows(void*,int,const double*,const double*,int,const int*,const int*,const double*);
double Highs_getInfinity(const void*);
}
static int SEPMODE=1, INHERIT=1, INHMAX=0; static const char* DONEPF=nullptr; static std::atomic<long long> plSolves{0}, plFails{0}, plPivots{0}, plFallback{0}; static bool USEPL=true;
static int LPMIN=1, LPMAX=-1, LPADD=100; static bool LPFIX=true; static int SIBK=0; static bool SIBSEED=false; static std::atomic<long long> lpSib[64]; static std::atomic<long long> lpCalls[64], lpKills[64], lpReuse[64], lpRounds{0}, lpFails{0}, lpFixed{0};

static std::vector<uint32_t> SID; static std::vector<u64> SW[4]; static std::vector<uint8_t> SCAP; static bool VSEP=true; static bool SIDID=false; /* lenum: SID is the identity (rows 0..n-1) */ static int NWR=0; static u64* RBI=nullptr; static bool DENSE=false, RBMOK=false, FASTLEAF=false; static std::vector<uint8_t> CAPP; /* lenum: RBI[l*NWR+w] = rows 64w..64w+63 of incF[l]; DENSE = incF lists have no repeats; RBMOK = also the rows' masks transposed (SID identity) */ static const char* FRONTF=nullptr;
static std::vector<uint32_t> incF; static std::vector<int> incO; static std::vector<uint8_t> capv; static std::vector<int> allInc[256];
static std::vector<int> untracked; // rows not tracked during search (checked at leaves)
static inline int pc6(u64 a,u64 b,u64 c,u64 d,u64 e,u64 f){ return __builtin_popcountll(a)+__builtin_popcountll(b)+__builtin_popcountll(c)+__builtin_popcountll(d)+__builtin_popcountll(e)+__builtin_popcountll(f); }
static inline int topk64(u64 x1,u64 x2,u64 x3,u64 x4,u64 x5,u64 x6,int k){ // max p with sum of popcount(xi>>p) >= k, or -1
  if(pc6(x1,x2,x3,x4,x5,x6)<k) return -1;
  int lo=0,hi=63; while(lo<hi){ int mid=(lo+hi+1)>>1; if(pc6(x1>>mid,x2>>mid,x3>>mid,x4>>mid,x5>>mid,x6>>mid)>=k) lo=mid; else hi=mid-1; } return lo; }
static inline int topk(M128 B1,M128 B2,M128 B3,M128 B4,M128 B5,M128 B6,int k){ if(k<=0) return 255;
  for(int q=3;q>=0;q--){ int c=pc6(B1.w[q],B2.w[q],B3.w[q],B4.w[q],B5.w[q],B6.w[q]);
    if(c>=k) return 64*q+topk64(B1.w[q],B2.w[q],B3.w[q],B4.w[q],B5.w[q],B6.w[q],k); k-=c; }
  return -1; }
// lenum: the nonzero words of up to 6 residual masks; w(m) = sum_k |L_k minus m| over them (zero words contribute nothing, so this
// equals PC(ANDN(L1,m))+..+PC(ANDN(L6,m)) exactly)
struct WL { u64 v[24]; uint8_t q[24]; int n=0;
  inline void build(const M128& a,const M128& b,const M128& c,const M128& d_,const M128& e,const M128& f){ n=0; const M128* L[6]={&a,&b,&c,&d_,&e,&f};
    for(int k=0;k<6;k++) for(int qq=0;qq<4;qq++){ u64 x=L[k]->w[qq]; if(x){ v[n]=x; q[n]=(uint8_t)qq; n++; } } }
  inline int w(const M128& m) const { int s=0; for(int t=0;t<n;t++) s+=__builtin_popcountll(v[t]&~m.w[q[t]]); return s; } };
struct State {
  std::vector<uint8_t> cb; bool cert=false; int prepRow=-1, postRow=-1; int curJob=-1;
  inline void c8(int x){ if(cert) cb.push_back((uint8_t)x); }
  inline void c16(int x){ if(cert){ cb.push_back((uint8_t)(x&255)); cb.push_back((uint8_t)((x>>8)&255)); } }
  inline void cv(unsigned long long x){ if(!cert) return; while(x>=128){ cb.push_back((uint8_t)(x&127)|128); x>>=7; } cb.push_back((uint8_t)x); }
  inline void cdual(const std::vector<uint32_t>& rs,const std::vector<long long>& Y){ if(!cert) return; cv(rs.size()); for(size_t i=0;i<rs.size();i++){ cv(rs[i]); cv((unsigned long long)Y[i]); } }   // lineenum9: row ids as varints (lineenum7 wrote 16 bits)
  void cbegin(char tag,const int* pre,int n,int fd){ if(!cert) return; cb.clear(); c8(tag); c8(n); for(int i=0;i<n;i++) c16(vecs[pre[i]]); if(tag=='T') c8(fd); }
  void cend(FILE* f,long long nodes){ if(!cert) return; c8('Z'); cv((unsigned long long)nodes); uint32_t mg=0x3342454C; uint64_t len=cb.size();
    { std::lock_guard<std::mutex> lk(certmu); fwrite(&mg,4,1,f); fwrite(&len,8,1,f); fwrite(cb.data(),1,cb.size(),f); fflush(f); } cb.clear(); }
  std::vector<uint8_t> cnt; int mult[256]; int seq[64]; int d=0; M128 allowed,r2,r3,r4,r5,r6; M128 stA[64],st2[64],st3[64],st4[64],st5[64],st6[64];
  int ng; std::vector<int> imgv; // img(depth,g)[j]: sorted image of seq[0..depth-1] under G[g]
  inline int* img(int dd,int g){ return &imgv[((size_t)dd*ng+g)*64]; }
  std::vector<uint32_t> act[64]; std::vector<uint32_t> aR[64]; std::vector<u64> aW0[64], aW1[64]; std::vector<uint8_t> aC[64], aS;   // lenum: act lists in SoA form (prepF)
  long long visited=0, leaves=0; long long depthCnt[64]={0}; long long budgetEnd=LLONG_MAX; bool aborted=false;
  State(){ cnt.assign(std::max(rows.size(),(size_t)NWR*64),0); memset(mult,0,sizeof mult); allowed=M128{}; r2=M128{}; r3=M128{}; r4=M128{}; r5=M128{}; r6=M128{}; ng=G.size(); imgv.assign((size_t)(R+2)*ng*64,0);
    for(int l=0;l<N;l++){ if(ub[l]>=1) SET(allowed,l); if(ub[l]>=2) SET(r2,l); if(ub[l]>=3) SET(r3,l); if(ub[l]>=4) SET(r4,l); if(ub[l]>=5) SET(r5,l); if(ub[l]>=6) SET(r6,l); }
    for(int r:look) if(R-capv[r]>=1) act[0].push_back(r);
    for(int r:act[0]){ aR[0].push_back(r); aW0[0].push_back(rows[r].mask.w[0]); aW1[0].push_back(rows[r].mask.w[1]); aC[0].push_back(capv[r]); }
    if(LPMAX>=0){ hl=Highs_create(); Highs_setBoolOptionValue(hl,"output_flag",0); Highs_setStringOptionValue(hl,"presolve","off");
      Highs_setIntOptionValue(hl,"threads",1); lact.assign(rows.size(),0.0); inW.assign(std::max(rows.size(),(size_t)NWR*64),0); sepS.resize((size_t)NWR*64+64); sepB.resize((size_t)NWR*64+64); pcb.assign(SID.size(),0); } }
  // lenum: LP counters per State (same names as the global atomics, which they shadow inside State); added to the globals
  // when the State ends (before lpReport), so the totals printed are unchanged
  long long lpRounds=0, lpFails=0, lpFixed=0, plSolves=0, plFails=0, plPivots=0, plFallback=0, lpCalls[64]={0}, lpKills[64]={0}, lpReuse[64]={0}, lpSib[64]={0};
  std::vector<std::pair<double,int>> violBuf;
  ~State(){ ::lpRounds+=lpRounds; ::lpFails+=lpFails; ::lpFixed+=lpFixed; ::plSolves+=plSolves; ::plFails+=plFails; ::plPivots+=plPivots; ::plFallback+=plFallback;
    for(int i=0;i<64;i++){ ::lpCalls[i]+=lpCalls[i]; ::lpKills[i]+=lpKills[i]; ::lpReuse[i]+=lpReuse[i]; ::lpSib[i]+=lpSib[i]; }
    if(hl) Highs_destroy(hl); }
  State(const State&)=delete;
  // ---- LP bound.  At a node with remaining slots rem, every completion uses rem labels from S = allowed labels at
  // positions >= pos, so it is a feasible point of  max sum x_l  s.t. 0 <= x_l <= residual multiplicity of l,
  // sum_{l in U} x_l <= cap(U) - m(U) for every tracked subspace U.  Rows are generated lazily (start from the
  // parent's dual support, add the most violated rows of the current optimum).  The node is pruned only when an
  // exact integer check of weak duality proves the optimum < rem: for any y >= 0,
  //   sum x <= sum_U y_U b_U + sum_l u_l max(0, 1 - sum_{U ni l} y_U),
  // evaluated with y = floor(2^30 * dual)/2^30 in 64-bit integers.
  struct alignas(64) B64 { uint8_t b[64]; }; template<class T> struct AV { std::vector<B64> v; void resize(size_t n){ v.resize((n+63)/64); } uint8_t* data(){ return v.empty()?nullptr:v[0].b; } };
  AV<uint8_t> sepS, sepB;   // lenum: separation byte sums and the bq8 table (64-byte aligned)
  std::vector<uint16_t> pcb; void* hl=nullptr; std::vector<double> lact; std::vector<char> inW; std::vector<uint32_t> dsup[64]; std::vector<long long> dY[64]; bool dvalid[64]={0}; std::vector<uint32_t> kS[64][8]; std::vector<long long> kY[64][8]; int kN[64]={0}, kH[64]={0};
  void sibRec(){ if(SIBK<=0) return; int j=kH[d]; kS[d][j]=dsup[d]; kY[d][j]=dY[d]; kH[d]=(j+1)%SIBK; if(kN[d]<SIBK) kN[d]++; } std::vector<int> Wr; std::vector<int> WrD[64];
  static constexpr long long SC=1LL<<30;
  // exact weak-duality value (times SC) of the integer dual Y on rows rs at the current node
  long long certB(const std::vector<uint32_t>& rs,const std::vector<long long>& Y,M128 S1,M128 S2,M128 S3,M128 S4,M128 S5,M128 S6,int pos){
    long long B=0; long long T[256]; for(int l=pos;l<N;l++) T[l]=0;
    for(size_t i=0;i<rs.size();i++){ int r=rs[i]; B+=Y[i]*(long long)((int)capv[r]-(int)cnt[r]); M128 m=AND(rows[r].mask,S1);
      FORBITS(m,l_,T[l_]+=Y[i]) }
    for(int l=pos;l<N;l++) if(TST(S1,l) && T[l]<SC) B+=(long long)(1+TST(S2,l)+TST(S3,l)+TST(S4,l)+TST(S5,l)+TST(S6,l))*(SC-T[l]);
    return B; }
  // hpt: at most DMAX rows in a written dual.  fitD: true if (rs, Y) has at most DMAX rows, or after greedy sparsification (rows dropped in
  // increasing Y while certB stays < lim; any Y >= 0 is a valid bound) it has; (rs, Y) is then the sparse dual.
  static constexpr size_t DMAX=63;
  bool fitD(std::vector<uint32_t>& rs,std::vector<long long>& Y,M128 S1,M128 S2,M128 S3,M128 S4,M128 S5,M128 S6,int pos,long long lim){
    if(rs.size()<=DMAX) return true;
    std::vector<size_t> ix(rs.size()); for(size_t i=0;i<ix.size();i++) ix[i]=i;
    std::stable_sort(ix.begin(),ix.end(),[&](size_t a,size_t b){ return Y[a]<Y[b]; });
    std::vector<char> keep(rs.size(),1); size_t cntK=rs.size(); std::vector<uint32_t> r2; std::vector<long long> y2;
    for(size_t a:ix){ if(cntK<=DMAX) break; keep[a]=0; r2.clear(); y2.clear();
      for(size_t i=0;i<rs.size();i++) if(keep[i]){ r2.push_back(rs[i]); y2.push_back(Y[i]); }
      if(certB(r2,y2,S1,S2,S3,S4,S5,S6,pos)<lim) cntK--; else keep[a]=1; }
    if(cntK>DMAX){ gSparseFail++; return false; }
    r2.clear(); y2.clear(); for(size_t i=0;i<rs.size();i++) if(keep[i]){ r2.push_back(rs[i]); y2.push_back(Y[i]); }
    rs.swap(r2); Y.swap(y2); gSparse++; return true; }
  // Fixing from the certified dual (valid for any Y >= 0): with t_l = T_l/SC and B the certificate value,
  //   sum x <= B/SC - sum_{t_l>1} x_l (t_l-1) - sum_{t_l<1} (u_l-x_l)(1-t_l),
  // so a completion (sum x = rem) has x_l <= (B-rem*SC)/(T_l-SC) when T_l > SC, and x_l >= u_l - (B-rem*SC)/(SC-T_l)
  // when T_l < SC.  Upper bounds shrink allowed/r2/r3; a label forced to appear caps the next label at it.
  int lpFix(int pos,int rem,bool& fixed){
    M128 S1=AND(allowed,suf[pos]), S2=AND(r2,suf[pos]), S3=AND(r3,suf[pos]), S4=AND(r4,suf[pos]), S5=AND(r5,suf[pos]), S6=AND(r6,suf[pos]);
    const auto& rs=dsup[d]; const auto& Y=dY[d];
    long long B=0; long long T[256]; for(int l=pos;l<N;l++) T[l]=0;
    for(size_t i=0;i<rs.size();i++){ int r=rs[i]; B+=Y[i]*(long long)((int)capv[r]-(int)cnt[r]); M128 m=AND(rows[r].mask,S1);
      FORBITS(m,l_,T[l_]+=Y[i]) }
    for(int l=pos;l<N;l++) if(TST(S1,l) && T[l]<SC) B+=(long long)(1+TST(S2,l)+TST(S3,l)+TST(S4,l)+TST(S5,l)+TST(S6,l))*(SC-T[l]);
    long long gap=B-(long long)rem*SC; if(gap<0) return -2; // cannot happen after a failed prune; be safe
    int lreq=N;
    for(int l=pos;l<N;l++){ if(!TST(S1,l)) continue; int u=1+TST(S2,l)+TST(S3,l)+TST(S4,l)+TST(S5,l)+TST(S6,l);
      if(T[l]>SC){ long long km=gap/(T[l]-SC); if(km<u){ fixed=true; lpFixed++;
          if(km<=0){ CLR(allowed,l); CLR(r2,l); CLR(r3,l); CLR(r4,l); CLR(r5,l); CLR(r6,l); } else if(km==1){ CLR(r2,l); CLR(r3,l); CLR(r4,l); CLR(r5,l); CLR(r6,l); } else if(km==2){ CLR(r3,l); CLR(r4,l); CLR(r5,l); CLR(r6,l); } else if(km==3){ CLR(r4,l); CLR(r5,l); CLR(r6,l); } else if(km==4){ CLR(r5,l); CLR(r6,l); } else CLR(r6,l); } }
      else if(T[l]<SC){ long long kmin=u-gap/(SC-T[l]); if(kmin>=1 && l<lreq) lreq=l; } }
    return lreq; }
  // lineenum6: the same LP and separation loop with the dense simplex of packlp.h.  Returns 1 = pruned (K record written),
  // 0 = kept (duals, fixings as in the HiGHS path), -1 = trouble (caller falls back to HiGHS from scratch).
  PackLP pl; std::vector<std::vector<int>> plRows; std::vector<double> plB, plX, plY;
  int lpCustom(int pos,int rem,M128 S1,M128 S2,M128 S3,M128 S4,M128 S5,M128 S6,int nc,const int* colOf,const int* labOf,const double* cu,int& lreq,bool& fixed){
    auto bres=[&](int r)->int{ return (int)capv[r]-(int)cnt[r]; };
    std::vector<std::pair<double,int>>& viol=violBuf; viol.clear(); int bqState=0;   // lenum: 0 = bq8 not built for this call, 1 = built, 2 = some b < 0 (use the sweep)
    for(int round=0; round<200; round++){
      lpRounds++;
      size_t nw=Wr.size(); plB.resize(nw);
      for(size_t i=0;i<nw;i++) plB[i]=bres(Wr[i]);
      plSolves++;   // lenum: the tableau rows are filled from the masks directly (same entries as the plRows lists)
      if(!pl.solveF(nc,(int)nw,[&](int i,double* ar){ M128 m=AND(rows[Wr[i]].mask,S1); FORBITS(m,l_,ar[colOf[l_]]=1.0) },plB.data(),cu)){ plFails++; return -1; }
      plPivots+=pl.iters; double obj=pl.z; pl.primal(plX); pl.duals(plY);
      dsup[d].clear(); dY[d].clear(); bool big=false;
      for(size_t i=0;i<nw;i++){ if(!(plY[i]>0)) continue; double yd=plY[i]*(double)SC; if(!(yd<YBIG)){ big=true; continue; }
        long long Y=(long long)floor(yd); if(Y>0){ dsup[d].push_back(Wr[i]); dY[d].push_back(Y); } }
      dvalid[d]=(!big && dsup[d].size()<=DMAX);
      if(obj<rem-1e-7){
        if(!big && certB(dsup[d],dY[d],S1,S2,S3,S4,S5,S6,pos)<(long long)rem*SC && fitD(dsup[d],dY[d],S1,S2,S3,S4,S5,S6,pos,(long long)rem*SC)){ lpKills[d]++; c8('K'); cdual(dsup[d],dY[d]); sibRec(); return 1; }
        dvalid[d]=false; return -1; }
      viol.clear();
      // lineenum9w: --frontierfile F takes the jobs from a DUMPFRONTIER file (lines "i v1,v2,..."; indices = line order) instead of collecting.
      // lineenum9v: separation sweep over the separable rows only (not --sepskip, tracked), masks stored by word (SoA) so the popcount
//   bound of every row is a branch-free vectorized pass; then one scalar pass over the rows that pass it.  Same rows, same order,
//   same violated list as lineenum9t (--novsep: the old loop).
      // lineenum9t: --sibk K keeps the last K LP-kill duals of each depth (from siblings and cousins) and tries them (certB, valid for any
//   dual Y >= 0) before solving a node's LP; --sibseed adds the latest kill dual's rows to the LP's first working set.
      // lineenum9x: --sepskip FILE lists rows (dominated by a row one dimension up) left out of LP separation; they stay in every other check.
// lineenum9: lineenum7 with 256-label masks (N <= 255, for point quotients).
// lineenum7: activities by value classes of x (bit planes): a(r) = sum_i v_i |U_r n X_i|; falls back to the incidence
      // sweep when x has more than 8 distinct positive values
      { double vals[8]; M128 vm[8]; int k=0; bool okv=true; M128 supp=M128{}; double sx=0;
        for(int j=0;j<nc&&okv;j++){ double x=plX[j]; if(x<=1e-9) continue; int l=labOf[j]; sx+=x; int i=0; while(i<k && std::fabs(vals[i]-x)>1e-9) i++;
          if(i==k){ if(k==8){ okv=false; break; } vals[k]=x; vm[k]=M128{}; k++; } SET(vm[i],l); SET(supp,l); }
        if(SEPMODE==1){ okv=false; double xl[256]; for(int l=0;l<N;l++) xl[l]=0; supp=M128{}; sx=0;
          M128 sup2=M128{}, sup3=M128{};
          for(int j=0;j<nc;j++) if(plX[j]>1e-9){ int l=labOf[j]; xl[l]=plX[j]; SET(supp,l); sx+=plX[j]; if(plX[j]>1+1e-9) SET(sup2,l); if(plX[j]>2+1e-9) SET(sup3,l); }
          const int NRW=(int)rows.size(); const double thr=sx-1e-7;
          if(VSEP && SIDID && RBMOK && thr>-1 && thr<31){   // lenum (le7): rows 64 at a time from the label bitmaps.  A row reaches the
            // original tests (pc > b, then a > b+1e-7 with a summed in label order) iff it is not in W, b < Tc = ceil(thr) (<= 31), and
            // bq8 < S, where S = min(255, sum of q_l = ceil(8 x_l) over the row's support labels) (saturating byte adds are
            // order-free) and bq8 = 8b for b <= 31, 255 otherwise.  Exact prefilter: a > b+1e-7 implies true sum > b (label-order
            // rounding < 1.1e-11), so sum q_l > 8b; with b < Tc <= 31, 8b <= 240 and S > bq8.  As min(S, 8Tc) > bq8 this also
            // encodes b < Tc (rows with b >= 32 have bq8 = 255).  inW rows get S = 0.  If some b < 0 the le4 pass runs instead.
            int nl=0; int labs[256]; bool qok=true; const int Tc=(int)std::ceil(thr);
            FORBITS(supp,l_,{ double xv=xl[l_]; if(!(xv<=31.0)) qok=false; else labs[nl++]=l_; })
            if(bqState==0){ bqState=1; alignas(64) uint8_t lut[64]; for(int k=0;k<64;k++) lut[k]=(uint8_t)(k<=31?8*k:255);
              const __m512i LUT=_mm512_load_si512((const void*)lut), C63=_mm512_set1_epi8(63); const uint8_t* sc=SCAP.data(); const uint8_t* cn=cnt.data();
              __mmask64 ng=0; uint8_t* bq=sepB.data();
              for(int w=0;w<NWR;w++){ const __m512i scv=_mm512_loadu_si512(sc+64*w), cnv=_mm512_loadu_si512(cn+64*w);
                ng|=_mm512_cmpgt_epu8_mask(cnv,scv); _mm512_store_si512((void*)(bq+64*w),_mm512_permutexvar_epi8(_mm512_min_epu8(_mm512_sub_epi8(scv,cnv),C63),LUT)); }
              if(ng) bqState=2; }
            if(qok && Tc>=0 && bqState==1){
              __m512i* S=(__m512i*)sepS.data(); const __m512i* BQ=(const __m512i*)sepB.data();
              if(nl==0) for(int w=0;w<NWR;w++) S[w]=_mm512_setzero_si512();
              else { const u64* r0=RBI+(size_t)labs[0]*NWR; const __m512i q0=_mm512_set1_epi8((char)(uint8_t)std::ceil(xl[labs[0]]*8.0));
                for(int w=0;w<NWR;w++) S[w]=_mm512_maskz_mov_epi8((__mmask64)r0[w],q0);
                int t=1;
                for(; t+1<nl; t+=2){ const u64* ra=RBI+(size_t)labs[t]*NWR; const u64* rb=RBI+(size_t)labs[t+1]*NWR;
                  const __m512i qa=_mm512_set1_epi8((char)(uint8_t)std::ceil(xl[labs[t]]*8.0)), qb=_mm512_set1_epi8((char)(uint8_t)std::ceil(xl[labs[t+1]]*8.0));
                  for(int w=0;w<NWR;w++){ __m512i x=S[w]; x=_mm512_mask_adds_epu8(x,(__mmask64)ra[w],x,qa); x=_mm512_mask_adds_epu8(x,(__mmask64)rb[w],x,qb); S[w]=x; } }
                if(t<nl){ const u64* ra=RBI+(size_t)labs[t]*NWR; const __m512i qa=_mm512_set1_epi8((char)(uint8_t)std::ceil(xl[labs[t]]*8.0));
                  for(int w=0;w<NWR;w++){ __m512i x=S[w]; S[w]=_mm512_mask_adds_epu8(x,(__mmask64)ra[w],x,qa); } } }
              { uint8_t* sb=sepS.data(); for(int r:Wr) sb[r]=0; }
              const uint8_t* sc=SCAP.data(); const uint8_t* cn=cnt.data();
              const bool s23=NZ(sup2)||NZ(sup3); const int NS=(int)SID.size(); const __m512i T8=_mm512_set1_epi8((char)(uint8_t)(8*Tc));
              auto full=[&](int r){ int b=(int)sc[r]-(int)cn[r]; const M128& rm=rows[r].mask;
                int pcs=PC(AND(rm,supp)); if(s23) pcs+=PC(AND(rm,sup2))+PC(AND(rm,sup3));
                if(pcs<=b) return;
                M128 ms=AND(rm,supp); double a=0; FORBITS(ms,l_,a+=xl[l_])
                if(a>b+1e-7) viol.push_back({a-b,r}); };
              for(int w=0;w<NWR;w++){
                u64 c=(u64)_mm512_cmpgt_epu8_mask(_mm512_min_epu8(S[w],T8),BQ[w]);
                if(!c) continue;
                if(NS-64*w<64) c&=(1ULL<<(NS-64*w))-1;
                while(c){ int r=64*w+__builtin_ctzll(c); c&=c-1; full(r); } }
              goto sepdone; } }
          if(VSEP && SIDID){   // lenum: one AVX-512 pass over the rows (SID is the identity), 8 rows at a time.  A row reaches the exact
            // test (a > b+1e-7, a summed in label order as before) iff it passes the original popcount bound pc > b and three filters
            // implied by the original candidate tests: !inW[r]; b < ceil(thr) (same as !(b >= thr) for an integer b); and the
            // q-plane bound sum_{l in row & supp} q_l > 16 b with q_l = ceil(16 x_l) (exact: 16 x_l is exact; the label-order sum a is
            // within 1.2e-11 of the true sum, so a > b+1e-7 implies true sum > b, hence sum q_l/16 > b).  Same rows, same order.
            const int NS=(int)SID.size(); const u64 *a0=SW[0].data(), *a1=SW[1].data(), *a2=SW[2].data(), *a3=SW[3].data();
            const uint8_t* sc=SCAP.data(); const uint8_t* cn=cnt.data(); const uint8_t* iw=(const uint8_t*)inW.data(); const bool s23=NZ(sup2)||NZ(sup3);
            const long long Tc=(long long)std::ceil(thr);
            int np=0; bool qok=true; M128 QP[16];
            { int ql[256]; int qm=0; FORBITS(supp,l_,{ double xv=xl[l_]; if(!(xv<=1e3)){ qok=false; } else { int q=(int)std::ceil(xv*16.0); ql[l_]=q; if(q>qm) qm=q; } })
              if(qok){ while((1<<np)<=qm) np++; for(int t=0;t<np;t++) QP[t]=M128{}; FORBITS(supp,l_,{ int q=ql[l_]; for(int t=0;t<np;t++) if(q>>t&1) SET(QP[t],l_); }) } }
            auto exact=[&](int r){ int b=(int)sc[r]-(int)cn[r]; M128 ms=AND(rows[r].mask,supp);
              double a=0; FORBITS(ms,l_,a+=xl[l_])
              if(a>b+1e-7) viol.push_back({a-b,r}); };
            const __m512i v0=_mm512_set1_epi64((long long)supp.w[0]), v1=_mm512_set1_epi64((long long)supp.w[1]), v2=_mm512_set1_epi64((long long)supp.w[2]), v3=_mm512_set1_epi64((long long)supp.w[3]);
            const __m512i w0=_mm512_set1_epi64((long long)sup2.w[0]), w1=_mm512_set1_epi64((long long)sup2.w[1]), w2=_mm512_set1_epi64((long long)sup2.w[2]), w3=_mm512_set1_epi64((long long)sup2.w[3]);
            const __m512i x0=_mm512_set1_epi64((long long)sup3.w[0]), x1=_mm512_set1_epi64((long long)sup3.w[1]), x2=_mm512_set1_epi64((long long)sup3.w[2]), x3=_mm512_set1_epi64((long long)sup3.w[3]);
            const __m512i Tv=_mm512_set1_epi64(Tc);
            __m512i Q0[16], Q1[16], Q2[16], Q3[16];
            for(int t=0;t<np;t++){ Q0[t]=_mm512_set1_epi64((long long)QP[t].w[0]); Q1[t]=_mm512_set1_epi64((long long)QP[t].w[1]); Q2[t]=_mm512_set1_epi64((long long)QP[t].w[2]); Q3[t]=_mm512_set1_epi64((long long)QP[t].w[3]); }
            #define PCA(A,V) _mm512_popcnt_epi64(_mm512_and_si512(A,V))
            int i=0;
            if(N<=128){   // words 2 and 3 of every mask are zero
              for(; i+8<=NS; i+=8){
                const __m512i A0=_mm512_loadu_si512(a0+i), A1=_mm512_loadu_si512(a1+i);
                __m512i p=_mm512_add_epi64(PCA(A0,v0),PCA(A1,v1));
                if(s23) p=_mm512_add_epi64(p,_mm512_add_epi64(_mm512_add_epi64(PCA(A0,w0),PCA(A1,w1)),_mm512_add_epi64(PCA(A0,x0),PCA(A1,x1))));
                const __m512i bv=_mm512_sub_epi64(_mm512_cvtepu8_epi64(_mm_loadl_epi64((const __m128i*)(sc+i))),_mm512_cvtepu8_epi64(_mm_loadl_epi64((const __m128i*)(cn+i))));
                unsigned m=(unsigned)(_mm512_cmpgt_epi64_mask(p,bv)&_mm512_cmplt_epi64_mask(bv,Tv));
                if(!m) continue;
                m&=(unsigned)_mm_testn_epi8_mask(_mm_loadl_epi64((const __m128i*)(iw+i)),_mm_loadl_epi64((const __m128i*)(iw+i)));
                if(m && qok){ __m512i qs=_mm512_setzero_si512();
                  for(int t=np-1;t>=0;t--) qs=_mm512_add_epi64(_mm512_add_epi64(qs,qs),_mm512_add_epi64(PCA(A0,Q0[t]),PCA(A1,Q1[t])));
                  m&=(unsigned)_mm512_cmpgt_epi64_mask(qs,_mm512_slli_epi64(bv,4)); }
                while(m){ int k=__builtin_ctz(m); m&=m-1; exact(i+k); } } }
            for(; i+8<=NS; i+=8){
              const __m512i A0=_mm512_loadu_si512(a0+i), A1=_mm512_loadu_si512(a1+i), A2=_mm512_loadu_si512(a2+i), A3=_mm512_loadu_si512(a3+i);
              __m512i p=_mm512_add_epi64(_mm512_add_epi64(PCA(A0,v0),PCA(A1,v1)),_mm512_add_epi64(PCA(A2,v2),PCA(A3,v3)));
              if(s23){ p=_mm512_add_epi64(p,_mm512_add_epi64(_mm512_add_epi64(PCA(A0,w0),PCA(A1,w1)),_mm512_add_epi64(PCA(A2,w2),PCA(A3,w3))));
                       p=_mm512_add_epi64(p,_mm512_add_epi64(_mm512_add_epi64(PCA(A0,x0),PCA(A1,x1)),_mm512_add_epi64(PCA(A2,x2),PCA(A3,x3)))); }
              const __m512i bv=_mm512_sub_epi64(_mm512_cvtepu8_epi64(_mm_loadl_epi64((const __m128i*)(sc+i))),_mm512_cvtepu8_epi64(_mm_loadl_epi64((const __m128i*)(cn+i))));
              unsigned m=(unsigned)(_mm512_cmpgt_epi64_mask(p,bv)&_mm512_cmplt_epi64_mask(bv,Tv));
              if(!m) continue;
              m&=(unsigned)_mm_testn_epi8_mask(_mm_loadl_epi64((const __m128i*)(iw+i)),_mm_loadl_epi64((const __m128i*)(iw+i)));
              if(m && qok){ __m512i qs=_mm512_setzero_si512();
                for(int t=np-1;t>=0;t--) qs=_mm512_add_epi64(_mm512_add_epi64(qs,qs),_mm512_add_epi64(_mm512_add_epi64(PCA(A0,Q0[t]),PCA(A1,Q1[t])),_mm512_add_epi64(PCA(A2,Q2[t]),PCA(A3,Q3[t]))));
                m&=(unsigned)_mm512_cmpgt_epi64_mask(qs,_mm512_slli_epi64(bv,4)); }
              while(m){ int k=__builtin_ctz(m); m&=m-1; exact(i+k); } }
            #undef PCA
            for(; i<NS; i++){ int pcs=__builtin_popcountll(a0[i]&supp.w[0])+__builtin_popcountll(a1[i]&supp.w[1])+__builtin_popcountll(a2[i]&supp.w[2])+__builtin_popcountll(a3[i]&supp.w[3]);
              if(s23) pcs+=__builtin_popcountll(a0[i]&sup2.w[0])+__builtin_popcountll(a1[i]&sup2.w[1])+__builtin_popcountll(a2[i]&sup2.w[2])+__builtin_popcountll(a3[i]&sup2.w[3])
                          +__builtin_popcountll(a0[i]&sup3.w[0])+__builtin_popcountll(a1[i]&sup3.w[1])+__builtin_popcountll(a2[i]&sup3.w[2])+__builtin_popcountll(a3[i]&sup3.w[3]);
              int b=(int)sc[i]-(int)cn[i]; if(pcs>b && !inW[i] && b<Tc) exact(i); }
            goto sepdone; }
          if(VSEP){ const int NS=(int)SID.size(); uint16_t* pc=pcb.data();
            { const u64 *a0=SW[0].data(), *a1=SW[1].data(), *a2=SW[2].data(), *a3=SW[3].data(); const u64 s0=supp.w[0], s1=supp.w[1], s2=supp.w[2], s3=supp.w[3];
              for(int i=0;i<NS;i++) pc[i]=(uint16_t)(__builtin_popcountll(a0[i]&s0)+__builtin_popcountll(a1[i]&s1)+__builtin_popcountll(a2[i]&s2)+__builtin_popcountll(a3[i]&s3)); }
            for(const M128* sp:{&sup2,&sup3}) if(NZ(*sp)){ const u64 *a0=SW[0].data(), *a1=SW[1].data(), *a2=SW[2].data(), *a3=SW[3].data(); const u64 s0=sp->w[0], s1=sp->w[1], s2=sp->w[2], s3=sp->w[3];
              for(int i=0;i<NS;i++) pc[i]+=(uint16_t)(__builtin_popcountll(a0[i]&s0)+__builtin_popcountll(a1[i]&s1)+__builtin_popcountll(a2[i]&s2)+__builtin_popcountll(a3[i]&s3)); }
            const uint32_t* sid=SID.data(); const uint8_t* sc=SCAP.data(); const uint8_t* cn=cnt.data();
            for(int i=0;i<NS;i++){ int r=sid[i]; int b=(int)sc[i]-(int)cn[r]; if((int)pc[i]<=b) continue;   // sum of x over the row is at most pc
              if(inW[r] || b>=thr) continue; M128 ms=AND(rows[r].mask,supp);
              double a=0; FORBITS(ms,l_,a+=xl[l_])
              if(a>b+1e-7) viol.push_back({a-b,r}); }
            goto sepdone; }
          for(int r=0;r<NRW;r++){ if(inW[r] || SEPSKIP[r]) continue; int b=bres(r); if(capv[r]==255 || b>=thr) continue; M128 ms=AND(rows[r].mask,supp);
            if(PC(ms)+PC(AND(ms,sup2))+PC(AND(ms,sup3))<=b) continue;   // sum of x over the row is at most this count
            double a=0; FORBITS(ms,l_,a+=xl[l_])
            if(a>b+1e-7) viol.push_back({a-b,r}); }
          goto sepdone; }
        if(okv){ const int NRW=(int)rows.size(); const double thr=sx-1e-7;
          for(int r=0;r<NRW;r++){ if(inW[r] || SEPSKIP[r]) continue; int b=bres(r); if(capv[r]==255 || b>=thr) continue; const M128& m=rows[r].mask;
            M128 ms=AND(m,supp); if(!NZ(ms)) continue; double a=0; for(int i=0;i<k;i++) a+=vals[i]*PC(AND(ms,vm[i]));
            if(a>b+1e-7) viol.push_back({a-b,r}); } }
        else {
          for(int j=0;j<nc;j++){ double x=plX[j]; if(x<=1e-9) continue; int l=labOf[j]; for(int p=incO[l];p<incO[l+1];p++) lact[incF[p]]+=x; }
          for(int j=0;j<nc;j++){ if(plX[j]<=1e-9) continue; int l=labOf[j];
            for(int p=incO[l];p<incO[l+1];p++){ int r=incF[p]; double a=lact[r]; if(a==0) continue; lact[r]=0;
              if(!inW[r] && !SEPSKIP[r] && a>bres(r)+1e-7) viol.push_back({a-bres(r),r}); } } } }
      sepdone:
      if(viol.empty()){ if(dvalid[d] && LPFIX){ int q=lpFix(pos,rem,fixed); if(q==-2) return 0; lreq=q; } return 0; }
      if((int)viol.size()>LPADD){ std::nth_element(viol.begin(),viol.begin()+LPADD,viol.end(),[](const std::pair<double,int>& x,const std::pair<double,int>& y){ return x.first>y.first; }); viol.resize(LPADD); }
      for(auto& v:viol){ inW[v.second]=1; Wr.push_back(v.second); } }
    return -1; }
  bool lpPrune(int pos){ int lreq; bool fixed; return lpPrune(pos,lreq,fixed); }
  bool lpPrune(int pos,int& lreq,bool& fixed){
    lreq=N; fixed=false;
    int rem=R-d; dvalid[d]=false; if(rem<=0) return false;
    M128 S1=AND(allowed,suf[pos]), S2=AND(r2,suf[pos]), S3=AND(r3,suf[pos]), S4=AND(r4,suf[pos]), S5=AND(r5,suf[pos]), S6=AND(r6,suf[pos]);
    if(d>0 && dvalid[d-1] && certB(dsup[d-1],dY[d-1],S1,S2,S3,S4,S5,S6,pos)<(long long)rem*SC){ lpReuse[d]++; c8('K'); cdual(dsup[d-1],dY[d-1]); return true; }
    for(int i=0;i<kN[d];i++){ int j=(kH[d]-1-i+SIBK)%SIBK; if(certB(kS[d][j],kY[d][j],S1,S2,S3,S4,S5,S6,pos)<(long long)rem*SC){ lpSib[d]++; c8('K'); cdual(kS[d][j],kY[d][j]); return true; } }
    int colOf[256], labOf[256], cuI[256]; double cu[256], cost[256], lo[256]; int nc=0;
    for(int l=0;l<N;l++){ colOf[l]=-1; if(l>=pos && TST(S1,l)){ colOf[l]=nc; labOf[nc]=l; cuI[nc]=1+TST(S2,l)+TST(S3,l)+TST(S4,l)+TST(S5,l)+TST(S6,l); cu[nc]=cuI[nc]; cost[nc]=1; lo[nc]=0; nc++; } }
    int tot=0; for(int j=0;j<nc;j++) tot+=cuI[j]; if(tot<rem){ c8('K'); cv(0); return true; }
    lpCalls[d]++;
    auto bres=[&](int r)->int{ return (int)capv[r]-(int)cnt[r]; };
    auto nonred=[&](int r)->bool{ if(capv[r]==255) return false; const M128& m=rows[r].mask; return bres(r) < PC(AND(m,S1))+PC(AND(m,S2))+PC(AND(m,S3))+PC(AND(m,S4))+PC(AND(m,S5))+PC(AND(m,S6)); };
    for(int r:Wr) inW[r]=0; Wr.clear();
    if(d>0) for(int r:dsup[d-1]) if(!inW[r] && nonred(r)){ inW[r]=1; Wr.push_back(r); }
    if(INHERIT && d>0) for(int r:WrD[d-1]){ if(INHMAX>0 && (int)Wr.size()>=INHMAX) break; if(!inW[r] && nonred(r)){ inW[r]=1; Wr.push_back(r); } }   // --inhmax K: inherit at most K rows (a path's working set can grow without bound)
    if(SIBSEED && kN[d]>0){ int j=(kH[d]-1+SIBK)%SIBK; for(uint32_t r:kS[d][j]) if(!inW[r] && nonred(r)){ inW[r]=1; Wr.push_back(r); } }
    if(USEPL){ int st=lpCustom(pos,rem,S1,S2,S3,S4,S5,S6,nc,colOf,labOf,cu,lreq,fixed); if(st==0) WrD[d]=Wr; if(st>=0) return st==1; plFallback++;
      for(int r:Wr) inW[r]=0; Wr.clear(); if(d>0) for(int r:dsup[d-1]) if(!inW[r] && nonred(r)){ inW[r]=1; Wr.push_back(r); } dvalid[d]=false; lreq=N; fixed=false; }
    double inf=Highs_getInfinity(hl);
    std::vector<double> rl, ru, av; std::vector<int> as, ai;
    auto rowsCSR=[&](const std::vector<int>& rs){ rl.clear(); ru.clear(); av.clear(); as.clear(); ai.clear();
      for(int r:rs){ as.push_back(ai.size()); rl.push_back(-inf); ru.push_back(bres(r)); M128 m=AND(rows[r].mask,S1);
        FORBITS(m,l_,{ ai.push_back(colOf[l_]); av.push_back(1.0); }) } };
    rowsCSR(Wr); as.push_back(ai.size()); ai.push_back(0); av.push_back(0.0); rl.push_back(0); ru.push_back(0); // keep the arrays non-empty
    if(Highs_passLp(hl,nc,(int)Wr.size(),(int)ai.size()-1,2,-1,0.0,cost,lo,cu,rl.data(),ru.data(),as.data(),ai.data(),av.data())<0){ lpFails++; return false; }
    std::vector<double> xv(nc), cd(nc), rv, rd; std::vector<std::pair<double,int>> viol; std::vector<int> addr;
    for(int round=0; round<200; round++){
      lpRounds++;
      if(Highs_run(hl)<0 || Highs_getModelStatus(hl)!=7){ lpFails++; return false; }
      double obj=Highs_getObjectiveValue(hl); size_t nw=Wr.size(); rv.resize(nw); rd.resize(nw);
      Highs_getSolution(hl,xv.data(),cd.data(),rv.data(),rd.data());
      // integer dual Y = floor(SC*dual) on the rows with positive dual (any Y >= 0 gives a valid bound)
      dsup[d].clear(); dY[d].clear(); bool big=false;
      for(size_t i=0;i<nw;i++){ if(!(rd[i]>0)) continue; double yd=rd[i]*(double)SC; if(!(yd<YBIG)){ big=true; continue; }
        long long Y=(long long)floor(yd); if(Y>0){ dsup[d].push_back(Wr[i]); dY[d].push_back(Y); } }
      dvalid[d]=(!big && dsup[d].size()<=DMAX);
      if(obj<rem-1e-7){ // exact certificate
        if(!big && certB(dsup[d],dY[d],S1,S2,S3,S4,S5,S6,pos)<(long long)rem*SC && fitD(dsup[d],dY[d],S1,S2,S3,S4,S5,S6,pos,(long long)rem*SC)){ lpKills[d]++; c8('K'); cdual(dsup[d],dY[d]); sibRec(); return true; }
        lpFails++; return false; }
      // separation: activities of all tracked rows at the current optimum
      viol.clear();
      for(int j=0;j<nc;j++){ double x=xv[j]; if(x<=1e-9) continue; int l=labOf[j]; for(int p=incO[l];p<incO[l+1];p++) lact[incF[p]]+=x; }
      for(int j=0;j<nc;j++){ if(xv[j]<=1e-9) continue; int l=labOf[j];
        for(int p=incO[l];p<incO[l+1];p++){ int r=incF[p]; double a=lact[r]; if(a==0) continue; lact[r]=0;
          if(!inW[r] && a>bres(r)+1e-7) viol.push_back({a-bres(r),r}); } }
      if(viol.empty()){ if(dvalid[d] && LPFIX){ int q=lpFix(pos,rem,fixed); if(q==-2) return false; lreq=q; } return false; }
      if((int)viol.size()>LPADD){ std::nth_element(viol.begin(),viol.begin()+LPADD,viol.end(),[](const std::pair<double,int>& x,const std::pair<double,int>& y){ return x.first>y.first; }); viol.resize(LPADD); }
      addr.clear(); for(auto& v:viol){ inW[v.second]=1; Wr.push_back(v.second); addr.push_back(v.second); }
      rowsCSR(addr);
      if(Highs_addRows(hl,(int)addr.size(),rl.data(),ru.data(),(int)ai.size(),as.data(),ai.data(),av.data())<0){ lpFails++; return false; } }
    lpFails++; return false; }
  // canonicity of seq+[l] (orderly generation); called before add
  inline bool canonAdd(int l){
    if(d<32){   // lenum: the merged image M (x = G[g][l] inserted after the entries of I below it) against S = seq[0..d-1],l: the
      // first index where they differ decides (M smaller: not canonical), as in the loop below
      alignas(64) int sq[48]; for(int j=0;j<d;j++) sq[j]=seq[j]; sq[d]=l;
      const __m512i iota=_mm512_setr_epi32(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15), D=_mm512_set1_epi32(d);
      const __m512i S0=_mm512_load_si512(sq), S1=_mm512_load_si512(sq+16), K1=_mm512_add_epi32(iota,_mm512_set1_epi32(16));
      const __mmask16 v0=_mm512_cmplt_epi32_mask(iota,D), v1=_mm512_cmplt_epi32_mask(K1,D);        // entries of I (k < d)
      const __mmask16 c0=_mm512_cmple_epi32_mask(iota,D), c1=_mm512_cmple_epi32_mask(K1,D);        // compared entries (k <= d)
      const bool two=d>=16;
      for(int g=1;g<ng;g++){ const int* I=img(d,g); const int x=G[g][l]; const __m512i X=_mm512_set1_epi32(x);
        const __m512i I0=_mm512_loadu_si512(I), I1=two?_mm512_loadu_si512(I+16):_mm512_setzero_si512();
        const int pos=__builtin_popcount((unsigned)_mm512_mask_cmplt_epi32_mask(v0,I0,X))+(two?__builtin_popcount((unsigned)_mm512_mask_cmplt_epi32_mask(v1,I1,X)):0);
        const __m512i P=_mm512_set1_epi32(pos);
        const __m512i H0=_mm512_alignr_epi32(I0,I0,15), H1=_mm512_alignr_epi32(I1,I0,15);           // entry k-1
        __m512i M0=_mm512_mask_blend_epi32(_mm512_cmplt_epi32_mask(iota,P),H0,I0); M0=_mm512_mask_mov_epi32(M0,_mm512_cmpeq_epi32_mask(iota,P),X);
        __mmask16 n0=_mm512_mask_cmpneq_epi32_mask(c0,M0,S0);
        if(n0){ const int k=__builtin_ctz((unsigned)n0); if(_mm512_mask_cmplt_epi32_mask((__mmask16)(1u<<k),M0,S0)) return false; continue; }
        if(d>=15){ __m512i M1=_mm512_mask_blend_epi32(_mm512_cmplt_epi32_mask(K1,P),H1,I1); M1=_mm512_mask_mov_epi32(M1,_mm512_cmpeq_epi32_mask(K1,P),X);
          __mmask16 n1=_mm512_mask_cmpneq_epi32_mask(c1,M1,S1);
          if(n1){ const int k=__builtin_ctz((unsigned)n1); if(_mm512_mask_cmplt_epi32_mask((__mmask16)(1u<<k),M1,S1)) return false; } } }
      return true; }
    for(int g=1;g<ng;g++){ const int* I=img(d,g); int x=G[g][l]; int i=0; bool xu=false;
      for(int j=0;j<=d;j++){ int mj; if(!xu && (i>=d || x<=I[i])){ mj=x; xu=true; } else mj=I[i++]; int sj=(j<d)?seq[j]:l;
        if(mj<sj) return false; if(mj>sj) break; } }
    return true; }
  inline void add(int l){ stA[d]=allowed; st2[d]=r2; st3[d]=r3; st4[d]=r4; st5[d]=r5; st6[d]=r6;
    if(d<64){   // lenum: J = I with x inserted after the entries < x (I sorted, length d < 64; img slots hold 64 ints)
      const int nv=(d+16)>>4; const __m512i iota=_mm512_setr_epi32(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
      for(int g=1;g<ng;g++){ const int* I=img(d,g); int* J=img(d+1,g); const int x=G[g][l]; const __m512i X=_mm512_set1_epi32(x);
        __m512i iv[4]; int pos=0;
        for(int v=0;v<nv;v++){ iv[v]=_mm512_loadu_si512(I+16*v); const __mmask16 val=_mm512_cmplt_epi32_mask(_mm512_add_epi32(iota,_mm512_set1_epi32(16*v)),_mm512_set1_epi32(d));
          pos+=__builtin_popcount((unsigned)(_mm512_mask_cmplt_epi32_mask(val,iv[v],X))); }
        for(int v=0;v<nv;v++) _mm512_storeu_si512(J+16*v,iv[v]);
        for(int v=0;v<nv;v++){ const __m512i k=_mm512_add_epi32(iota,_mm512_set1_epi32(16*v));
          _mm512_mask_storeu_epi32(J+16*v+1,_mm512_cmpge_epi32_mask(k,_mm512_set1_epi32(pos))&_mm512_cmplt_epi32_mask(k,_mm512_set1_epi32(d)),iv[v]); }
        J[pos]=x; } }
    else for(int g=1;g<ng;g++){ const int* I=img(d,g); int* J=img(d+1,g); int x=G[g][l]; int i=0,j=0; while(i<d && I[i]<x) J[j++]=I[i++]; J[j++]=x; while(i<d) J[j++]=I[i++]; }
    mult[l]++; seq[d++]=l; int res=ub[l]-mult[l];
    if(res<=0) CLR(allowed,l); if(res<2) CLR(r2,l); if(res<3) CLR(r3,l); if(res<4) CLR(r4,l); if(res<5) CLR(r5,l); if(res<6) CLR(r6,l);
    if(DENSE){   // lenum: the same increments as the incidence loop (byte arithmetic wraps like uint8_t), 64 rows per step; the rows
      // that reach their cap remove their labels from allowed (order-free)
      const u64* rb=RBI+(size_t)l*NWR; uint8_t* c=cnt.data(); const uint8_t* cp=CAPP.data(); const __m512i one=_mm512_set1_epi8(1);
      for(int w=0;w<NWR;w++){ const __mmask64 bits=(__mmask64)rb[w]; if(!bits) continue;
        const __m512i cv=_mm512_mask_add_epi8(_mm512_loadu_si512(c+64*w),bits,_mm512_loadu_si512(c+64*w),one); _mm512_storeu_si512(c+64*w,cv);
        __mmask64 hit=_mm512_mask_cmpeq_epi8_mask(bits,cv,_mm512_loadu_si512(cp+64*w));
        while(hit){ int r=64*w+__builtin_ctzll(hit); hit&=hit-1; allowed=ANDN(allowed,rows[r].mask); } } }
    else { const uint32_t* p=&incF[incO[l]]; const uint32_t* e=&incF[incO[l+1]];
    for(;p<e;p++){ int r=*p; if(++cnt[r]==capv[r]) allowed=ANDN(allowed,rows[r].mask); } }
    r2=AND(r2,allowed); r3=AND(r3,allowed); r4=AND(r4,allowed); r5=AND(r5,allowed); r6=AND(r6,allowed); }
  inline void undo(int l){ if(DENSE){ const u64* rb=RBI+(size_t)l*NWR; uint8_t* c=cnt.data(); const __m512i one=_mm512_set1_epi8(1);
      for(int w=0;w<NWR;w++){ const __mmask64 bits=(__mmask64)rb[w]; if(!bits) continue; const __m512i cv=_mm512_loadu_si512(c+64*w); _mm512_storeu_si512(c+64*w,_mm512_mask_sub_epi8(cv,bits,cv,one)); } }
    else { const uint32_t* p=&incF[incO[l]]; const uint32_t* e=&incF[incO[l+1]]; for(;p<e;p++) cnt[*p]--; }
    mult[l]--; d--; allowed=stA[d]; r2=st2[d]; r3=st3[d]; r4=st4[d]; r5=st5[d]; r6=st6[d]; }
  // Slack bookkeeping.  At a node, prep() computes lmax and, for every active row r, a lower bound s_r on
  // W_r(l)-need_r valid for every candidate l<=lmax (W_r(l) = residual weight of allowed labels >=l outside r).
  // Adding a candidate l can break row r only if the saturation removals sigma it causes (weight of labels >=l
  // removed, besides l's own unit) exceed the row's slack, so post() checks only rows with s_r < sigma.
  static const int SMAX=48;
  std::vector<uint32_t> srow[64]; std::vector<u64> sW0[64], sW1[64]; std::vector<uint8_t> sC[64]; int sstart[64][SMAX+2]; int hint[64][4]={{0}}; int nh[64]={0};
  std::vector<uint32_t> tmpR; std::vector<uint8_t> tmpS;
  inline int wsuf(int l) const { M128 A=AND(allowed,suf[l]); return PC(A)+PC(AND(r2,suf[l]))+PC(AND(r3,suf[l]))+PC(AND(r4,suf[l]))+PC(AND(r5,suf[l]))+PC(AND(r6,suf[l])); }
  // after add(l) (wb = wsuf(l) before the add): can the remaining slots still be filled from allowed labels >= l?
  inline bool post(int l,int wb){ int rem=R-d; if(rem==0) return true;
    M128 A=AND(allowed,suf[l]), A2=AND(r2,suf[l]), A3=AND(r3,suf[l]), A4=AND(r4,suf[l]), A5=AND(r5,suf[l]), A6=AND(r6,suf[l]);
    int wa=PC(A)+PC(A2)+PC(A3)+PC(A4)+PC(A5)+PC(A6); int sigma=wb-wa-1; if(sigma<=0) return true;
    if(wa<rem){ postRow=-1; return false; }
    int pd=d-1; int e=sigma>SMAX+1?(int)srow[pd].size():sstart[pd][sigma];
    const uint32_t* rr=srow[pd].data(); WL wl; if(e>0) wl.build(A,A2,A3,A4,A5,A6);
    if(N<=128 && e>0){   // lenum: rows 8 at a time from the buckets' mask words and caps; the first row (in bucket order) with
      // need > 0 and w < need fails, as in the loop below
      __m512i WV[24]; int WQ[24]; const int wn=wl.n; for(int t=0;t<wn;t++){ WV[t]=_mm512_set1_epi64((long long)wl.v[t]); WQ[t]=wl.q[t]; }
      const u64* S0=sW0[pd].data(); const u64* S1=sW1[pd].data(); const uint8_t* SCp=sC[pd].data(); const int* cn32=(const int*)cnt.data();
      const __m256i REM=_mm256_set1_epi32(rem), B255=_mm256_set1_epi32(255), Z=_mm256_setzero_si256();
      for(int i=0;i<e;i+=8){
        const int ln=std::min(8,e-i); const __mmask8 lm=(__mmask8)((1u<<ln)-1);
        const __m256i idx=_mm256_maskz_loadu_epi32(lm,rr+i);
        const __m256i cap=_mm256_cvtepu8_epi32(_mm_maskz_loadu_epi8((__mmask16)lm,SCp+i));
        const __m256i cv=_mm256_and_si256(_mm256_mmask_i32gather_epi32(Z,lm,idx,cn32,1),B255);
        const __m256i need=_mm256_add_epi32(_mm256_sub_epi32(REM,cap),cv);
        const __mmask8 act=_mm256_mask_cmpgt_epi32_mask(lm,need,Z);
        if(!act) continue;
        const __m512i W0=_mm512_maskz_loadu_epi64(lm,S0+i), W1=_mm512_maskz_loadu_epi64(lm,S1+i);
        __m512i acc=_mm512_setzero_si512();
        for(int t=0;t<wn;t++) acc=_mm512_add_epi64(acc,_mm512_popcnt_epi64(_mm512_andnot_si512(WQ[t]?W1:W0,WV[t])));
        const __mmask8 bad=_mm256_mask_cmplt_epi32_mask(act,_mm512_cvtepi64_epi32(acc),need);
        if(bad){ postRow=(int)rr[i+__builtin_ctz((unsigned)bad)]; return false; } }
      return true; }
    for(int i=0;i<e;i++){ int r=rr[i]; int need=rem-capv[r]+cnt[r]; if(need<=0) continue; const M128& m=rows[r].mask;
      if(wl.w(m)<need){ postRow=r; return false; } }
    return true; }
  // at a node: build act[d], the largest candidate label worth trying, and the slack buckets
  inline int prep(int pos){ return N<=128 ? prepF(pos) : prep0(pos); }
  inline int prep0(int pos){ int rem=R-d;
    if(d>0){ act[d].clear(); for(int r:act[d-1]) if(rem-capv[r]+cnt[r]>=1) act[d].push_back(r); }
    M128 A=AND(allowed,suf[pos]), A2=AND(r2,suf[pos]), A3=AND(r3,suf[pos]), A4=AND(r4,suf[pos]), A5=AND(r5,suf[pos]), A6=AND(r6,suf[pos]);
    int lmax=topk(A,A2,A3,A4,A5,A6,rem); prepRow=-1; if(lmax<pos) return -1;
    M128 L1=AND(A,suf[lmax]), L2=AND(A2,suf[lmax]), L3=AND(A3,suf[lmax]), L4=AND(A4,suf[lmax]), L5=AND(A5,suf[lmax]), L6=AND(A6,suf[lmax]);
    WL wl; wl.build(L1,L2,L3,L4,L5,L6);
    auto bind=[&](int r)->bool{ int need=rem-capv[r]+cnt[r]; const M128& m=rows[r].mask;
      int w=wl.w(m); if(w>=need) return false;
      lmax=topk(ANDN(A,m),ANDN(A2,m),ANDN(A3,m),ANDN(A4,m),ANDN(A5,m),ANDN(A6,m),need); prepRow=r; if(lmax>=pos){ L1=AND(A,suf[lmax]); L2=AND(A2,suf[lmax]); L3=AND(A3,suf[lmax]); L4=AND(A4,suf[lmax]); L5=AND(A5,suf[lmax]); L6=AND(A6,suf[lmax]); wl.build(L1,L2,L3,L4,L5,L6); }
      return true; };
    for(int i=0;i<nh[d];i++){ int r=hint[d][i]; if(rem-capv[r]+cnt[r]>=1){ bind(r); if(lmax<pos) return -1; } }
    size_t na=act[d].size(); tmpR.resize(na); tmpS.resize(na); int hc[SMAX+2]; memset(hc,0,sizeof hc);
    for(size_t i=0;i<na;i++){ int r=act[d][i]; int need=rem-capv[r]+cnt[r]; const M128& m=rows[r].mask;
      int w=wl.w(m);
      if(w<need){ lmax=topk(ANDN(A,m),ANDN(A2,m),ANDN(A3,m),ANDN(A4,m),ANDN(A5,m),ANDN(A6,m),need); prepRow=r; if(lmax<pos) return -1;
        L1=AND(A,suf[lmax]); L2=AND(A2,suf[lmax]); L3=AND(A3,suf[lmax]); L4=AND(A4,suf[lmax]); L5=AND(A5,suf[lmax]); L6=AND(A6,suf[lmax]); wl.build(L1,L2,L3,L4,L5,L6); w=wl.w(m);
        hint[d][nh[d]<4?nh[d]++:(int)(visited&3)]=r; }
      int s=w-need; if(s>SMAX) s=SMAX+1; tmpR[i]=r; tmpS[i]=s; hc[s]++; }
    // counting sort by slack bound (bounds taken at a larger lmax stay valid: W_r only grows as l decreases)
    srow[d].resize(na); int acc=0; for(int s=0;s<=SMAX+1;s++){ sstart[d][s]=acc; acc+=hc[s]; } sstart[d][SMAX+1]=acc-hc[SMAX+1];
    int fill[SMAX+2]; for(int s=0;s<=SMAX+1;s++) fill[s]=sstart[d][s]; fill[SMAX+1]=acc-hc[SMAX+1];
    for(size_t i=0;i<na;i++) srow[d][fill[tmpS[i]]++]=tmpR[i];
    return lmax; }
  // lenum: prep for N <= 128.  The same computation as prep0 with the filter of act[d-1] and the slack loop fused: 8 rows at a time
  // (need from the gathered counts, w from the rows' mask words carried in the lists); a group in which some kept row has w < need
  // runs prep0's row-by-row code (bind, hint, new wl for the rows after it).  Rows enter aR[d] and the slack buckets in the same
  // order as act[d]/tmpR.  The filter of rows after a -1 return is skipped (prep0 builds act[d] first): no child reads it then.
  inline int prepF(int pos){ int rem=R-d;
    M128 A=AND(allowed,suf[pos]), A2=AND(r2,suf[pos]), A3=AND(r3,suf[pos]), A4=AND(r4,suf[pos]), A5=AND(r5,suf[pos]), A6=AND(r6,suf[pos]);
    int lmax=topk(A,A2,A3,A4,A5,A6,rem); prepRow=-1; if(lmax<pos) return -1;
    M128 L1=AND(A,suf[lmax]), L2=AND(A2,suf[lmax]), L3=AND(A3,suf[lmax]), L4=AND(A4,suf[lmax]), L5=AND(A5,suf[lmax]), L6=AND(A6,suf[lmax]);
    WL wl; wl.build(L1,L2,L3,L4,L5,L6);
    auto bind=[&](int r)->bool{ int need=rem-capv[r]+cnt[r]; const M128& m=rows[r].mask;
      int w=wl.w(m); if(w>=need) return false;
      lmax=topk(ANDN(A,m),ANDN(A2,m),ANDN(A3,m),ANDN(A4,m),ANDN(A5,m),ANDN(A6,m),need); prepRow=r; if(lmax>=pos){ L1=AND(A,suf[lmax]); L2=AND(A2,suf[lmax]); L3=AND(A3,suf[lmax]); L4=AND(A4,suf[lmax]); L5=AND(A5,suf[lmax]); L6=AND(A6,suf[lmax]); wl.build(L1,L2,L3,L4,L5,L6); }
      return true; };
    for(int i=0;i<nh[d];i++){ int r=hint[d][i]; if(rem-capv[r]+cnt[r]>=1){ bind(r); if(lmax<pos) return -1; } }
    const int pd=d>0?d-1:0; const size_t np_=aR[pd].size();
    const uint32_t* PR=aR[pd].data(); const u64* P0=aW0[pd].data(); const u64* P1=aW1[pd].data(); const uint8_t* PCp=aC[pd].data();
    uint32_t* OR=nullptr; u64* O0=nullptr; u64* O1=nullptr; uint8_t* OC=nullptr;
    if(d>0){ aR[d].resize(np_+8); aW0[d].resize(np_+8); aW1[d].resize(np_+8); aC[d].resize(np_+16); OR=aR[d].data(); O0=aW0[d].data(); O1=aW1[d].data(); OC=aC[d].data(); }
    aS.resize(np_+16); uint8_t* OS=aS.data();
    size_t na=0; const int* cn32=(const int*)cnt.data();
    __m512i WV[24]; int WQ[24]; int wn=0;
    auto loadwl=[&](){ wn=wl.n; for(int t=0;t<wn;t++){ WV[t]=_mm512_set1_epi64((long long)wl.v[t]); WQ[t]=wl.q[t]; } };
    loadwl();
    const __m256i REM=_mm256_set1_epi32(rem), ONE=_mm256_set1_epi32(1), SM=_mm256_set1_epi32(SMAX+1), B255=_mm256_set1_epi32(255);
    for(size_t i=0;i<np_;i+=8){
      const int ln=(int)std::min<size_t>(8,np_-i); const __mmask8 lm=(__mmask8)((1u<<ln)-1);
      const __m256i idx=_mm256_maskz_loadu_epi32(lm,PR+i);
      const __m256i cap=_mm256_cvtepu8_epi32(_mm_maskz_loadu_epi8((__mmask16)lm,PCp+i));
      const __m256i cv=_mm256_and_si256(_mm256_mmask_i32gather_epi32(_mm256_setzero_si256(),lm,idx,cn32,1),B255);
      const __m256i need=_mm256_add_epi32(_mm256_sub_epi32(REM,cap),cv);
      const __mmask8 keep=d>0?_mm256_mask_cmpge_epi32_mask(lm,need,ONE):lm;
      const __m512i W0=_mm512_maskz_loadu_epi64(lm,P0+i), W1=_mm512_maskz_loadu_epi64(lm,P1+i);
      __m512i acc=_mm512_setzero_si512();
      for(int t=0;t<wn;t++) acc=_mm512_add_epi64(acc,_mm512_popcnt_epi64(_mm512_andnot_si512(WQ[t]?W1:W0,WV[t])));
      const __m256i w32=_mm512_cvtepi64_epi32(acc);
      if(_mm256_mask_cmplt_epi32_mask(keep,w32,need)){
        for(int k=0;k<ln;k++){ int r=(int)PR[i+k]; int nd=rem-capv[r]+cnt[r]; if(d>0 && nd<1) continue;
          if(d>0){ OR[na]=(uint32_t)r; O0[na]=P0[i+k]; O1[na]=P1[i+k]; OC[na]=PCp[i+k]; }
          const M128& m=rows[r].mask; int w=wl.w(m);
          if(w<nd){ lmax=topk(ANDN(A,m),ANDN(A2,m),ANDN(A3,m),ANDN(A4,m),ANDN(A5,m),ANDN(A6,m),nd); prepRow=r; if(lmax<pos) return -1;
            L1=AND(A,suf[lmax]); L2=AND(A2,suf[lmax]); L3=AND(A3,suf[lmax]); L4=AND(A4,suf[lmax]); L5=AND(A5,suf[lmax]); L6=AND(A6,suf[lmax]); wl.build(L1,L2,L3,L4,L5,L6); w=wl.w(m);
            hint[d][nh[d]<4?nh[d]++:(int)(visited&3)]=r; }
          int s=w-nd; if(s>SMAX) s=SMAX+1; OS[na]=(uint8_t)s; na++; }
        loadwl(); continue; }
      const __m256i s=_mm256_min_epi32(_mm256_sub_epi32(w32,need),SM);
      if(d>0){ _mm256_storeu_si256((__m256i*)(OR+na),_mm256_maskz_compress_epi32(keep,idx));
        _mm512_storeu_si512((void*)(O0+na),_mm512_maskz_compress_epi64(keep,W0)); _mm512_storeu_si512((void*)(O1+na),_mm512_maskz_compress_epi64(keep,W1));
        _mm_storel_epi64((__m128i*)(OC+na),_mm256_cvtepi32_epi8(_mm256_maskz_compress_epi32(keep,cap))); }
      _mm_storel_epi64((__m128i*)(OS+na),_mm256_cvtepi32_epi8(_mm256_maskz_compress_epi32(keep,s)));
      na+=__builtin_popcount((unsigned)keep); }
    if(d>0){ aR[d].resize(na); aW0[d].resize(na); aW1[d].resize(na); aC[d].resize(na); }
    const uint32_t* AR=aR[d].data();
    int hc[SMAX+2]; memset(hc,0,sizeof hc); for(size_t i=0;i<na;i++) hc[OS[i]]++;
    srow[d].resize(na); sW0[d].resize(na+8); sW1[d].resize(na+8); sC[d].resize(na+16);
    int acc=0; for(int s=0;s<=SMAX+1;s++){ sstart[d][s]=acc; acc+=hc[s]; } sstart[d][SMAX+1]=acc-hc[SMAX+1];
    int fill[SMAX+2]; for(int s=0;s<=SMAX+1;s++) fill[s]=sstart[d][s]; fill[SMAX+1]=acc-hc[SMAX+1];
    { const u64* A0=aW0[d].data(); const u64* A1=aW1[d].data(); const uint8_t* AC=aC[d].data(); uint32_t* SR=srow[d].data(); u64* S0=sW0[d].data(); u64* S1=sW1[d].data(); uint8_t* SCp=sC[d].data();
      for(size_t i=0;i<na;i++){ const int p=fill[OS[i]]++; SR[p]=AR[i]; S0[p]=A0[i]; S1[p]=A1[i]; SCp[p]=AC[i]; } }
    return lmax; }
  // lenum: with every row tracked (FASTLEAF), cnt[r] counts the leaf's labels in row r (add/undo along the path, the same
  // incidence lists as allInc) and capv = cap < 255, so the recount below reduces to cnt[r] > cap[r] (ok and tracked false)
  bool verifyLeafF(bool& tracked){ tracked=true; bool ok=true; const uint8_t* c=cnt.data(); const uint8_t* cp=CAPP.data(); u64 bad=0;
    for(int w=0;w<NWR;w++) bad|=(u64)_mm512_cmpgt_epu8_mask(_mm512_loadu_si512(c+64*w),_mm512_loadu_si512(cp+64*w));
    if(bad){ ok=false; tracked=false; }
    for(int l=0;l<N;l++) if(mult[l]>ub[l]) tracked=false; if(d!=R) tracked=false; return ok&&tracked; }
  bool verifyLeaf(bool& tracked){ if(FASTLEAF)return verifyLeafF(tracked); return verifyLeaf0(tracked); }
  bool verifyLeaf0(bool& tracked){ std::vector<int> c(rows.size(),0); for(int i=0;i<d;i++) for(int r:allInc[seq[i]]) c[r]++;
    tracked=true; bool ok=true;
    for(size_t r=0;r<rows.size();r++) if(c[r]>rows[r].cap){ ok=false; if(capv[r]<255) tracked=false; }
    int m[256]={0}; for(int i=0;i<d;i++) m[seq[i]]++; for(int l=0;l<N;l++) if(m[l]>ub[l]) tracked=false; if(d!=R) tracked=false; return ok&&tracked; }
  bool prefixOK() const { for(size_t r=0;r<rows.size();r++) if(cnt[r]>capv[r]) return false; for(int l=0;l<N;l++) if(mult[l]>ub[l]) return false; return true; }
  void emit(){ bool tr; bool ok=verifyLeaf(tr); if(!tr){ fprintf(stderr,"LEAF VERIFY FAILED\n"); exit(7); } if(!ok) return; nleaf++; leaves++;
    if(OUT){ std::lock_guard<std::mutex> lk(outmu); for(int i=0;i<d;i++) fprintf(OUT,"%d%c",vecs[seq[i]],i+1==d?'\n':' '); fflush(OUT); } }
  void dfs(int pos){
    if(aborted) return; if(visited>=budgetEnd){ aborted=true; return; }
    visited++; depthCnt[d]++;
    if(d==R){ c8('L'); emit(); return; }
    if(collecting && d==FRONTIER_D){ c8('F'); frontier.push_back(std::vector<int>(seq,seq+d)); return; }
    int lmax=prep(pos); int kind=prepRow<0?2:1, krow=prepRow; bool hasDual=false;
    if(lmax>=pos && d>=LPMIN && d<=LPMAX){ int lreq; bool fixed; if(lpPrune(pos,lreq,fixed)) return; // the 'K' record is written by lpPrune
      hasDual=(fixed||lreq<N);
      if(fixed){ lmax=prep(pos); kind=prepRow<0?2:1; krow=prepRow; } if(lreq<lmax){ lmax=lreq; kind=3; } }
    if(cert){ int cut=lmax<pos?pos:lmax+1; if(cut>=N){ cut=N; kind=0; }
      c8('O'); c8(cut); c8(kind); if(kind==1) cv((unsigned long long)krow); c8(hasDual?1:0); if(hasDual) cdual(dsup[d],dY[d]); }
    for(int l=pos;l<=lmax;l++){ if(!TST(allowed,l)) continue; if(!canonAdd(l)) continue;
      c8('C'); c8(l);
      int wb=wsuf(l); add(l);
      if(post(l,wb)){
        if(DONATE_D>0 && !cert && !collecting && BUDGET_G<=0 && d<DONATE_D && d<R && curJob>=0 && gOut && idleN.load(std::memory_order_relaxed)>0){   
          gOut[curJob]++; { std::lock_guard<std::mutex> lk(qmu); PQ.push_back({curJob,std::vector<int>(seq,seq+d),allowed,r2,r3,r4,r5,r6}); } donatedN++; qcv.notify_one(); }
        else dfs(l); }
      else if(cert){ c8('P'); c8(postRow<0?2:1); if(postRow>=0) cv((unsigned long long)postRow); }
      undo(l); if(aborted) return; }
    c8('E'); }
  double perDepth[64]={0};
  void dive(std::mt19937_64& rng,double& estN,double& estL,int& dr){
    double w=1; estN=1; estL=0; dr=0; int pos=0; std::vector<int> path; perDepth[0]+=1;
    while(true){ if(d==R){ estL=w; break; } std::vector<int> kids; int lmax=prep(pos);
      if(lmax>=pos && d>=LPMIN && d<=LPMAX){ int lreq; bool fixed; if(lpPrune(pos,lreq,fixed)) lmax=-1; else { if(fixed) lmax=prep(pos); if(lreq<lmax) lmax=lreq; } }
      for(int l=pos;l<=lmax;l++){ if(!TST(allowed,l)) continue; if(!canonAdd(l)) continue; int wb=wsuf(l); add(l); if(post(l,wb)) kids.push_back(l); undo(l); }
      if(d==DUMPD){ std::lock_guard<std::mutex> lk(dumpmu); printf("NODE"); for(int i=0;i<d;i++) printf(" %d",ORD.empty()?seq[i]:ORD[seq[i]]); printf(" pos %d\n",ORD.empty()?pos:ORD[pos]); }
      if(kids.empty()) break; w*=kids.size(); estN+=w; perDepth[d+1]+=w; int l=kids[rng()%kids.size()]; add(l); path.push_back(l); pos=l; dr++; }
    for(int i=(int)path.size()-1;i>=0;i--) undo(path[i]); }
  // check mode helper: is the given sorted canonical sequence accepted step by step?
  std::string walk(const std::vector<int>& best){ int pos=0;
    for(size_t i=0;i<best.size();i++){ int l=best[i]; int lmax=prep(pos);
      if(l>lmax) return "beyond lmax at "+std::to_string(i);
      if(d>=LPMIN && d<=LPMAX){ int lreq; bool fixed; if(lpPrune(pos,lreq,fixed)) return "LP pruned at "+std::to_string(i);
        if(fixed){ lmax=prep(pos); if(l>lmax) return "beyond lmax after LP fixing at "+std::to_string(i); if(!TST(allowed,l)) return "LP-fixed out at "+std::to_string(i); }
        if(l>lreq) return "beyond LP-required label at "+std::to_string(i); } if(!TST(allowed,l)) return "not allowed at "+std::to_string(i);
      if(!canonAdd(l)) return "noncanon at "+std::to_string(i); int wb=wsuf(l); add(l); if(!post(l,wb)) return "post at "+std::to_string(i); pos=l; }
    return ""; }
};

static void lpReport(){ if(LPMAX<0) return; fprintf(stderr,"d63: kill duals sparsified to <= 63 rows %lld, not sparsifiable %lld\n",(long long)gSparse.load(),(long long)gSparseFail.load()); fprintf(stderr,"PACKLP solves %lld pivots %lld fails %lld fallbacks %lld\n",(long long)plSolves,(long long)plPivots,(long long)plFails,(long long)plFallback); fprintf(stderr,"LP calls/kills by depth:");
  for(int d=0;d<64;d++) if(lpCalls[d]||lpReuse[d]||lpSib[d]) fprintf(stderr," d%d %lld/%lld+%lld+s%lld",d,(long long)lpCalls[d],(long long)lpKills[d],(long long)lpReuse[d],(long long)lpSib[d]);
  fprintf(stderr,"  rounds %lld fails %lld fixed %lld\n",(long long)lpRounds,(long long)lpFails,(long long)lpFixed); }
int main(int argc,char** argv){
  const char* ipf=argv[1]; long long EST=0; int TH=1; const char* statep=nullptr; const char* outp="/dev/null"; unsigned long long seed=1; const char* CHECK=nullptr; const char* ORDERF=nullptr; long long MAXJOBS=-1; const char* JOBSF=nullptr; const char* PREFF=nullptr; int PREFD=0; int SUBD=-1; long long SUBIX=-1; const char* ROOTS=nullptr; const char* ROOTSF=nullptr; int REL=3; long long BUDGET=0; const char* HEAVYF=nullptr;
  for(int i=2;i<argc;i++){ std::string a=argv[i];
    if(a=="--estimate") EST=atoll(argv[++i]); else if(a=="--threads") TH=atoi(argv[++i]); else if(a=="--frontier") FRONTIER_D=atoi(argv[++i]);
    else if(a=="--doneprefixes") DONEPF=argv[++i]; else if(a=="--sepmode") SEPMODE=atoi(argv[++i]); else if(a=="--inherit") INHERIT=atoi(argv[++i]); else if(a=="--inhmax") INHMAX=atoi(argv[++i]); else if(a=="--highs") USEPL=false; else if(a=="--state") statep=argv[++i]; else if(a=="--out") outp=argv[++i]; else if(a=="--look") LOOKK=atoi(argv[++i]); else if(a=="--seed") seed=atoll(argv[++i]); else if(a=="--check") CHECK=argv[++i]; else if(a=="--order") ORDERF=argv[++i]; else if(a=="--skipk") SKIPK.insert(atoi(argv[++i])); else if(a=="--maxjobs") MAXJOBS=atoll(argv[++i]); else if(a=="--dumpnodes") DUMPD=atoi(argv[++i]);
    else if(a=="--sepskip") SEPSKIPF=argv[++i]; else if(a=="--sibk"){ SIBK=atoi(argv[++i]); if(SIBK<0||SIBK>8){ fprintf(stderr,"--sibk 0..8\n"); return 1; } } else if(a=="--sibseed") SIBSEED=true; else if(a=="--novsep") VSEP=false; else if(a=="--frontierfile") FRONTF=argv[++i]; else if(a=="--lp"){ LPMIN=atoi(argv[++i]); LPMAX=atoi(argv[++i]); } else if(a=="--lpadd") LPADD=atoi(argv[++i]); else if(a=="--nolpfix") LPFIX=false; else if(a=="--jobs") JOBSF=argv[++i]; else if(a=="--donate") DONATE_D=atoi(argv[++i]); else if(a=="--prefixes"){ PREFF=argv[++i]; PREFD=atoi(argv[++i]); } else if(a=="--subroot"){ SUBD=atoi(argv[++i]); SUBIX=atoll(argv[++i]); } else if(a=="--root") ROOTS=argv[++i]; else if(a=="--roots"){ ROOTSF=argv[++i]; REL=atoi(argv[++i]); } else if(a=="--budget") BUDGET=atoll(argv[++i]); else if(a=="--heavy") HEAVYF=argv[++i]; else if(a=="--cert") CERTP=argv[++i]; else if(a=="--e1p") E1PP=argv[++i]; else if(a=="--e1g") e1p::set_format_e1g(); else if(a=="--e1pext") E1PEXT=true; else if(a=="--e1pE"){ std::stringstream s2(argv[++i]); std::string t; while(std::getline(s2,t,',')) E1PE.push_back(std::stoi(t)); } else if(a=="--e1plimit") E1PLIMIT=atoll(argv[++i]); else if(a=="--maxrss") MAXRSS=atof(argv[++i]); else if(a=="--e1pnomirror") E1PMIRROR=false; else if(a=="--e1prlim") E1PRLIM=atoll(argv[++i]);
    else { fprintf(stderr,"bad arg %s\n",a.c_str()); return 1; } }
  { std::ifstream f(ipf); std::string tok; f>>tok>>R>>tok>>N; vecs.resize(N); for(int l=0;l<N;l++) f>>vecs[l];
    for(int l=0;l<N;l++) ub[l]=R; std::string line; std::getline(f,line);
    while(std::getline(f,line)){ std::istringstream ss(line); std::string t; ss>>t;
      if(t=="C"){ int k,cap,n; ss>>k>>cap>>n; std::vector<int> ls(n); for(int j=0;j<n;j++) ss>>ls[j];
        if(n==1){ ub[ls[0]]=std::min(ub[ls[0]],std::max(0,cap)); continue; }
        Row w; w.mask=M128{}; for(int l:ls) SET(w.mask,l); w.cap=cap; w.size=n; w.k=k; rows.push_back(w); }
      else if(t=="S"){ fprintf(stderr,"S rows not supported\n"); return 2; }
      else if(t=="G"){ int ng; ss>>ng; for(int g=0;g<ng;g++){ std::getline(f,line); std::istringstream s2(line); std::vector<int> P(N); for(int l=0;l<N;l++) s2>>P[l]; G.push_back(P); } break; } } }
  for(int l=0;l<N;l++) if(ub[l]>6){ fprintf(stderr,"ub[%d]=%d > 6 unsupported\n",l,ub[l]); return 2; }
  if(ORDERF){ std::vector<int> ord; { std::ifstream f(ORDERF); int x; while(f>>x) ord.push_back(x); }
    if((int)ord.size()!=N){ fprintf(stderr,"order file size %zu != %d\n",ord.size(),N); return 2; }
    ORD=ord; std::vector<int> inv(N,-1); for(int i=0;i<N;i++){ if(inv[ord[i]]!=-1){ fprintf(stderr,"order not a permutation\n"); return 2; } inv[ord[i]]=i; }
    std::vector<int> v2(N); int u2[256]; for(int i=0;i<N;i++){ v2[i]=vecs[ord[i]]; u2[i]=ub[ord[i]]; } vecs=v2; for(int i=0;i<N;i++) ub[i]=u2[i];
    for(auto& w:rows){ M128 m=M128{}; for(int l=0;l<N;l++) if(TST(w.mask,l)) SET(m,inv[l]); w.mask=m; }
    for(auto& P:G){ std::vector<int> Q(N); for(int i=0;i<N;i++) Q[i]=inv[P[ord[i]]]; P=Q; } }
  // put the identity first
  for(size_t g=0;g<G.size();g++){ bool id=true; for(int l=0;l<N;l++) if(G[g][l]!=l){id=false;break;} if(id){ std::swap(G[0],G[g]); break; } }
  if(rows.size()>2000000000){ fprintf(stderr,"too many rows\n"); return 2; }
  SEPSKIP.assign(rows.size(),0); if(SEPSKIPF){ std::ifstream f(SEPSKIPF); long long x, n=0; while(f>>x){ if(x<0||x>=(long long)rows.size()){ fprintf(stderr,"bad sepskip row %lld\n",x); return 2; } SEPSKIP[x]=1; n++; } fprintf(stderr,"sepskip: %lld of %zu rows never separated\n",n,rows.size()); }
  inc.assign(N,{}); capv.assign(rows.size(),0);
  for(size_t r=0;r<rows.size();r++){ bool tr=(SKIPK.count(rows[r].k)==0); capv[r]=tr?rows[r].cap:255; if(!tr) untracked.push_back(r);
    for(int l=0;l<N;l++) if(TST(rows[r].mask,l)){ allInc[l].push_back(r); if(tr) inc[l].push_back(r); } }
  incO.assign(N+1,0); for(int l=0;l<N;l++){ incO[l]=incF.size(); for(int r:inc[l]) incF.push_back(r); } incO[N]=incF.size();
  for(size_t r=0;r<rows.size();r++) if(!SEPSKIP[r] && capv[r]!=255){ SID.push_back((uint32_t)r); for(int q=0;q<4;q++) SW[q].push_back(rows[r].mask.w[q]); SCAP.push_back(capv[r]); }
  SIDID=(SID.size()==rows.size()); for(size_t i=0;i<SID.size()&&SIDID;i++) if(SID[i]!=i) SIDID=false;
  { NWR=(int)((rows.size()+63)/64); RBI=(u64*)calloc((size_t)N*NWR+8,sizeof(u64)); DENSE=true; long long nb=0;
    for(int l=0;l<N;l++) for(int p=incO[l];p<incO[l+1];p++){ uint32_t r=incF[p]; u64& w=RBI[(size_t)l*NWR+r/64]; if(w>>(r%64)&1) DENSE=false; w|=1ULL<<(r%64); nb++; }
    CAPP.assign((size_t)NWR*64,0); for(size_t r=0;r<rows.size();r++) CAPP[r]=capv[r];
    RBMOK=SIDID&&DENSE; long long mb=0;
    if(RBMOK) for(size_t r=0;r<rows.size()&&RBMOK;r++) FORBITS(rows[r].mask,l_,{ mb++; if(l_>=N || !(RBI[(size_t)l_*NWR+r/64]>>(r%64)&1)) RBMOK=false; })
    if(mb!=nb) RBMOK=false;
    if(SIDID) SCAP.resize((size_t)NWR*64,0);
    FASTLEAF=DENSE && untracked.empty(); for(size_t r=0;r<rows.size();r++) if(rows[r].cap<0 || rows[r].cap>254 || capv[r]!=rows[r].cap) FASTLEAF=false;
    for(int l=0;l<N;l++) if(allInc[l].size()!=inc[l].size()) FASTLEAF=false;
    fprintf(stderr,"lenum: dense add/undo %s, bitmap separation %s, leaf check from counts %s\n",DENSE?"on":"off",RBMOK?"on":"off",FASTLEAF?"on":"off"); }
  if(VSEP) fprintf(stderr,"vsep: %zu separable rows%s\n",SID.size(),SIDID?" (identity: AVX-512 pass)":"");
  for(size_t r=0;r<rows.size();r++) if(rows[r].k>=LOOKK && capv[r]<255) look.push_back(r);
  if(R>60){ fprintf(stderr,"R too large\n"); return 2; }
  if(CERTP && !SKIPK.empty()){ fprintf(stderr,"--cert does not support --skipk\n"); return 2; }
  auto certOpen=[&](const std::string& sfx)->FILE*{ if(!CERTP) return nullptr; std::string p=std::string(CERTP)+"_"+std::to_string((long long)getpid())+"_"+sfx+".bin";
    FILE* f=fopen(p.c_str(),"wb"); if(!f){ fprintf(stderr,"cannot open %s\n",p.c_str()); exit(2); } return f; };
  FILE* TOPF=nullptr; if(CERTP){ TOPF=certOpen("top"); fprintf(stderr,"cert: writing %s_%lld_*.bin\n",CERTP,(long long)getpid()); }
  suf[N]=M128{}; for(int p=N-1;p>=0;p--){ suf[p]=suf[p+1]; SET(suf[p],p); }
  long long ninc=0; for(int l=0;l<N;l++) ninc+=inc[l].size();
  fprintf(stderr,"R %d N %d rows %zu (avg incidences %.0f) lookahead rows %zu group %zu\n",R,N,rows.size(),(double)ninc/N,look.size(),G.size());
  if(CHECK){ std::map<int,int> lab; for(int l=0;l<N;l++) lab[vecs[l]]=l; std::ifstream f(CHECK); std::string line; int np=0,bad=0;
    while(std::getline(f,line)){ std::istringstream ss(line); std::vector<int> v; int x; while(ss>>x) v.push_back(x); if(v.empty()) continue;
      if((int)v.size()==R+1) v.erase(v.begin());
      std::vector<int> ls; for(int y:v) ls.push_back(lab.at(y)); std::vector<int> best;
      for(auto& P:G){ std::vector<int> im; for(int l:ls) im.push_back(P[l]); std::sort(im.begin(),im.end()); if(best.empty()||im<best) best=im; }
      State s; std::string why=s.walk(best); bool ok=why.empty();
      np++; if(!ok){ bad++; fprintf(stderr,"profile %d REJECTED: %s\n",np,why.c_str()); } }
    printf("checked %d profiles, rejected %d\n",np,bad); return bad?3:0; }
  // subtree test: canonical prefixes of length PREFD of the given profiles, each subtree enumerated completely
  if(PREFF){ std::map<int,int> lab; for(int l=0;l<N;l++) lab[vecs[l]]=l; std::ifstream f(PREFF); std::string line; std::set<std::vector<int>> pre;
    while(std::getline(f,line)){ std::istringstream ss(line); std::vector<int> v; int x; while(ss>>x) v.push_back(x); if(v.empty()) continue;
      if((int)v.size()==R+1) v.erase(v.begin());
      std::vector<int> ls; for(int y:v) ls.push_back(lab.at(y)); std::vector<int> best;
      for(auto& P:G){ std::vector<int> im; for(int l:ls) im.push_back(P[l]); std::sort(im.begin(),im.end()); if(best.empty()||im<best) best=im; }
      pre.insert(std::vector<int>(best.begin(),best.begin()+PREFD)); }
    OUT=fopen(outp,"a"); long long tn=0, tl=0; int k=0; auto t0=std::chrono::steady_clock::now();
    for(const auto& job:pre){ State s; for(size_t i=0;i<job.size();i++){ if(i>0) s.prep(job[i-1]); s.add(job[i]); } s.dfs(job.back());
      fprintf(stderr,"prefix %d nodes %lld leaves %lld\n",k++,s.visited,s.leaves); tn+=s.visited; tl+=s.leaves; }
    double el=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
    fprintf(stderr,"PREFIXES %zu nodes %lld leaves %lld time %.1fs\n",pre.size(),tn,tl,el); lpReport(); if(OUT) fclose(OUT); return 0; }
  if(EST){ std::atomic<long long> done{0}; std::mutex em; double sN=0,sN2=0,sL=0; long long dh[64]={0};
    auto t0=std::chrono::steady_clock::now();
    std::vector<double> pdep(64,0);
    auto wk=[&](int tid){ std::mt19937_64 rng(seed*1000003+tid); State s; while(true){ long long i=done++; if(i>=EST) break; double n,lf; int dr; s.dive(rng,n,lf,dr);
        std::lock_guard<std::mutex> lk(em); sN+=n; sN2+=n*n; sL+=lf; dh[dr]++; }
      std::lock_guard<std::mutex> lk(em); for(int i=0;i<64;i++) pdep[i]+=s.perDepth[i]; };
    std::vector<std::thread> th; for(int i=0;i<TH;i++) th.emplace_back(wk,i); for(auto& t:th) t.join();
    double K=EST, mean=sN/K, sd=sqrt(std::max(0.0,sN2/K-mean*mean)/K);
    double el=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
    printf("estimate nodes %.4g +- %.2g leaves %.4g (%.1fs)\ndepth hist:",mean,sd,sL/K,el); for(int d=0;d<=R;d++) printf(" %lld",dh[d]); printf("\nper-depth est:"); for(int d=0;d<=R;d++) printf(" %.2g",pdep[d]/K); printf("\n"); lpReport(); return 0; }
  OUT=(std::string(outp)=="/dev/null")?nullptr:fopen(outp,"a");   // lenum: leaves written to /dev/null are not formatted at all
  if(FRONTIER_D<0 && !ROOTSF && !FRONTF){ State s; s.cert=(CERTP!=nullptr); auto t0=std::chrono::steady_clock::now(); s.cbegin('T',nullptr,0,255); s.dfs(0); s.cend(TOPF,s.visited); if(TOPF) fclose(TOPF);
    double el=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
    fprintf(stderr,"DONE nodes %lld leaves %lld time %.1fs\n",s.visited,(long long)nleaf,el); for(int d=0;d<=R;d++) fprintf(stderr," %lld",s.depthCnt[d]); fprintf(stderr,"\n"); lpReport(); return 0; }
  auto t0=std::chrono::steady_clock::now();
  if(FRONTF){ std::map<int,int> lab; for(int l=0;l<N;l++) lab[vecs[l]]=l; std::ifstream f(FRONTF); if(!f){ fprintf(stderr,"no frontier file\n"); return 2; } std::string line; size_t nl=0; int mx=0;
    while(std::getline(f,line)){ if(line.empty()) continue; std::stringstream ss(line); long long ix; std::string t; ss>>ix>>t; if(ix!=(long long)nl){ fprintf(stderr,"frontier file: line %zu has index %lld\n",nl,ix); return 2; }
      std::vector<int> job; std::stringstream s2(t); std::string u; while(std::getline(s2,u,',')){ auto it=lab.find(std::stoi(u)); if(it==lab.end()){ fprintf(stderr,"frontier file: bad label %s\n",u.c_str()); return 2; } job.push_back(it->second); }
      if(job.empty()){ fprintf(stderr,"frontier file: empty job\n"); return 2; } mx=std::max(mx,(int)job.size()); frontier.push_back(job); nl++; }
    FRONTIER_D=mx; fprintf(stderr,"frontier loaded from %s: %zu jobs\n",FRONTF,frontier.size()); }
  else if(ROOTSF){ // jobs = union over the listed roots (one label prefix per line, comma-separated vec values) of the frontier REL levels below
    std::map<int,int> lab; for(int l=0;l<N;l++) lab[vecs[l]]=l; std::ifstream f(ROOTSF); std::string line; long long nr=0, npr=0;
    while(std::getline(f,line)){ if(line.empty()) continue; std::vector<int> root; { std::stringstream ss(line); std::string t; while(std::getline(ss,t,',')) root.push_back(lab.at(std::stoi(t))); }
      State s; nr++;
      if(CERTP){ // prefix replay without LP fixing (self-contained block); each label must be allowed where it is added
        for(size_t i=0;i<root.size();i++){ if(i>0) s.prep(root[i-1]); if(!TST(s.allowed,root[i])){ fprintf(stderr,"root %s: label %zu not allowed\n",line.c_str(),i); return 2; } s.add(root[i]); }
        FRONTIER_D=(int)root.size()+REL; s.cert=true; s.cbegin('T',root.data(),(int)root.size(),FRONTIER_D); long long v0=s.visited;
        collecting=true; s.dfs(root.back()); collecting=false; s.cend(TOPF,s.visited-v0); continue; }
      std::string why=s.walk(root);
      if(!why.empty()){ if(why.find("LP")!=std::string::npos){ npr++; continue; } fprintf(stderr,"root %s rejected on replay: %s\n",line.c_str(),why.c_str()); return 2; }
      FRONTIER_D=(int)root.size()+REL; collecting=true; s.dfs(root.back()); collecting=false; }
    fprintf(stderr,"roots %lld (LP-pruned on replay %lld): frontier %zu nodes (%d below each root), leaves above %lld\n",nr,npr,frontier.size(),REL,(long long)nleaf); }
  else if(ROOTS){ // jobs = the depth-FRONTIER_D frontier of the subtree of the node with the given label prefix (vec values)
    std::map<int,int> lab; for(int l=0;l<N;l++) lab[vecs[l]]=l; std::vector<int> root; { std::stringstream ss(ROOTS); std::string t; while(std::getline(ss,t,',')) root.push_back(lab.at(std::stoi(t))); }
    if(root.empty() || FRONTIER_D<=(int)root.size()){ fprintf(stderr,"--root needs --frontier deeper than the root\n"); return 2; }
    State s; std::string why;
    if(CERTP){ for(size_t i=0;i<root.size();i++){ if(i>0) s.prep(root[i-1]); if(!TST(s.allowed,root[i])){ why="label not allowed"; break; } s.add(root[i]); } }
    else why=s.walk(root); // replays the root with every check of dfs
    if(!why.empty()){ if(why.find("LP")!=std::string::npos){ fprintf(stderr,"root pruned on replay (%s): subtree has no solution\nDONE frontier run leaves 0\n",why.c_str()); return 0; }
      fprintf(stderr,"root rejected on replay: %s\n",why.c_str()); return 2; }
    s.cert=(CERTP!=nullptr); s.cbegin('T',root.data(),(int)root.size(),FRONTIER_D); long long v0=s.visited;
    collecting=true; s.dfs(root.back()); collecting=false; s.cend(TOPF,s.visited-v0);
    fprintf(stderr,"root %s: frontier depth %d: %zu nodes, leaves above %lld\n",ROOTS,FRONTIER_D,frontier.size(),(long long)nleaf); }
  else if(SUBD>0){ // jobs = the depth-FRONTIER_D frontier of the subtree of node #SUBIX of the depth-SUBD frontier
    if(FRONTIER_D<=SUBD){ fprintf(stderr,"--subroot needs --frontier deeper than %d\n",SUBD); return 2; }
    int D1=FRONTIER_D; FRONTIER_D=SUBD; { State s; collecting=true; s.dfs(0); collecting=false; }
    if(SUBIX<0 || SUBIX>=(long long)frontier.size()){ fprintf(stderr,"bad subroot index %lld of %zu\n",SUBIX,frontier.size()); return 2; }
    std::vector<int> root=frontier[SUBIX]; size_t nsub=frontier.size(); frontier.clear(); FRONTIER_D=D1; long long l0=nleaf;
    { State s; for(size_t i=0;i<root.size();i++){ if(i>0) s.prep(root[i-1]); s.add(root[i]); }
      s.cert=(CERTP!=nullptr); s.cbegin('T',root.data(),(int)root.size(),FRONTIER_D); long long v0=s.visited;
      collecting=true; s.dfs(root.back()); collecting=false; s.cend(TOPF,s.visited-v0); }
    fprintf(stderr,"subroot %lld of %zu at depth %d (labels",SUBIX,nsub,SUBD); for(int l:root) fprintf(stderr," %d",vecs[l]);
    fprintf(stderr,"): frontier depth %d: %zu nodes, leaves above %lld\n",FRONTIER_D,frontier.size(),(long long)nleaf-l0); }
  else { State s; s.cert=(CERTP!=nullptr); s.cbegin('T',nullptr,0,FRONTIER_D); collecting=true; s.dfs(0); collecting=false; s.cend(TOPF,s.visited); fprintf(stderr,"frontier depth %d: %zu nodes, leaves above %lld\n",FRONTIER_D,frontier.size(),(long long)nleaf); }
  if(TOPF){ fclose(TOPF); TOPF=nullptr; }
  { unsigned long long h=1469598103934665603ULL; for(auto& j:frontier){ for(int l:j){ h^=(unsigned long long)(vecs[l]+1); h*=1099511628211ULL; } h^=0xFFFFULL; h*=1099511628211ULL; } fprintf(stderr,"frontier hash %016llx (%zu nodes)\n",h,frontier.size()); }
  if(getenv("DUMPFRONTIER")){ FILE* df=fopen(getenv("DUMPFRONTIER"),"w"); for(size_t i=0;i<frontier.size();i++){ fprintf(df,"%zu",i); for(size_t k=0;k<frontier[i].size();k++) fprintf(df,"%c%d",k?',':' ',vecs[frontier[i][k]]); fprintf(df,"\n"); } fclose(df);
    if(getenv("DUMPONLY")) return 0; }
  std::vector<int> order(frontier.size()); std::iota(order.begin(),order.end(),0); std::mt19937_64 rng(seed); std::shuffle(order.begin(),order.end(),rng);
  if(JOBSF){ order.clear(); std::ifstream f(JOBSF); long long x; while(f>>x){ if(x<0||x>=(long long)frontier.size()){ fprintf(stderr,"bad job %lld\n",x); return 2; } order.push_back((int)x); } }
  std::vector<char> doneIdx(frontier.size(),0); long long prevDone=0; double prevNodes=0;
  if(statep){ FILE* f=fopen(statep,"r"); if(f){ long long ix,nn,lf; double sec; while(fscanf(f,"%lld %lld %lld %lf",&ix,&nn,&lf,&sec)==4){ if(!doneIdx[ix]){ doneIdx[ix]=1; prevDone++; prevNodes+=nn; } } fclose(f); }
    fprintf(stderr,"resumed %lld done\n",prevDone); }
  if(HEAVYF){ std::ifstream hf(HEAVYF); if(hf){ // jobs already recorded heavy (by an earlier run) are left to the split runs
      std::map<int,int> lab; for(int l=0;l<N;l++) lab[vecs[l]]=l; std::map<std::vector<int>,size_t> idx; for(size_t i=0;i<frontier.size();i++) idx[frontier[i]]=i;
      std::string line; long long nsk=0;
      while(std::getline(hf,line)){ if(line.empty()) continue; std::vector<int> pv; std::stringstream ss(line); std::string t; while(std::getline(ss,t,',')) pv.push_back(lab.at(std::stoi(t)));
        auto it=idx.find(pv); if(it!=idx.end() && !doneIdx[it->second]){ doneIdx[it->second]=2; nsk++; } }
      fprintf(stderr,"skipping %lld jobs already recorded heavy in %s\n",nsk,HEAVYF); } }
  if(DONEPF){ std::ifstream df(DONEPF); if(!df){ fprintf(stderr,"no doneprefixes file\n"); return 2; }   // jobs finished (with traces) by another run
    std::map<int,int> lab; for(int l=0;l<N;l++) lab[vecs[l]]=l; std::map<std::vector<int>,size_t> idx; for(size_t i=0;i<frontier.size();i++) idx[frontier[i]]=i;
    std::string line; long long nsk=0, nl=0;
    while(std::getline(df,line)){ if(line.empty()) continue; nl++; std::vector<int> pv; std::stringstream ss(line); std::string t; while(std::getline(ss,t,',')) pv.push_back(lab.at(std::stoi(t)));
      auto it=idx.find(pv); if(it!=idx.end() && !doneIdx[it->second]){ doneIdx[it->second]=3; nsk++; } }
    fprintf(stderr,"skipping %lld jobs done elsewhere (%lld prefixes in %s)\n",nsk,nl,DONEPF); }
  FILE* HF=HEAVYF?fopen(HEAVYF,"a"):nullptr; long long nheavy=0; // jobs over the node budget: not done, prefix written to HF
  FILE* SF=statep?fopen(statep,"a"):nullptr; std::mutex rm; std::atomic<size_t> nextI{0}; long long ndone=prevDone; double sumN=prevNodes; std::vector<double> sizes; std::atomic<bool> fin{false};
  std::vector<long long> dh(64,0);
  std::vector<FILE*> CF(TH,nullptr); for(int t=0;t<TH;t++) CF[t]=certOpen("t"+std::to_string(t));
  std::vector<FILE*> EF(TH,nullptr), ELF(TH,nullptr), EXF(TH,nullptr);
  if(E1PP){ E1PIP=new e1p::IP(); E1PIP->load(ipf,ORDERF);
    for(int t=0;t<TH;t++){ std::string b=std::string(E1PP)+"_"+std::to_string((long long)getpid())+"_";
      EF[t]=fopen((b+"t"+std::to_string(t)+".e1p").c_str(),"wb"); ELF[t]=fopen((b+"leafjobs_t"+std::to_string(t)+".bin").c_str(),"wb");
      if(E1PEXT) EXF[t]=fopen((b+"ext_t"+std::to_string(t)+".txt").c_str(),"w");
      if(!EF[t]||!ELF[t]){ fprintf(stderr,"cannot open %s outputs\n",E1PP); return 2; } }
    fprintf(stderr,"e1p: writing %s_%lld_t*.e1p (IP %zu rows)\n",E1PP,(long long)getpid(),E1PIP->mask.size()); }
  // --e1p: convert the finished job's trace (in s.cb) to E1P literals, or write it for the two-pass route
  std::vector<std::unique_ptr<e1p::LeafGen>> LG(TH); if(E1PP && !E1PE.empty()) for(int t=0;t<TH;t++) LG[t].reset(new e1p::LeafGen(*E1PIP,E1PE));
  auto e1pJob=[&](State& s,int tid,int ix,long long nn){
    auto t0=std::chrono::steady_clock::now();
    s.c8('Z'); s.cv((unsigned long long)nn);
    bool tracefile=false, tracedropped=false;
    try{
      e1p::Job job(*E1PIP); job.check(s.cb.data(),s.cb.size());
      auto t1=std::chrono::steady_clock::now(); e1pNsCheck+=std::chrono::duration_cast<std::chrono::nanoseconds>(t1-t0).count();
      bool lv=false; for(auto& nd:job.nodes) if(nd.tag=='L'){ lv=true; break; }
      // the model is built: a big trace is not needed for emission, so free it now (it would be written only on failure)
      if(!(lv && !LG[tid]) && s.cb.capacity()>(size_t(16)<<20)){ std::vector<uint8_t>().swap(s.cb); tracedropped=true; }
      if(lv && !LG[tid]){ tracefile=true; e1pLeafJobs++; }
      else{
        e1p::Job::LeafCert lc=nullptr; if(lv) lc=[&](const std::vector<int>& pl,e1p::BW& c){ return (*LG[tid])(pl,c); };
        job.allow_ext=E1PEXT;
        auto bl=job.emit(lc,E1PLIMIT,E1PRLIM);
        auto t2=std::chrono::steady_clock::now(); e1pNsEmit+=std::chrono::duration_cast<std::chrono::nanoseconds>(t2-t1).count();
        e1p::Mirror mir(*E1PIP); mir.allow_ext=E1PEXT; std::vector<std::vector<std::pair<size_t,size_t>>> Hs;
        for(size_t i=0;i<bl.size() && E1PMIRROR;i++){   // --e1pnomirror: skip (the native or kernel check validates the blocks)
          if(!mir.block(bl[i].bits)) throw e1p::Fail("mirror rejects block "+std::to_string(i));
          Hs.push_back(mir.H);
          if(bl[i].parent_block>=0 && !e1p::Mirror::glue(bl[bl[i].parent_block].bits,Hs[bl[i].parent_block][bl[i].parent_rec],bl[i].bits)) throw e1p::Fail("glue");
        }
        e1pNsMirror+=std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::steady_clock::now()-t2).count();
        uint32_t hd[3]={0x4A503145u,(uint32_t)ix,(uint32_t)bl.size()}; fwrite(hd,4,3,EF[tid]);
        for(auto& b:bl){ auto by=b.bits.bytes(); uint32_t n=(uint32_t)by.size(); fwrite(&n,4,1,EF[tid]); fwrite(by.data(),1,n,EF[tid]); }
        fflush(EF[tid]); e1pJobs++; e1pLits+=bl.size(); e1pNodes+=nn;
        if(EXF[tid]) for(auto& pl:job.ext_out){ fprintf(EXF[tid],"%d",ix); for(size_t q=0;q<pl.size();q++) fprintf(EXF[tid],"%c%d",q?',':' ',pl[q]); fprintf(EXF[tid],"\n"); }
        if(EXF[tid]) fflush(EXF[tid]);
      }
    } catch(e1p::Fail& e){ fprintf(stderr,"e1p: job %d failed: %s\n",ix,e.what()); e1pFail++; tracefile=true; }
    if(tracefile && tracedropped) fprintf(stderr,"e1p: job %d failed after its trace (over 16 MB) was released; rerun it with --cert to get the trace\n",ix);
    else if(tracefile){ uint32_t mg=0x3342454C; uint64_t len=s.cb.size(); fwrite(&mg,4,1,ELF[tid]); fwrite(&len,8,1,ELF[tid]); fwrite(s.cb.data(),1,s.cb.size(),ELF[tid]); fflush(ELF[tid]); }
    // nothing of a job outlives it: the leaf caches go, and a trace buffer over 64 MB is released (clear() keeps the capacity)
    if(LG[tid]) LG[tid]->reset();
    if(s.cb.capacity()>(size_t(64)<<20)) std::vector<uint8_t>().swap(s.cb); else s.cb.clear();
    if(nn>200000) malloc_trim(0);   // hand a big job's freed memory back to the OS (glibc keeps it in the thread's arena)
    e1pNs+=std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::steady_clock::now()-t0).count(); };
  // lineenum9s: per-job bookkeeping for donated pieces
  BUDGET_G=BUDGET; const size_t NF=frontier.size(); std::unique_ptr<std::atomic<int>[]> outst(new std::atomic<int>[NF]); for(size_t i=0;i<NF;i++) outst[i]=0; gOut=outst.get();
  std::vector<char> rootDone(NF,0); std::vector<long long> jnodes(NF,0), jleaves(NF,0); std::vector<std::chrono::steady_clock::time_point> jt0(NF);
  int activeR=0, activeP=0; bool fdone=false;
  auto writeState=[&](int ix){ double sec=std::chrono::duration<double>(std::chrono::steady_clock::now()-jt0[ix]).count();   // caller holds rm
    ndone++; sumN+=jnodes[ix]; sizes.push_back(jnodes[ix]); if(SF){ fprintf(SF,"%d %lld %lld %.3f\n",ix,jnodes[ix],jleaves[ix],sec); fflush(SF); } };
  auto checkFin=[&](){ if(nextI.load()>=order.size() && PQ.empty() && activeR==0 && activeP==0 && !fdone){ fdone=true; qcv.notify_all(); } };   // caller holds qmu
  auto worker=[&](int tid){ State s; s.cert=(CERTP!=nullptr||E1PP!=nullptr); struct Fin{ State& s; std::vector<long long>& dh; std::mutex& m; ~Fin(){ std::lock_guard<std::mutex> lk(m); for(int i=0;i<64;i++) dh[i]+=s.depthCnt[i]; } } fin{s,dh,rm};
    while(true){ size_t k=nextI++;
      if(k<order.size() && !(MAXJOBS>=0 && (long long)k>=MAXJOBS)){ int ix=order[k]; if(doneIdx[ix]) continue;
        { std::lock_guard<std::mutex> lq(qmu); activeR++; }
        { std::lock_guard<std::mutex> lk(rm); jt0[ix]=std::chrono::steady_clock::now(); }
        long long v0=s.visited, l0=s.leaves; const auto& job=frontier[ix]; s.curJob=ix;
        for(size_t i=0;i<job.size();i++){ if(i>0) s.prep(job[i-1]); s.add(job[i]); }
        if(!s.prefixOK()){ for(int i=(int)job.size()-1;i>=0;i--) s.undo(job[i]); gPrefixCut++;   // lineenum9qy: infeasible prefix under this IP: no leaves
          { std::lock_guard<std::mutex> lk(rm); rootDone[ix]=1; if(outst[ix].load()==0) writeState(ix); }
          { std::lock_guard<std::mutex> lq(qmu); activeR--; checkFin(); } continue; }
        s.aborted=false; s.budgetEnd=BUDGET>0?s.visited+BUDGET:LLONG_MAX;
        s.cbegin('J',job.data(),(int)job.size(),0);
        s.dfs(job.back()); for(int i=(int)job.size()-1;i>=0;i--) s.undo(job[i]);
        long long nn=s.visited-v0;
        if(s.aborted){ s.aborted=false; s.cb.clear(); { std::lock_guard<std::mutex> lk(rm); nheavy++; if(HF){ for(size_t i=0;i<job.size();i++) fprintf(HF,"%d%c",vecs[job[i]],i+1==job.size()?'\n':','); fflush(HF); } }
          { std::lock_guard<std::mutex> lq(qmu); activeR--; checkFin(); } continue; }
        if(E1PP) e1pJob(s,tid,ix,nn); else s.cend(CF[tid],nn);
        { std::lock_guard<std::mutex> lk(rm); jnodes[ix]+=nn; jleaves[ix]+=s.leaves-l0; rootDone[ix]=1; if(outst[ix].load()==0) writeState(ix); }
        { std::lock_guard<std::mutex> lq(qmu); activeR--; checkFin(); }
        continue; }
      // job list exhausted: run donated pieces until every job is finished
      Piece pc;
      { std::unique_lock<std::mutex> lq(qmu); checkFin(); idleN++; qcv.wait(lq,[&]{ return !PQ.empty() || fdone; }); idleN--;
        if(PQ.empty() && fdone) break; pc=std::move(PQ.front()); PQ.pop_front(); activeP++; }
      int ix=pc.ix; s.curJob=ix; long long v0=s.visited, l0=s.leaves; const auto& sq=pc.seq;
      for(size_t i=0;i<sq.size();i++){ if(i>0) s.prep(sq[i-1]); s.add(sq[i]); }
      s.allowed=pc.a; s.r2=pc.b; s.r3=pc.c; s.r4=pc.e; s.r5=pc.f; s.r6=pc.g;   // the donor's state includes LP fixes of its ancestors
      s.aborted=false; s.budgetEnd=LLONG_MAX; s.dfs(sq.back()); for(int i=(int)sq.size()-1;i>=0;i--) s.undo(sq[i]);
      { std::lock_guard<std::mutex> lk(rm); jnodes[ix]+=s.visited-v0; jleaves[ix]+=s.leaves-l0; if(--outst[ix]==0 && rootDone[ix]) writeState(ix); }
      { std::lock_guard<std::mutex> lq(qmu); activeP--; checkFin(); } } };
  auto report=[&](bool f){ std::lock_guard<std::mutex> lk(rm); double el=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
    double F=frontier.size(), S=std::max<long long>(1,ndone), mean=sumN/S; double rate=(sumN-prevNodes)/std::max(1.0,el);
    fprintf(stderr,"%st=%.0fs done %lld/%zu (%.3f%%) nodes %.4g mean %.4g EST %.4g rate %.3g n/s ETA %.3g h leaves %lld heavy %lld\n",f?"FINAL ":"",el,ndone,frontier.size(),100.0*ndone/F,sumN,mean,F*mean,rate,(F-ndone)*mean/std::max(1.0,rate)/3600,(long long)nleaf,nheavy); };
  // --maxrss GB (or LE_MAXRSS_GB): the process stops itself (exit 3, after a message) when its resident set exceeds the cap
  if(MAXRSS<=0 && getenv("LE_MAXRSS_GB")) MAXRSS=atof(getenv("LE_MAXRSS_GB"));
  auto rssGB=[](){ long long pages=0, res=0; FILE* f=fopen("/proc/self/statm","r"); if(f){ if(fscanf(f,"%lld %lld",&pages,&res)!=2) res=0; fclose(f); } return (double)res*(double)sysconf(_SC_PAGESIZE)/1e9; };
  std::thread mon([&](){ while(!fin){ for(int i=0;i<60&&!fin;i++){ std::this_thread::sleep_for(std::chrono::seconds(1));
        if(MAXRSS>0){ double g=rssGB(); if(g>MAXRSS){ fprintf(stderr,"FATAL: resident set %.1f GB over the cap %.1f GB (--maxrss); stopping\n",g,MAXRSS); fflush(stderr); _exit(3); } } }
      if(!fin){ report(false); fprintf(stderr,"rss %.2f GB\n",rssGB()); } } });
  std::vector<std::thread> th; for(int i=0;i<TH;i++) th.emplace_back(worker,i); for(auto& t:th) t.join(); fin=true; mon.join(); report(true);
  if(SF) fclose(SF); if(OUT) fclose(OUT); if(HF) fclose(HF); for(FILE* f:CF) if(f) fclose(f); for(FILE* f:EF) if(f) fclose(f); for(FILE* f:ELF) if(f) fclose(f); for(FILE* f:EXF) if(f) fclose(f);
  if(E1PP) fprintf(stderr,"e1p: %lld jobs converted (%lld literals, %lld st-nodes, %.3f ms per st-node), %lld jobs with leaves and %lld failures written as traces\n",
    (long long)e1pJobs,(long long)e1pLits,(long long)e1pNodes,e1pNodes?(double)e1pNs/1e6/(double)e1pNodes:0.0,(long long)e1pLeafJobs,(long long)e1pFail);
  { long long nc=0,nf=0,nb=0,ns=0,ne=0; double sc=0; for(auto& g:LG) if(g){ nc+=g->ncerts; nf+=g->nfit; nb+=g->nbig; ns+=g->nsat; ne+=g->nenc; sc+=g->secs; }
    if(E1PP && !E1PE.empty()) fprintf(stderr,"gen7: %lld leaf certificates (%lld by the fit fallback) in %.2f s, %lld over maxnodes, %lld SAT, %lld not encodable\n",nc,nf,sc,nb,ns,ne);
    if(E1PP) fprintf(stderr,"e1p split: check %.3f s, emit %.3f s (gen7 %.3f s of it), mirror %.3f s\n",(double)e1pNsCheck/1e9,(double)e1pNsEmit/1e9,sc,(double)e1pNsMirror/1e9); }
  fprintf(stderr,"depth hist:"); for(int i=0;i<=R;i++) fprintf(stderr," %lld",dh[i]); fprintf(stderr,"\n");
  lpReport(); fprintf(stderr,"jobs with an infeasible prefix (no leaves): %lld\n",(long long)gPrefixCut); fprintf(stderr,"DONE frontier run leaves %lld heavy %lld\n",(long long)nleaf,nheavy);
}
