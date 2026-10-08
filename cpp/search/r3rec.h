// r3rec.h: the record walker of the R3 certificate stream (prof7R3.cc header comment), shared by r3cat.cc and prof7R3q (QUEUE.md).
// Add a new tag here once.  The includer defines `[[noreturn]] void die(const std::string&)` before including.
// Header flags of a pcert file: #leafx 1 (leaf codes 5/6/7 carry a row id / a W-list), #cutx 1 (node cuts 5/6 carry a bulk-peel
// certificate: u8 ok; if ok varint n, n x varint row id, varint len + node record, varint len + child certificate).
#pragma once
#include <string>
#include <cstdint>
static bool gLeafx=false, gCutx=false, gLeafv7=false;   // gLeafv7: #leafv7 1 (batch 13): LEAF 0 carries varint nbits + ceil(nbits/8) bytes (v7 leaf record)
struct Rd { const uint8_t* p; size_t n, i=0; Rd(const string& s):p((const uint8_t*)s.data()),n(s.size()){}
  bool more() const { return i<n; } uint8_t u8(){ if(i>=n) die("truncated record"); return p[i++]; }
  unsigned u16(){ unsigned a=u8(); return a|(u8()<<8); }
  unsigned long long var(){ unsigned long long x=0; int sh=0; while(true){ uint8_t c=u8(); x|=(unsigned long long)(c&127)<<sh; if(!(c&128)) break; sh+=7; } return x; } };
// length of the record at r.i (r.i advanced past it); fills tag
static void skipFk(Rd& r){ int ne=(int)r.var(); for(int j=0;j<ne;j++) r.var(); auto nc=r.var(); for(unsigned long long j=0;j<nc;j++){ int t=r.u8(); if(t==0){ auto L=r.var(); for(unsigned long long q=0;q<L;q++) r.var(); } else if(t<=3) r.var(); else r.u16(); r.var(); } r.var(); }
static void skipRec(Rd& r,uint8_t& tag){ tag=r.u8();
  switch(tag){ case 0x01: r.u16(); break; case 0x02: { int c=r.u8(); if(gLeafx){ if(c==5) r.var(); else if(c==6||c==7){ int n=r.u8(); for(int k=0;k<n;k++) r.u16(); r.u8(); } } if(gLeafv7 && c==0){ auto nb=r.var(); for(unsigned long long k=0;k<(nb+7)/8;k++) r.u8(); } break; }
    case 0x03: { int k=r.u8(); if(k==1) r.u16(); else if(k==2||k==4||k==5||k==6||k==10){ r.var(); if(gCutx && (k==5||k==6)){ int ok=r.u8(); if(ok){ auto ne=r.var(); for(unsigned long long j=0;j<ne;j++) r.var(); auto L1=r.var(); for(unsigned long long j=0;j<L1;j++) r.u8(); auto L2=r.var(); for(unsigned long long j=0;j<L2;j++) r.u8(); } } } else if(k==3) r.u8(); else if(k==11){ r.u8(); int ak=r.u8(); if(ak==1||ak==2){ int dm=r.u8(); for(int j=0;j<dm;j++) r.u16(); } else r.u8(); } break; }
    case 0x04: case 0x05: case 0x06: break;
    case 0x10: { auto n=r.var(); for(unsigned long long j=0;j<n;j++) r.var(); break; }
    case 0x11: { auto a=r.var(), b=r.var(), c=r.var(), e=r.var(); for(unsigned long long j=0;j<a+b+c+e;j++) r.var(); break; }
    case 0x12: { auto n=r.var(); for(unsigned long long j=0;j<n;j++){ r.var(); r.u8(); } break; }
    case 0x13: { auto n=r.var(); for(unsigned long long j=0;j<n;j++){ r.var(); int dm=r.u8(); for(int k=0;k<dm;k++) r.u16(); } break; }
    case 0x20: { r.var(); int x=r.u8(); for(int j=0;j<x;j++) r.var(); break; }
    case 0x21: { r.var(); int x=r.u8(), c=r.u8(); for(int j=0;j<x+c;j++) r.var(); break; }
    case 0x22: { r.var(); r.u8(); r.var(); int ch=r.u8(); if(ch==1 || ch==3) skipFk(r); else if(ch==5){ auto ne=r.var(); for(unsigned long long j=0;j<ne;j++) r.var(); auto L=r.var(); for(unsigned long long j=0;j<L;j++) r.u8(); } else if(ch!=0 && ch!=2) die("X choice "+to_string(ch)+" not known to this reader"); break; }
    case 0x23: { r.var(); r.u8(); r.u8(); r.u8(); r.u8(); break; }
    case 0x24: { r.var(); r.u16(); break; }
    case 0x25: case 0x26: case 0x28: r.var(); break;
    case 0x27: { r.var(); int ak=r.u8(); if(ak==1||ak==2){ int dm=r.u8(); for(int j=0;j<dm;j++) r.u16(); } else r.u8(); break; }
    case 0x29: { for(int j=0;j<6;j++) r.var(); break; }
    case 0x2B: { auto L=r.var(); for(unsigned long long j=0;j<L;j++) r.u8(); break; }
    case 0x2A: { r.u16(); r.var(); r.var(); break; }
    case 0x2C: r.u16(); break;   // RNG l (QUEUE.md): S's children from label l on are a range segment
    case 0x2D: r.var(); r.var(); break;   // JOB delta ix (QUEUE.md §8): a frontier job of a top segment (kind 4)
    default: die("unknown tag "+to_string(tag)+" at byte "+to_string(r.i-1)); } }

