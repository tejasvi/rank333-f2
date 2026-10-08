#!/usr/bin/env python3
"""bin7.py: R22N.Bin7 reference codec (7 payload bits per ASCII char, little-endian bit stream, zero padding).
   encode(bytes) -> bytes (all < 128); decode(bytes) -> bytes of length floor(7n/8).  CLI: bin7.py enc|dec IN OUT"""
import sys
def encode(p):
    out=bytearray(); acc=0; nb=0
    for x in p:
        acc|=x<<nb; nb+=8
        while nb>=7: out.append(acc&127); acc>>=7; nb-=7
    if nb: out.append(acc&127)
    return bytes(out)
def decode(c):
    out=bytearray(); acc=0; nb=0
    for x in c:
        acc|=(x&127)<<nb; nb+=7
        if nb>=8: out.append(acc&255); acc>>=8; nb-=8
    return bytes(out)
if __name__=='__main__':
    if len(sys.argv)==4:
        d=open(sys.argv[2],'rb').read(); open(sys.argv[3],'wb').write(encode(d) if sys.argv[1]=='enc' else decode(d))
    else:
        import os
        for n in [0,1,6,7,8,13,14,15,1000,4097]:
            p=os.urandom(n); e=encode(p); assert all(x<128 for x in e); d=decode(e)
            assert d[:n]==p and len(d)-n<1, (n,len(d)); 
        print('bin7 self-test ok')
