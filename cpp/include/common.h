#pragma once
#include <bits/stdc++.h>
using u8=uint8_t; using u16=uint16_t; using u32=uint32_t; using u64=uint64_t; using u128=unsigned __int128;
static inline int par9(int x){ return __builtin_parity(x); }
static inline int ip(int a,int b){ return __builtin_parity(a&b); }
// canonical RREF key of span(vs[0..n)), column-reversed (pivot = highest bit), full Gauss-Jordan, rows sorted by pivot desc
static inline u128 rref_key(const u16* vs,int n,int* dim_out){
  u16 piv[9]={0};
  for(int i=0;i<n;i++){ u16 v=vs[i];
    for(int b=8;b>=0&&v;b--) if((v>>b)&1){ if(piv[b]) v^=piv[b]; else { piv[b]=v; break; } } }
  // full reduce: for each pivot b, clear bit b in all other pivot rows
  for(int b=8;b>=0;b--) if(piv[b]) for(int c=8;c>=0;c--) if(c!=b && piv[c] && ((piv[c]>>b)&1)) piv[c]^=piv[b];
  u128 key=0; int d=0;
  for(int b=8;b>=0;b--) if(piv[b]){ key|=((u128)piv[b])<<(9*d); d++; }
  if(dim_out) *dim_out=d; return key;
}
struct KeyHash { size_t operator()(const u128& k) const { u64 a=(u64)k, b=(u64)(k>>64); return std::hash<u64>()(a*0x9E3779B97F4A7C15ULL ^ (b+0x632BE59BD9B4E019ULL)); } };
// open addressing hash table key->lb
struct LBTable {
  std::vector<u128> keys; std::vector<int8_t> vals; size_t mask;
  void load(const char* path){
    FILE* f=fopen(path,"rb"); if(!f){perror(path);exit(1);} fseek(f,0,SEEK_END); long sz=ftell(f); fseek(f,0,SEEK_SET);
    size_t n=sz/24; std::vector<char> buf(sz); if(fread(buf.data(),1,sz,f)!=(size_t)sz){perror("read");exit(1);} fclose(f);
    size_t cap=1; while(cap<n*2) cap<<=1; keys.assign(cap,(u128)0); vals.assign(cap,-1); mask=cap-1;
    for(size_t i=0;i<n;i++){ u64 hi,lo; int8_t lb; memcpy(&hi,&buf[24*i],8); memcpy(&lo,&buf[24*i+8],8); memcpy(&lb,&buf[24*i+16],1);
      u128 k=((u128)hi<<64)|lo; size_t h=KeyHash()(k)&mask; while(vals[h]!=-1){ h=(h+1)&mask; } keys[h]=k; vals[h]=lb; }
    // zero subspace (k=0) has key 0: stored with its lb (20 for full T)
    fprintf(stderr,"loaded %zu table entries\n",n);
  }
  inline void prefetch(u128 k) const { size_t h=KeyHash()(k)&mask; __builtin_prefetch(&keys[h]); __builtin_prefetch(&vals[h]); }
  int get(u128 k) const { size_t h=KeyHash()(k)&mask; while(vals[h]!=-1){ if(keys[h]==k) return vals[h]; h=(h+1)&mask; } return -100; }
};
static inline int rank3(int v){ // rank of 3x3 F2 matrix bits 3i+j
  int r0=v&7, r1=(v>>3)&7, r2=(v>>6)&7; int rows[3]={r0,r1,r2}; int rk=0;
  for(int b=2;b>=0;b--){ int p=-1; for(int i=rk;i<3;i++) if((rows[i]>>b)&1){p=i;break;} if(p<0) continue; std::swap(rows[rk],rows[p]); for(int i=0;i<3;i++) if(i!=rk && ((rows[i]>>b)&1)) rows[i]^=rows[rk]; rk++; }
  return rk; }
static inline int mat_mul(int a,int b){ int c=0; for(int i=0;i<3;i++) for(int j=0;j<3;j++){ int s=0; for(int k=0;k<3;k++) s^=((a>>(3*i+k))&1)&((b>>(3*k+j))&1); c|=s<<(3*i+j);} return c; }
static inline int transp(int a){ int c=0; for(int i=0;i<3;i++) for(int j=0;j<3;j++) if((a>>(3*i+j))&1) c|=1<<(3*j+i); return c; }
static std::vector<int> gl3list(){ std::vector<int> g; for(int v=0;v<512;v++) if(rank3(v)==3) g.push_back(v); return g; }
// group G on A*: c -> P c Q, P c^T Q.  returns perms[g][v]
static std::vector<std::array<u16,512>> build_group(){
  auto gl=gl3list(); std::vector<std::array<u16,512>> G; G.reserve(2*168*168);
  for(int t=0;t<2;t++) for(int P:gl) for(int Q:gl){ std::array<u16,512> a; for(int v=0;v<512;v++){ int c=t?transp(v):v; a[v]=(u16)mat_mul(mat_mul(P,c),Q);} G.push_back(a);} 
  return G; }
