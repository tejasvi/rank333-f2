// r3cat.cc: reader for the prof7R3 --pcert stream (format: header comment of prof7R3.cc, r22/lean/rerun/R3.md).
//   r3cat stats FILE...                 per-file block/segment counts, records and bytes by tag, nodes per segment kind
//   r3cat jobs FILE                      jobs with a complete root segment (or replay cut), and their piece segments
//   r3cat job FILE JOB [OUT]             the job's canonical stream: root segment with every DON (piece of this file), SKP and SKR
//                                        (bytes of an earlier file) replaced by the referenced records, recursively; binary to OUT
//                                        (default stdout); exit 1 if a reference cannot be resolved or a segment is incomplete
//   r3cat text FILE JOB                  the same stream as text, one record per line, absolute labels (header line "#lab")
//   r3cat textbin FILE.bin LABFILE       text of an assembled binary stream (LABFILE: a pcert file for the label order)
//   r3cat md5 FILE JOB...                md5 of each job's canonical stream (resume tests)
//   r3cat top|toptext|topmd5 FILE IX...  a kind-4 top segment (--pctop, QUEUE.md §8): bytes / text / md5; JOB records stay references
// Build: g++ -O2 -std=c++17 r3cat.cc -o r3cat -lcrypto   (md5 via OpenSSL's MD5; falls back to FNV if -DNOMD5)
#include <bits/stdc++.h>
#include <unistd.h>
#include <fcntl.h>
#include <nmmintrin.h>
#ifndef NOMD5
#include <openssl/md5.h>
#endif
using namespace std;
static uint32_t crc32c(const void* p,size_t n){ uint64_t c=0xFFFFFFFFu; const uint8_t* b=(const uint8_t*)p; size_t i=0;
  for(;i+8<=n;i+=8){ uint64_t x; memcpy(&x,b+i,8); c=_mm_crc32_u64(c,x); } for(;i<n;i++) c=_mm_crc32_u8((uint32_t)c,b[i]); return (uint32_t)c^0xFFFFFFFFu; }
[[noreturn]] static void die(const string& m){ fprintf(stderr,"r3cat: %s\n",m.c_str()); exit(1); }
#include "r3rec.h"

struct Chunk { uint32_t idx; long long off; uint32_t len; };   // record bytes at file offset off
struct Seg { unsigned long long id=0; int job=-1, kind=-1, d0=0; vector<int> pre; uint64_t dinh[8]={0}; vector<long long> win; vector<Chunk> ch; bool last=false; long long bytes=0; };   // win: header witness rows (#pcwit 1)
struct PFile {
  string path; int fd=-1; vector<int> lab; string table, kept, typecut="0"; bool leafx=false, xpvar=false, pcwit=false; map<int,string> src; unsigned long long fp=0;
  unordered_map<unsigned long long,Seg> seg; map<pair<int,vector<int>>,unsigned long long> byKey;   // (job, prefix) -> segment
  long long nblocks=0, badtail=0, fsize=0;
  void open_(const string& p){ path=p; fd=::open(p.c_str(),O_RDONLY); if(fd<0) die("cannot open "+p);
    fsize=lseek(fd,0,SEEK_END); FILE* f=fopen(p.c_str(),"rb"); char line[1<<16]; long long pos=0; bool end=false;
    while(fgets(line,sizeof line,f)){ pos+=strlen(line); string s(line); if(s.rfind("#end",0)==0){ end=true; break; }
      istringstream is(s); string t; is>>t;
      if(t=="#R3PC"){ string v,f2; is>>v>>f2; if(f2.rfind("fp=",0)==0) fp=stoull(f2.substr(3),nullptr,16); }
      else if(t=="#lab"){ int n; is>>n; lab.resize(n); for(int i=0;i<n;i++) is>>lab[i]; }
      else if(t=="#table") is>>table; else if(t=="#kept") is>>kept; else if(t=="#typecut") is>>typecut; else if(t=="#leafx"){ leafx=true; gLeafx=true; } else if(t=="#cutx") gCutx=true; else if(t=="#xpvar") xpvar=true; else if(t=="#pcwit") pcwit=true; else if(t=="#leafv7") gLeafv7=true; else if(t=="#src"){ int k; string q; is>>k>>q; src[k]=q; } }
    fclose(f); if(!end) die(p+": no #end header line");
    long long o=pos; vector<uint8_t> buf;
    while(o+12<=fsize){ uint32_t h[3]; if(pread(fd,h,12,o)!=12) break; if(h[0]!=0x31423352u || o+12+(long long)h[1]>fsize){ badtail=fsize-o; break; }
      buf.resize(h[1]); if(pread(fd,buf.data(),h[1],o+12)!=(ssize_t)h[1]) break; if(crc32c(buf.data(),h[1])!=h[2]){ badtail=fsize-o; break; }
      unsigned long long id; uint32_t ci; memcpy(&id,&buf[0],8); memcpy(&ci,&buf[8],4); uint8_t fl=buf[12]; size_t q=13;
      Seg& S=seg[id]; S.id=id;
      if(fl&1){ auto rv=[&](){ unsigned long long x=0; int sh=0; while(true){ uint8_t c=buf[q++]; x|=(unsigned long long)(c&127)<<sh; if(!(c&128)) break; sh+=7; } return x; };
        S.job=(int)rv(); S.kind=buf[q++]; S.d0=buf[q++]; S.pre.resize(S.d0); for(int i=0;i<S.d0;i++){ S.pre[i]=buf[q]|(buf[q+1]<<8); q+=2; } memcpy(S.dinh,&buf[q],64); q+=64; if(pcwit){ auto n=rv(); long long pr=0; S.win.clear(); for(unsigned long long j=0;j<n;j++){ pr+=(long long)rv(); S.win.push_back(pr); } }
        byKey[{S.job,S.pre}]=id; }
      S.ch.push_back({ci,o+12+(long long)q,(uint32_t)(h[1]-q)}); S.bytes+=h[1]-q; if(fl&2) S.last=true; nblocks++; o+=12+h[1]; }
    for(auto& kv:seg){ auto& c=kv.second.ch; sort(c.begin(),c.end(),[](const Chunk& a,const Chunk& b){ return a.idx<b.idx; });
      for(size_t i=0;i<c.size();i++) if(c[i].idx!=i){ kv.second.last=false; break; } } }   // a gap: incomplete
  string read(const Seg& S,long long b,long long e) const {   // logical bytes [b,e) of a segment
    string out; long long p=0; for(const Chunk& c:S.ch){ long long cb=p, ce=p+c.len; p=ce; if(ce<=b || cb>=e) continue;
      long long s0=max(b,cb), s1=min(e,ce); size_t n=(size_t)(s1-s0); size_t o0=out.size(); out.resize(o0+n); if(pread(fd,&out[o0],n,c.off+(s0-cb))!=(ssize_t)n) die("read error");
    } if((long long)out.size()!=e-b) die(path+": segment "+to_string(S.id)+" is shorter than the referenced range");
    return out; }
  string all(const Seg& S) const { return read(S,0,S.bytes); }
};
static map<string,unique_ptr<PFile>> FILES;
static PFile& getF(const string& p){ auto it=FILES.find(p); if(it!=FILES.end()) return *it->second; auto f=make_unique<PFile>(); f->open_(p); PFile& r=*f; FILES[p]=move(f); return r; }

// ---- assembly: copy records, replacing DON / SKP / SKR by the referenced records ----
struct Frame { int depth, label, last; vector<long long> vr={}; };   // vr: the VROWS row ids cited at this node (r3cat wit)
struct Asm { string out; long long nrefs=0, npieces=0, nwEq=0, nwNe=0; int job; bool wit=false; PFile* top=nullptr; vector<string> wl;   // wit: one line per piece segment (witness rows of its D)
  void run(PFile& F,const string& bytes,vector<int> prefix,vector<Frame>& st,int depth=0){
    Rd r(bytes); if(depth>64) die("reference depth > 64");
    while(r.more()){ size_t a=r.i; uint8_t tag=r.p[r.i];
      if(tag==0x28 || tag==0x29 || tag==0x2A){ r.u8();
        if(tag==0x28){ if(st.empty()) die("DON outside a node"); Frame& fr=st.back(); int c=fr.last+(int)r.var(); fr.last=c;
          vector<int> pk=fr_prefix(prefix,st); pk.push_back(c); auto it=F.byKey.find({job,pk}); if(it==F.byKey.end()) die("DON: no piece segment for job "+to_string(job));
          const Seg& S=F.seg.at(it->second); if(!S.last) die("DON: piece segment incomplete"); npieces++;
          if(wit){ string w=(&F==top)?"seg "+to_string(S.id)+" "+to_string(S.kind):"segf "+F.path+" "+to_string(S.id)+" "+to_string(S.kind); vector<long long> W; for(const Frame& f:st) for(long long x:f.vr) W.push_back(x);
            sort(W.begin(),W.end()); W.erase(unique(W.begin(),W.end()),W.end()); for(long long x:W) w+=" "+to_string(x); wl.push_back(w);
            if(F.pcwit){ if(W==S.win) nwEq++; else nwNe++; } }
          run(F,F.all(S),prefix,st,depth+1); }
        else if(tag==0x29){ if(st.empty()) die("SKR outside a node"); Frame& fr=st.back(); int lo=fr.last+(int)r.var(); int hi=lo+(int)r.var(); int k=(int)r.var(); unsigned long long sg=r.var(); long long b=(long long)r.var(), e=(long long)r.var();
          auto si=F.src.find(k); if(si==F.src.end()) die("SKR: unknown source "+to_string(k)); PFile& G=getF(si->second); auto it=G.seg.find(sg); if(it==G.seg.end()) die("SKR: no segment "+to_string(sg)+" in "+G.path);
          nrefs++; size_t before=out.size(); run(G,G.read(it->second,b,e),prefix,st,depth+1); (void)before; st.back().last=hi; }
        else { int lab=(int)r.u16(); int k=(int)r.var(); unsigned long long sg=r.var(); auto si=F.src.find(k); if(si==F.src.end()) die("SKP: unknown source "+to_string(k));
          PFile& G=getF(si->second); auto it=G.seg.find(sg); if(it==G.seg.end()) die("SKP: no segment "+to_string(sg)+" in "+G.path); if(!it->second.last) die("SKP: segment incomplete");
          nrefs++; if(!st.empty()) st.back().last=lab; run(G,G.all(it->second),prefix,st,depth+1); }
        continue; }
      uint8_t t2; skipRec(r,t2); out.append(bytes,a,r.i-a);
      // stack upkeep for the DON keys and child deltas
      Rd q(bytes); q.i=a; q.u8();
      if(t2==0x01){ unsigned x=q.u16(); int d=(int)(x>>9), l=(int)(x&511); while(!st.empty() && st.back().depth>=d) die("NODE at depth "+to_string(d)+" inside an unclosed node of depth "+to_string(st.back().depth)); if(!st.empty()){ if(st.back().depth!=d-1) die("NODE depth jump"); st.back().last=l; } pend={d,l,l}; havePend=true; }
      else if(t2==0x04){ if(!havePend) die("OPEN without NODE"); st.push_back(pend); havePend=false; }
      else if(t2==0x05){ if(st.empty()) die("END without OPEN"); st.pop_back(); }
      else if(t2==0x02 || t2==0x03){ havePend=false; }
      else if(t2==0x10){ if(wit && !havePend && !st.empty()){ auto n=q.var(); long long p=0; st.back().vr.clear(); for(unsigned long long j=0;j<n;j++){ p+=(long long)q.var(); st.back().vr.push_back(p); } } }   // VROWS right after OPEN (a cut node's VROWS comes before its CUT: havePend)
      else if((t2>=0x20 && t2<=0x27) || t2==0x2D){ if(st.empty()) die("child record outside a node"); st.back().last+=(int)q.var(); } } }
  Frame pend{0,0,0}; bool havePend=false;
  static vector<int> fr_prefix(const vector<int>& base,const vector<Frame>& st){ vector<int> p=base; for(const Frame& f:st) if((int)p.size()<f.depth) p.push_back(f.label); return p; } };

static string assembleJob(PFile& F,int job,long long* nref=nullptr,long long* npc=nullptr){
  const Seg* root=nullptr; for(auto& kv:F.seg){ const Seg& S=kv.second; if(S.job==job && (S.kind==0 || S.kind==2) && S.last){ if(root) die("two complete root segments for job "+to_string(job)); root=&S; } }
  if(!root) die("no complete root segment for job "+to_string(job)+" in "+F.path);
  Asm A; A.job=job; vector<Frame> st; vector<int> base(root->pre.begin(),root->pre.end()-(root->kind==0?1:0));
  if(root->kind==2) return F.all(*root);
  A.run(F,F.all(*root),base,st); if(!st.empty()) die("unclosed node at the end of job "+to_string(job));
  if(nref) *nref=A.nrefs; if(npc) *npc=A.npieces; return A.out; }

static string assembleTop(PFile& F,int ix,long long* nref=nullptr,long long* npc=nullptr){   // a kind-4 top segment (QUEUE.md §8); JOBs stay references
  const Seg* root=nullptr; for(auto& kv:F.seg){ const Seg& S=kv.second; if(S.job==ix && S.kind==4 && S.last){ if(root) die("two complete top segments "+to_string(ix)); root=&S; } }
  if(!root) die("no complete top segment "+to_string(ix)+" in "+F.path);
  Asm A; A.job=ix; vector<Frame> st; vector<int> base(root->pre.begin(),root->pre.end()-1);
  A.run(F,F.all(*root),base,st); if(!st.empty()) die("unclosed node at the end of top segment "+to_string(ix));
  if(nref) *nref=A.nrefs; if(npc) *npc=A.npieces; return A.out; }
static const char* TAGN(int t){ switch(t){ case 1: return "NODE"; case 2: return "LEAF"; case 3: return "CUT"; case 4: return "OPEN"; case 5: return "END"; case 6: return "ABORT";
  case 0x10: return "VROWS"; case 0x11: return "XROWS"; case 0x12: return "WB"; case 0x13: return "BLK"; case 0x20: return "T"; case 0x21: return "C"; case 0x22: return "X";
  case 0x23: return "CANON"; case 0x24: return "PREFF"; case 0x25: return "TYPE"; case 0x26: return "DOOM"; case 0x27: return "ADDF"; case 0x28: return "DON"; case 0x29: return "SKR"; case 0x2A: return "SKP"; case 0x2B: return "XPN"; case 0x2C: return "RNG"; case 0x2D: return "JOB"; } return "?"; }

static void toText(const string& s,FILE* o){   // one record per line, absolute labels
  Rd r(s); vector<Frame> st; Frame pend{0,0,0}; bool hp=false;
  while(r.more()){ uint8_t t=r.u8();
    auto child=[&](){ if(st.empty()) die("child record outside a node"); st.back().last+=(int)r.var(); return st.back().last; };
    switch(t){
      case 0x01: { unsigned x=r.u16(); int d=x>>9, l=x&511; if(!st.empty()) st.back().last=l; pend={d,l,l}; hp=true; fprintf(o,"N %d %d\n",d,l); break; }
      case 0x02: { int c=r.u8(); fprintf(o,"L %d",c); if(gLeafx){ if(c==5) fprintf(o," row %llu",r.var()); else if(c==6||c==7){ int n=r.u8(); fprintf(o," wl"); for(int k=0;k<n;k++) fprintf(o," %u",r.u16()); fprintf(o," cap %d",(int)r.u8()-1); } }
        if(gLeafv7 && c==0){ auto nb=r.var(); fprintf(o," v7 %llu ",nb); for(unsigned long long k=0;k<(nb+7)/8;k++) fprintf(o,"%02x",r.u8()); } fprintf(o,"\n"); hp=false; break; }
      case 0x03: { int k=r.u8(); fprintf(o,"C %d",k); if(k==1) fprintf(o," %u",r.u16()); else if(k==2||k==4||k==5||k==6||k==10){ fprintf(o," %llu",r.var()); if(gCutx && (k==5||k==6)){ int ok=r.u8(); fprintf(o," xp %d",ok); if(ok){ auto ne=r.var(); fprintf(o," ex"); for(unsigned long long j=0;j<ne;j++) fprintf(o," %llu",r.var()); auto L1=r.var(); fprintf(o," node "); for(unsigned long long j=0;j<L1;j++) fprintf(o,"%02x",r.u8()); auto L2=r.var(); fprintf(o," cert "); for(unsigned long long j=0;j<L2;j++) fprintf(o,"%02x",r.u8()); } } } else if(k==3) fprintf(o," %d",r.u8());
        else if(k==11){ int p=r.u8(), ak=r.u8(); fprintf(o," %d %d",p,ak); if(ak==1||ak==2){ int dm=r.u8(); fprintf(o," %d",dm); for(int j=0;j<dm;j++) fprintf(o," %u",r.u16()); } else fprintf(o," %d",r.u8()); }
        fprintf(o,"\n"); hp=false; break; }
      case 0x04: fprintf(o,"O\n"); if(!hp) die("OPEN without NODE"); st.push_back(pend); hp=false; break;
      case 0x05: fprintf(o,"E\n"); if(st.empty()) die("END"); st.pop_back(); break;
      case 0x06: fprintf(o,"A\n"); break;
      case 0x10: { auto n=r.var(); long long p=0; fprintf(o,"V"); for(unsigned long long j=0;j<n;j++){ p+=(long long)r.var(); fprintf(o," %lld",p); } fprintf(o,"\n"); break; }
      case 0x11: { auto a=r.var(), b=r.var(), c=r.var(), e=r.var(); fprintf(o,"XR %llu %llu %llu %llu :",a,b,c,e); for(unsigned long long j=0;j<a+b+c+e;j++) fprintf(o," %llu",r.var()); fprintf(o,"\n"); break; }
      case 0x12: { auto n=r.var(); int pl=st.empty()?0:st.back().label; fprintf(o,"WB"); for(unsigned long long j=0;j<n;j++){ pl+=(int)r.var(); fprintf(o," %d:%d",pl,r.u8()); } fprintf(o,"\n"); break; }
      case 0x13: { auto n=r.var(); int pl=st.empty()?0:st.back().label; fprintf(o,"BK"); for(unsigned long long j=0;j<n;j++){ pl+=(int)r.var(); int dm=r.u8(); fprintf(o," %d:%d",pl,dm); for(int k=0;k<dm;k++) fprintf(o,",%u",r.u16()); } fprintf(o,"\n"); break; }
      case 0x20: { int l=child(); int x=r.u8(); fprintf(o,"T %d :",l); for(int j=0;j<x;j++) fprintf(o," %llu",r.var()); fprintf(o,"\n"); break; }
      case 0x21: { int l=child(); int x=r.u8(), c=r.u8(); fprintf(o,"CV %d %d %d :",l,x,c); for(int j=0;j<x+c;j++) fprintf(o," %llu",r.var()); fprintf(o,"\n"); break; }
      case 0x22: { int l=child(); int k=r.u8(); unsigned long long bb=r.var(); int ch=r.u8(); fprintf(o,"X %d %d %llu %d",l,k,bb,ch);
        if(ch==1 || ch==3){ int ne=(int)r.var(); fprintf(o," ex"); for(int j=0;j<ne;j++) fprintf(o," %llu",r.var()); auto nc=r.var(); fprintf(o," con %llu",nc);
          for(unsigned long long j=0;j<nc;j++){ int t=r.u8(); fprintf(o," | %d",t); if(t==0){ auto L=r.var(); int pl=l; for(unsigned long long q=0;q<L;q++){ pl+=(int)r.var(); fprintf(o," %d",pl); } } else if(t<=3) fprintf(o," %llu",r.var()); else fprintf(o," %u",r.u16()); fprintf(o," * %llu",r.var()); }
          unsigned long long z=r.var(); long long w=(long long)(z>>1)^-(long long)(z&1); fprintf(o," | w %lld",w); }
        else if(ch==5){ auto ne=r.var(); fprintf(o," ex"); for(unsigned long long j=0;j<ne;j++) fprintf(o," %llu",r.var()); auto L=r.var(); fprintf(o," cert "); for(unsigned long long j=0;j<L;j++) fprintf(o,"%02x",r.u8()); }
        fprintf(o,"\n"); break; }
      case 0x23: { int l=child(); int ty=r.u8(); unsigned g=r.u8(); g|=r.u8()<<8; g|=r.u8()<<16; fprintf(o,"CN %d %d %u %u %u\n",l,ty,g>>18,(g>>9)&511,g&511); break; }
      case 0x24: { int l=child(); fprintf(o,"P %d %u\n",l,r.u16()); break; }
      case 0x25: fprintf(o,"TY %d\n",child()); break; case 0x26: fprintf(o,"DM %d\n",child()); break; case 0x28: fprintf(o,"DN %d\n",child()); break;
      case 0x27: { int l=child(); int ak=r.u8(); fprintf(o,"AF %d %d",l,ak); if(ak==1||ak==2){ int dm=r.u8(); fprintf(o," %d",dm); for(int j=0;j<dm;j++) fprintf(o," %u",r.u16()); } else fprintf(o," %d",r.u8()); fprintf(o,"\n"); break; }
      case 0x29: { if(st.empty()) die("SKR"); int lo=st.back().last+(int)r.var(); int hi=lo+(int)r.var(); long long a[4]; for(int j=0;j<4;j++) a[j]=(long long)r.var(); st.back().last=hi; fprintf(o,"SR %d %d %lld %lld %lld %lld\n",lo,hi,a[0],a[1],a[2],a[3]); break; }
      case 0x2A: { int l=r.u16(); long long k=(long long)r.var(), sg=(long long)r.var(); if(!st.empty()) st.back().last=l; fprintf(o,"SP %d %lld %lld\n",l,k,sg); break; }
      case 0x2B: { auto L=r.var(); fprintf(o,"XPN "); for(unsigned long long j=0;j<L;j++) fprintf(o,"%02x",r.u8()); fprintf(o,"\n"); break; }
      case 0x2D: { int l=child(); fprintf(o,"JB %d %llu\n",l,r.var()); break; }
      default: die("unknown tag "+to_string(t)); } } }

static string md5hex(const string& s){
#ifndef NOMD5
  unsigned char h[16]; MD5((const unsigned char*)s.data(),s.size(),h); char b[40]; for(int i=0;i<16;i++) sprintf(b+2*i,"%02x",h[i]); return string(b,32);
#else
  unsigned long long h=1469598103934665603ULL; for(unsigned char c:s){ h^=c; h*=1099511628211ULL; } char b[20]; sprintf(b,"%016llx",h); return b;
#endif
}

int main(int argc,char** argv){
  if(argc<3){ fprintf(stderr,"usage: r3cat stats|jobs|job|text|md5|textbin|top|toptext|topmd5|wit ...\n"); return 2; }
  string cmd=argv[1];
  if(cmd=="stats"){ for(int a=2;a<argc;a++){ PFile& F=getF(argv[a]); long long nseg[5]={0,0,0,0,0}, inc=0, bytes=0; map<int,long long> cnt, byt; long long nodes[3]={0,0,0};
      for(auto& kv:F.seg){ const Seg& S=kv.second; if(S.kind>=0 && S.kind<5) nseg[S.kind]++; if(!S.last){ inc++; continue; } string b=F.all(S); bytes+=b.size(); Rd r(b);
        while(r.more()){ size_t i0=r.i; uint8_t t; skipRec(r,t); cnt[t]++; byt[t]+=r.i-i0; if(t==1 && S.kind>=0 && S.kind<3) nodes[S.kind]++; } }
      printf("%s: blocks %lld, segments root %lld piece %lld replaycut %lld range %lld top %lld (incomplete %lld), torn tail %lld bytes, record bytes %lld\n",F.path.c_str(),F.nblocks,nseg[0],nseg[1],nseg[2],nseg[3],nseg[4],inc,F.badtail,bytes);
      long long nn=cnt[1]; printf("  nodes %lld (in roots %lld, pieces %lld): %.1f B/node\n",nn,nodes[0],nodes[1],nn?(double)bytes/nn:0.0);
      for(auto& kv:cnt) printf("  %-6s %12lld records %14lld bytes  %7.1f B/node  %5.1f%%\n",TAGN(kv.first),kv.second,byt[kv.first],nn?(double)byt[kv.first]/nn:0.0,bytes?100.0*byt[kv.first]/bytes:0.0); }
    return 0; }
  if(cmd=="jobs"){ PFile& F=getF(argv[2]); map<int,array<long long,4>> J; for(auto& kv:F.seg){ const Seg& S=kv.second; auto& a=J[S.job]; if(S.kind==0||S.kind==2){ a[0]+=S.last; a[1]+=!S.last; } else { a[2]+=S.last; a[3]+=!S.last; } }
    for(auto& kv:J) printf("job %d root complete %lld incomplete %lld pieces complete %lld incomplete %lld\n",kv.first,kv.second[0],kv.second[1],kv.second[2],kv.second[3]); return 0; }
  if(cmd=="job" || cmd=="text"){ if(argc<4) die("job FILE JOB"); PFile& F=getF(argv[2]); long long nr=0, np=0; string s=assembleJob(F,atoi(argv[3]),&nr,&np);
    if(cmd=="job"){ FILE* o=argc>4?fopen(argv[4],"wb"):stdout; fwrite(s.data(),1,s.size(),o); if(o!=stdout) fclose(o); }
    else { printf("#lab"); for(int v:F.lab) printf(" %d",v); printf("\n#kept %s\n#table %s\n#typecut %s\n",F.kept.c_str(),F.table.c_str(),F.typecut.c_str()); if(F.xpvar) printf("#xpvar 1\n"); if(F.pcwit) printf("#pcwit 1\n"); if(gLeafv7) printf("#leafv7 1\n"); const Seg* rs=nullptr; for(auto& kv:F.seg) if(kv.second.job==atoi(argv[3]) && (kv.second.kind==0||kv.second.kind==2) && kv.second.last) rs=&kv.second;
      if(rs){ printf("#root %d %d",rs->job,rs->kind); for(int l:rs->pre) printf(" %d",l); printf("\n"); } toText(s,stdout); }
    fprintf(stderr,"job %s: %zu bytes, %lld pieces, %lld skip references\n",argv[3],s.size(),np,nr); return 0; }
  if(cmd=="top" || cmd=="toptext" || cmd=="topmd5"){ if(argc<4) die(cmd+" FILE IX..."); PFile& F=getF(argv[2]);
    for(int a=3;a<argc;a++){ long long nr=0, np=0; string s=assembleTop(F,atoi(argv[a]),&nr,&np);
      if(cmd=="topmd5") printf("%s %s %zu\n",argv[a],md5hex(s).c_str(),s.size());
      else if(cmd=="top") fwrite(s.data(),1,s.size(),stdout);
      else { const Seg* rs=nullptr; for(auto& kv:F.seg) if(kv.second.job==atoi(argv[a]) && kv.second.kind==4 && kv.second.last) rs=&kv.second;
        printf("#lab"); for(int v:F.lab) printf(" %d",v); printf("\n#kept %s\n#table %s\n#typecut %s\n",F.kept.c_str(),F.table.c_str(),F.typecut.c_str()); if(F.xpvar) printf("#xpvar 1\n"); printf("#root %d 4",atoi(argv[a])); for(int l:rs->pre) printf(" %d",l); printf("\n"); toText(s,stdout); } }
    return 0; }
  if(cmd=="wit"){ if(argc<4) die("wit FILE JOB..."); PFile& F=getF(argv[2]);   // per piece segment of each job: the VROWS rows cited at the donor node and its ancestors in the job (their label masks' union is the segment's D)
    for(int a=3;a<argc;a++){ int job=atoi(argv[a]); const Seg* root=nullptr; for(auto& kv:F.seg){ const Seg& S=kv.second; if(S.job==job && (S.kind==0 || S.kind==2) && S.last) root=&S; }
      if(!root) die("no complete root segment for job "+to_string(job)); printf("job %d\n",job); if(root->kind==2) continue;
      Asm A; A.job=job; A.wit=true; A.top=&F; vector<Frame> st; vector<int> base(root->pre.begin(),root->pre.end()-1); A.run(F,F.all(*root),base,st);
      for(const string& w:A.wl) printf("%s\n",w.c_str());
      if(F.pcwit) fprintf(stderr,"job %d: header witnesses (#pcwit) equal to the recomputed ones: %lld, different: %lld\n",job,A.nwEq,A.nwNe); }
    return 0; }
  if(cmd=="md5"){ PFile& F=getF(argv[2]); for(int a=3;a<argc;a++){ long long nr=0, np=0; string s=assembleJob(F,atoi(argv[a]),&nr,&np); printf("%s %s %zu pieces %lld refs %lld\n",argv[a],md5hex(s).c_str(),s.size(),np,nr); } return 0; }
  if(cmd=="textbin"){ ifstream f(argv[2],ios::binary); string s((istreambuf_iterator<char>(f)),istreambuf_iterator<char>()); PFile& F=getF(argv[3]); printf("#lab"); for(int v:F.lab) printf(" %d",v); printf("\n"); toText(s,stdout); return 0; }
  die("unknown command "+cmd); }
