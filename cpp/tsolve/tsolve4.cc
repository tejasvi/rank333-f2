// tsolve4: tsolve3 + symmetry breaking among terms with the same first factor: within such a group the (b,c) pairs are taken in
// non-decreasing order of the key 512*b+c along the term index (any solution can be permuted into that order).  The first-branching
// GL3 reduction is then only applied when the chosen first term's first factor is unique (else both reductions could conflict).
// tsolve3: tsolve2 that keeps the first-branching symmetry b -> bS, c -> S^-1 c (S in GL3) for a --target tensor when the target
// is invariant under it (checked for all 168 S; true for every first-factor quotient of <3,3,3> written by quotinst/quotinstc).
// tsolve2: tsolve that visits only the functionals X < 2^D when the target and the instance live in the first D coordinates
// (quotient instances: points D=8, lines D=7, planes D=6).  A functional with higher bits equals its low part on every a_l
// and on T, so its residual and count are copies: the search is identical, 2-8x less work.
// tsolve: exact completion check with fixed first factors.  Given a_1..a_R in F2^9 (bit 3i+j = a[i][j]) and a
// target tensor T (default <3,3,3> = sum_{ijk} e_ij (x) e_jk (x) e_ki), decide whether there are nonzero b_l, c_l with
// sum_l a_l (x) b_l (x) c_l = T.  Search over terms, assigning (b_l, c_l) one term at a time.
//
// State: for every functional X on A (511 of them) the residual Res(X) = T(X) - sum_{assigned l, X(a_l)=1} b_l c_l^T
// (a 9x9 matrix, rows indexed by b-coordinates y, columns by c-coordinates z) and u(X) = #unassigned l with
// X(a_l) = 1.  Necessary: rank Res(X) <= u(X) for all X (the unassigned terms of X decompose Res(X)); at a full
// assignment Res(X) = 0 for all X is exactly the decomposition identity.
// Candidate generation for a term l (necessary conditions only, so the search is exhaustive):
//  * X tight (rank Res = u): in a decomposition into rank-many rank-one terms the b's form a basis of col(Res) and
//    the c's a basis of row(Res), with c_l^T = y^T Res for a y with y^T b_l = 1.  So b_l in col(Res); c_l in
//    row(Res) (c ⊥ rker Res) and c_l . x = 1 where Res x = b_l (well defined on row(Res)).
//  * X with slack 1: rank(Res + b c^T) <= rank Res forces b in col(Res) or c in row(Res).
//  * Slack >= 2 gives no single-term condition.
// First branching is reduced by the symmetry b -> b S^{-1}, c -> S c (S in GL3) which fixes T and every a_l:
// the first assigned term takes b only among lex-min representatives of {b S : S in GL3}.
// Usage: tsolve [--maxnodes N] [--target tensorfile] file   (lines "v1 .. vR" or "tag: v1 .. vR")
#include <bits/stdc++.h>
typedef uint8_t u8; typedef uint16_t u16; typedef uint32_t u32; typedef uint64_t u64;
static int R; static int A[64]; static int XL=512, XLT=512;   // tsolve2: functional range for this instance / for the target
static int GRP[64], GSZ[64];   // tsolve4: group id (first occurrence index) and group size per term
static u16 TX[512][9];           // T(X), rows y (bits z)
static u16 TXT[512][9];          // transpose, rows z (bits y)
static std::vector<int> XS[64];  // functionals X with X(a_l)=1
static int rank9(const u16* m){ u16 bas[9]={0}; int rk=0; for(int i=0;i<9;i++){ u16 v=m[i]; while(v){ int h=31-__builtin_clz(v); if(!bas[h]){ bas[h]=v; rk++; break; } v^=bas[h]; } } return rk; }
static int Tt[9][9][9];
static bool orbitMin[512]; static bool USESYM=true; static bool NOSYM=false;
static int gl3[168][3]; // GL3 matrices as rows (3-bit each)
static int mulB(int b,const int* S){ // (b S) as 3x3, b bit 3j+k
  int r=0; for(int j=0;j<3;j++){ int row=(b>>(3*j))&7; int o=0; for(int k=0;k<3;k++) if((row>>k)&1) o^=S[k]; r|=o<<(3*j); } return r; }

struct Info { int rk; int u; // basis of col(Res) as echelon vectors with combos (columns) for preimages
  u16 cb[9]; u16 cc[9]; int ncb; u16 rker[9]; int nrk; u16 lker[9]; int nlk; };

struct Solver {
  u16 Res[512][9], ResT[512][9]; int u[512]; u32 assigned=0; int B[64], C[64];
  long long nodes=0, maxnodes=LLONG_MAX; bool aborted=false, found=false; int nsol=0;
  Info inf[512];
  void init(){ for(int X=1;X<XL;X++){ memcpy(Res[X],TX[X],18); memcpy(ResT[X],TXT[X],18); u[X]=0; } for(int l=0;l<R;l++) for(int X:XS[l]) u[X]++; assigned=0; nodes=0; aborted=false; found=false; }
  inline void apply(int l,int b,int c){ for(int X:XS[l]){ for(int y=0;y<9;y++) if((b>>y)&1) Res[X][y]^=c; for(int z=0;z<9;z++) if((c>>z)&1) ResT[X][z]^=b; u[X]--; } }
  inline void unapply(int l,int b,int c){ for(int X:XS[l]){ for(int y=0;y<9;y++) if((b>>y)&1) Res[X][y]^=c; for(int z=0;z<9;z++) if((c>>z)&1) ResT[X][z]^=b; u[X]++; } }
  bool checkAfter(int l){ for(int X:XS[l]){ if(rank9(Res[X])>u[X]) return false; } return true; }
  void computeInfo(int X){ Info& I=inf[X]; I.u=u[X];
    // eliminate columns (rows of ResT, indexed by z) with combos: col space basis + right kernel
    u16 v[9], cmb[9]; for(int z=0;z<9;z++){ v[z]=ResT[X][z]; cmb[z]=1<<z; }
    int rk=0; I.ncb=0; I.nrk=0; u16 bv[9]={0}, bc[9]={0}; // bv[h]: vector with highest bit h
    for(int z=0;z<9;z++){ u16 a=v[z], k=cmb[z]; while(a){ int h=31-__builtin_clz(a); if(!bv[h]){ bv[h]=a; bc[h]=k; rk++; break; } a^=bv[h]; k^=bc[h]; } if(!a) I.rker[I.nrk++]=k; }
    I.rk=rk; for(int h=8;h>=0;h--) if(bv[h]){ I.cb[I.ncb]=bv[h]; I.cc[I.ncb]=bc[h]; I.ncb++; }
    // left kernel: rows of Res (indexed by y) dependencies
    u16 lv[9]={0}, lc[9]={0}; I.nlk=0;
    for(int y=0;y<9;y++){ u16 a=Res[X][y], k=1<<y; while(a){ int h=31-__builtin_clz(a); if(!lv[h]){ lv[h]=a; lc[h]=k; break; } a^=lv[h]; k^=lc[h]; } if(!a) I.lker[I.nlk++]=k; } }
  // b in col(Res)? if so, returns preimage x (Res x = b) via combos; cb is in descending-pivot order
  bool inCol(const Info& I,int b,int& x){ u16 a=b; x=0; for(int i=0;i<I.ncb;i++){ int h=31-__builtin_clz(I.cb[i]); if((a>>h)&1){ a^=I.cb[i]; x^=I.cc[i]; } } return a==0; }
  // affine system over F2^9: rows (mask, rhs) in echelon by highest bit
  struct Sys { u16 m[9]; u8 r[9]; bool bad; void clear(){ memset(m,0,sizeof m); memset(r,0,sizeof r); bad=false; }
    void add(u16 mask,int rhs){ if(bad) return; while(mask){ int h=31-__builtin_clz(mask); if(!m[h]){ m[h]=mask; r[h]=(u8)rhs; return; } mask^=m[h]; rhs^=r[h]; } if(rhs) bad=true; }
    int rank() const { int k=0; for(int h=0;h<9;h++) if(m[h]) k++; return k; }
    void solutions(std::vector<int>& out) const { out.clear(); if(bad) return; int free[9], nf=0; for(int h=0;h<9;h++) if(!m[h]) free[nf++]=h;
      for(int s=0;s<(1<<nf);s++){ int c=0; for(int i=0;i<nf;i++) if((s>>i)&1) c|=1<<free[i];
        for(int h=0;h<9;h++) if(m[h]){ int val=r[h]^__builtin_parity(m[h]&c&((1<<h)-1)); if(val) c|=1<<h; }
        // m[h] has highest bit h; c bits below h already final when processing h ascending
        out.push_back(c); } } };
  // candidates for term l; returns count, fills list if want
  long long candidates(int l,std::vector<std::pair<int,int>>* out,long long cap,bool symFirst){
    std::vector<int> tight, s1; for(int X:XS[l]){ int s=inf[X].u-inf[X].rk; if(s==0) tight.push_back(X); else if(s==1) s1.push_back(X); }
    Sys bs; bs.clear(); for(int X:tight){ const Info& I=inf[X]; for(int i=0;i<I.nlk;i++) bs.add(I.lker[i],0); }
    Sys base; base.clear(); for(int X:tight){ const Info& I=inf[X]; for(int i=0;i<I.nrk;i++) base.add(I.rker[i],0); }
    std::vector<int> bl; bs.solutions(bl); long long tot=0; std::vector<int> cl;
    for(int b:bl){ if(!b) continue; if(symFirst && !orbitMin[b]) continue; Sys s=base; bool ok=true;
      for(int X:tight){ int x; if(!inCol(inf[X],b,x)){ ok=false; break; } s.add(x,1); if(s.bad){ ok=false; break; } }
      if(!ok) continue;
      for(int X:s1){ int x; if(!inCol(inf[X],b,x)){ const Info& I=inf[X]; for(int i=0;i<I.nrk;i++) s.add(I.rker[i],0); if(s.bad) break; } }
      if(s.bad) continue;
      int nf=9-s.rank(); long long cnt=(1LL<<nf); // includes c=0 possibly
      if(out){ s.solutions(cl); for(int c:cl) if(c) out->push_back({b,c}); }
      tot+=cnt; if(tot>cap) return tot; }
    return tot; }
  void dfs(int depth){
    if(aborted||found) return; if(++nodes>maxnodes){ aborted=true; return; }
    if(assigned==((1u<<R)-1)){ for(int X=1;X<XL;X++) for(int y=0;y<9;y++) if(Res[X][y]) return; found=true; nsol++; return; }
    for(int X=1;X<XL;X++) if(u[X]>0) computeInfo(X); else { inf[X].u=0; inf[X].rk=0; }
    int best=-1; long long bc=LLONG_MAX; bool symNow=false;
    if(USESYM && depth==0){   // tsolve4: symmetric first branching only on a term whose first factor is unique
      for(int l=0;l<R;l++) if(GSZ[GRP[l]]==1){ long long c=candidates(l,nullptr,bc,true); if(c<bc){ bc=c; best=l; symNow=true; if(c==0) break; } } }
    if(!symNow){ bc=LLONG_MAX; best=-1;
      for(int l=0;l<R;l++) if(!((assigned>>l)&1)){ long long c=candidates(l,nullptr,bc,false); if(c<bc){ bc=c; best=l; if(c==0) break; } } }
    if(best<0||bc==0) return;
    std::vector<std::pair<int,int>> cand; candidates(best,&cand,LLONG_MAX,symNow);
    int l=best; assigned|=1u<<l;
    for(auto& bc2:cand){ int b=bc2.first, c=bc2.second;
      if(GSZ[GRP[l]]>1){ int key=512*b+c; bool bad=false;   // tsolve4: keep the pairs of a group non-decreasing along the term index
        for(int l2=0;l2<R && !bad;l2++) if(l2!=l && GRP[l2]==GRP[l] && ((assigned>>l2)&1)){ int k2=512*B[l2]+C[l2]; if((l2<l && key<k2) || (l2>l && key>k2)) bad=true; }
        if(bad) continue; }
      apply(l,b,c);
      if(checkAfter(l)){ B[l]=b; C[l]=c; dfs(depth+1); }
      unapply(l,b,c); if(found||aborted) break; }
    assigned&=~(1u<<l); }
};

int main(int argc,char** argv){
  long long maxnodes=LLONG_MAX; const char* fn=nullptr; const char* tfile=nullptr;
  for(int i=1;i<argc;i++){ std::string a=argv[i]; if(a=="--maxnodes") maxnodes=atoll(argv[++i]); else if(a=="--target"){ tfile=argv[++i]; USESYM=false; } else if(a=="--nosym"){ USESYM=false; NOSYM=true; } else fn=argv[i]; }
  if(!fn){ fprintf(stderr,"usage: tsolve [--maxnodes N] [--target file] file\n"); return 1; }
  memset(Tt,0,sizeof Tt);
  if(tfile){ FILE* f=fopen(tfile,"r"); int x,y,z; while(fscanf(f,"%d %d %d",&x,&y,&z)==3) Tt[x][y][z]^=1; fclose(f); }
  else for(int i=0;i<3;i++) for(int j=0;j<3;j++) for(int k=0;k<3;k++) Tt[3*i+j][3*j+k][3*k+i]=1;
  { int mx=0; for(int x=0;x<9;x++) for(int y=0;y<9;y++) for(int z=0;z<9;z++) if(Tt[x][y][z]) mx=std::max(mx,x); XLT=1<<(mx+1); }
  for(int X=1;X<512;X++){ for(int y=0;y<9;y++){ int row=0; for(int z=0;z<9;z++){ int v=0; for(int x=0;x<9;x++) if((X>>x)&1) v^=Tt[x][y][z]; row|=v<<z; } TX[X][y]=row; }
    for(int z=0;z<9;z++){ int row=0; for(int y=0;y<9;y++) if((TX[X][y]>>z)&1) row|=1<<y; TXT[X][z]=row; } }
  { int n=0; for(int r0=1;r0<8;r0++) for(int r1=1;r1<8;r1++) for(int r2=1;r2<8;r2++){ int m[3]={r0,r1,r2}; u16 bas[3]={0}; int rk=0; for(int i=0;i<3;i++){ int v=m[i]; while(v){ int h=31-__builtin_clz(v); if(!bas[h]){ bas[h]=v; rk++; break; } v^=bas[h]; } } if(rk==3){ gl3[n][0]=r0; gl3[n][1]=r1; gl3[n][2]=r2; n++; } }
    if(n!=168){ fprintf(stderr,"gl3 %d\n",n); return 2; }
    for(int b=0;b<512;b++){ bool mn=true; for(int s=0;s<168&&mn;s++) if(mulB(b,gl3[s])<b) mn=false; orbitMin[b]=mn; } }
  if(tfile && !NOSYM){ // tsolve3: the target must be invariant under (y,z) -> (y S, S^-1 z) for every S: Tt[x][yS][S^-1 z] = Tt[x][y][z]
    bool inv=true;
    for(int si=0;si<168 && inv;si++){ const int* S=gl3[si];
      int Si[3]={0,0,0}; // inverse of S (rows): find T with S*T = I by brute force over the 168
      int ti=-1; for(int t=0;t<168 && ti<0;t++){ bool id=true; for(int r=0;r<3&&id;r++){ int row=0; for(int k=0;k<3;k++) if((S[r]>>k)&1) row^=gl3[t][k]; if(row!=(1<<r)) id=false; } if(id) ti=t; }
      if(ti<0){ inv=false; break; } for(int r=0;r<3;r++) Si[r]=gl3[ti][r];
      // b as 3x3 bit 3j+k: b -> b S (mulB); c -> S^-1 c: c as 3x3 bit 3k+i (row k): (S^-1 c) row r = sum_k Si[r]_k c_row_k
      auto mulC=[&](int c){ int r=0; for(int rr=0;rr<3;rr++){ int o=0; for(int k=0;k<3;k++) if((Si[rr]>>k)&1) o^=(c>>(3*k))&7; r|=o<<(3*rr); } return r; };
      for(int x=0;x<9 && inv;x++) for(int y=0;y<9 && inv;y++) for(int z=0;z<9 && inv;z++) if(Tt[x][y][z]){
        int yy=__builtin_ctz(mulB(1<<y,S)|0x200), zz=-1; (void)yy;
        // images of unit vectors can be sums: check the full trilinear form instead (below)
      }
      // full check: the 9x9 slice T_x (rows y, cols z) must satisfy M_S^T T_x N_S = T_x with b->bS (matrix on y) and c->S^-1 c (on z)
      for(int x=0;x<9 && inv;x++){ int img[9][9]={{0}};
        for(int y=0;y<9;y++) for(int z=0;z<9;z++) if(Tt[x][y][z]){ int by=mulB(1<<y,S), cz=mulC(1<<z);
          for(int y2=0;y2<9;y2++) if((by>>y2)&1) for(int z2=0;z2<9;z2++) if((cz>>z2)&1) img[y2][z2]^=1; }
        for(int y=0;y<9;y++) for(int z=0;z<9;z++) if(img[y][z]!=Tt[x][y][z]) inv=false; } }
    USESYM=inv; if(getenv("TSOLVE_VERBOSE")) fprintf(stderr,"target %s under b->bS, c->S^-1 c: symmetry %s\n",inv?"invariant":"not invariant",inv?"on":"off"); }
  std::ifstream in(fn); std::string line;
  while(std::getline(in,line)){ std::string tag; auto p=line.find(':'); std::string body=line; if(p!=std::string::npos){ tag=line.substr(0,p); body=line.substr(p+1); }
    std::stringstream ss(body); std::vector<int> v; int x; while(ss>>x) v.push_back(x); if(v.empty()) continue;
    R=v.size(); if(R>32){ fprintf(stderr,"R too big\n"); return 3; } { int orA=0; for(int a:v) orA|=a; XL=XLT; while(XL<512 && (orA>>__builtin_ctz(XL))) XL<<=1; }
    for(int l=0;l<R;l++){ GRP[l]=l; for(int l2=0;l2<l;l2++) if(v[l2]==v[l]){ GRP[l]=GRP[l2]; break; } } for(int l=0;l<R;l++) GSZ[l]=0; for(int l=0;l<R;l++) GSZ[GRP[l]]++;
    for(int l=0;l<R;l++){ A[l]=v[l]; XS[l].clear(); for(int X=1;X<XL;X++) if(__builtin_parity(A[l]&X)) XS[l].push_back(X); }
    Solver* S=new Solver(); S->init(); S->maxnodes=maxnodes; bool pre=true; for(int X=1;X<XL;X++) if(rank9(TX[X])>S->u[X]) pre=false;
    auto t0=std::chrono::steady_clock::now(); if(pre) S->dfs(0); double dt=std::chrono::duration<double>(std::chrono::steady_clock::now()-t0).count();
    const char* res= S->found?"SAT":(S->aborted?"ABORT":"UNSAT");
    printf("%s %s| nodes %lld time %.2fs%s", res, line.c_str(), S->nodes, dt, pre?"":" (hyperplane fail)");
    if(S->found){ // verify
      bool ok=true; for(int x=0;x<9;x++) for(int y=0;y<9;y++) for(int z=0;z<9;z++){ int s=0; for(int l=0;l<R;l++) s^=((A[l]>>x)&1)&((S->B[l]>>y)&1)&((S->C[l]>>z)&1); if(s!=Tt[x][y][z]) ok=false; }
      printf(" | verified %d | B", (int)ok); for(int l=0;l<R;l++) printf(" %d",S->B[l]); printf(" C"); for(int l=0;l<R;l++) printf(" %d",S->C[l]); }
    printf("\n"); fflush(stdout); delete S; }
  return 0; }
