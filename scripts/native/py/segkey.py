#!/usr/bin/env python3
"""segkey.py: encoder/decoder of R22N.Glue segment keys (little-endian bytes):
   root (S 64 B, last 2 B) | lo 2 B | nExt 4 B | nExt x node (66 B) | nRng 4 B | nRng x (node 66 B, l 2 B)"""
def node(S,last): return S.to_bytes(64,'little')+last.to_bytes(2,'little')
def encode(root,lo,ext=(),rng=()):
    b=node(*root)+lo.to_bytes(2,'little')+len(ext).to_bytes(4,'little')
    for e in ext: b+=node(*e)
    b+=len(rng).to_bytes(4,'little')
    for (n,l) in rng: b+=node(*n)+l.to_bytes(2,'little')
    return int.from_bytes(b,'little')
def decode(k):
    b=k.to_bytes(max(1,(k.bit_length()+7)//8),'little')+bytes(1000)
    f=lambda o,n: int.from_bytes(b[o:o+n],'little')
    nd=lambda o: (f(o,64),f(o+64,2))
    nE=f(68,4); o2=72+66*nE; nR=f(o2,4)
    return dict(root=nd(0),lo=f(66,2),ext=[nd(72+66*i) for i in range(nE)],rng=[(nd(o2+4+68*i),f(o2+4+68*i+66,2)) for i in range(nR)])
if __name__=='__main__':
    k=encode((1,0),0,[(1|2**5,5),(1|2**9,9)],[((1,0),300)])
    d=decode(k); assert d['root']==(1,0) and d['ext']==[(33,5),(513,9)] and d['rng']==[((1,0),300)], d
    print('segkey self-test ok')
