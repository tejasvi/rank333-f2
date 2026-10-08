// quotinstc: C++ twin of quotinst.py (same outputs, byte for byte): turn completion instances for T mod E (first factors =
// coset representatives) into plain instances for tsolve/acchk --target.  L = reduce mod E (reduced echelon basis), then compress
// the non-pivot bits to coordinates 0..8-k; T' = (L x I x I) T, a'_t = L(alpha_t).
// Usage: quotinstc E(comma list) profiles_file out_prefix   (lines: ints separated by spaces/commas, optionally "[...]" or "tag: ...")
#include <bits/stdc++.h>
int main(int argc,char** argv){
  if(argc<4){ fprintf(stderr,"usage: quotinstc E profiles out\n"); return 1; }
  std::vector<int> E; { std::stringstream ss(argv[1]); std::string t; while(std::getline(ss,t,',')) E.push_back(std::stoi(t)); }
  std::vector<std::pair<int,int>> basis;   // (pivot, vector), reduced echelon
  for(int v:E){ for(auto& pb:basis) if((v>>pb.first)&1) v^=pb.second;
    if(v){ int p=31-__builtin_clz(v); for(auto& pb:basis) if((pb.second>>p)&1) pb.second^=v; basis.push_back({p,v}); } }
  std::set<int> piv; for(auto& pb:basis) piv.insert(pb.first); int k=basis.size(); std::vector<int> comp; for(int x=0;x<9;x++) if(!piv.count(x)) comp.push_back(x);
  auto L=[&](int a){ for(auto& pb:basis) if((a>>pb.first)&1) a^=pb.second; for(int p:piv) if((a>>p)&1){ fprintf(stderr,"L assert\n"); exit(2); }
    int r=0; for(size_t i=0;i<comp.size();i++) if((a>>comp[i])&1) r|=1<<i; return r; };
  for(int v:E) if(L(v)!=0){ fprintf(stderr,"E not in kernel\n"); return 2; }
  int LT[512]; for(int a=0;a<512;a++) LT[a]=L(a);
  // target tensor T' (sorted by (x,y,z) like the python dict sort)
  std::map<std::tuple<int,int,int>,int> Tp;
  for(int i=0;i<3;i++) for(int j=0;j<3;j++) for(int k2=0;k2<3;k2++){ int x=3*i+j, y=3*j+k2, z=3*k2+i; int lx=LT[1<<x];
    for(int xp=0;xp<9;xp++) if((lx>>xp)&1) Tp[{xp,y,z}]^=1; }
  std::string out=argv[3]; { FILE* f=fopen((out+".t").c_str(),"w"); for(auto& kv:Tp) if(kv.second) fprintf(f,"%d %d %d\n",std::get<0>(kv.first),std::get<1>(kv.first),std::get<2>(kv.first)); fclose(f); }
  FILE* in=fopen(argv[2],"r"); FILE* fa=fopen((out+".a").c_str(),"w"); if(!in||!fa){ fprintf(stderr,"io\n"); return 3; }
  static char buf[1<<16]; long long n=0; std::set<int> sizes; std::string o; o.reserve(1<<20);
  while(fgets(buf,sizeof buf,in)){ char* s=buf; char* c=strchr(s,':'); if(c) s=c+1; char* lb=strchr(s,'['); if(lb){ s=lb+1; char* rb=strchr(s,']'); if(rb) *rb=0; }
    std::vector<int> vals; char* p=s; while(*p){ while(*p && !isdigit((unsigned char)*p) && *p!='-') p++; if(!*p) break; char* q; long v=strtol(p,&q,10); if(q==p){ p++; continue; } vals.push_back((int)v); p=q; }
    if(vals.empty()) continue;
    char tmp[32]; snprintf(tmp,sizeof tmp,"%lld:",n); o+=tmp; for(int v:vals){ int a=LT[v&511]; if(!a){ fprintf(stderr,"a coset in E\n"); return 4; } snprintf(tmp,sizeof tmp," %d",a); o+=tmp; } o+='\n';
    sizes.insert(vals.size()); n++; if(o.size()>(1u<<20)){ fwrite(o.data(),1,o.size(),fa); o.clear(); } }
  fwrite(o.data(),1,o.size(),fa); fclose(fa); fclose(in);
  int te=0; for(auto& kv:Tp) te+=kv.second;
  printf("E=["); for(size_t i=0;i<E.size();i++) printf("%s%d",i?", ":"",E[i]); printf("] dim %d profiles %lld sizes [",k,n); bool first=true; for(int z:sizes){ printf("%s%d",first?"":", ",z); first=false; } printf("] target entries %d\n",te);
  return 0; }
