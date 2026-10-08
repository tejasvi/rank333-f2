#!/usr/bin/env python3
"""itemkey.py ITEMBIN [REFS]: the R22N.Glue segment key (decimal) of a queue item block (r3qglue --itembin layout, QUEUE.md §3 + #pcwit):
  [u32 'R3XI'][u32 hlen][header][u64 n][records][32-byte sha256];
  header = varint item, varint job, u8 kind (0 job root, 1 piece, 2 replay cut, 3 range, 4 top), u8 d0, d0 x u16 prefix labels,
           64-byte inherited D, [#pcwit: varint n, n x varint delta witness rows], u16 l, u16 p.
Root node = (S = OR of 2^label over the prefix, last = the last prefix label); lo = l for a range (kind 3), else 0.
External references (DN pieces, JB jobs -> ext; RG l -> rng) come from REFS: checkd's ITEMBIN.key = `r3qglue --itemkey FILE OFF LEN`
(lines `root <labels> lo <l>` (checked against the header), `ext <labels>`, `rng <labels> <l>`).  Without REFS the key has no external
children (exact only for items with no references).
--info prints the parsed header instead.  The key is untrusted: a wrong key makes the native check fail, never a false theorem."""
import sys as _s; _s.set_int_max_str_digits(0) if hasattr(_s, "set_int_max_str_digits") else None
import sys,struct,os
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))); import segkey
def varint(b,o):
    v=0; sh=0
    while True:
        x=b[o]; o+=1; v|=(x&127)<<sh; sh+=7
        if x<128: return v,o
def parse(path):
    with open(path,'rb') as f: b=f.read(65536)
    magic,hlen=struct.unpack_from('<4sI',b,0)
    assert magic==b'R3XI', magic
    h=b[8:8+hlen]; o=0
    item,o=varint(h,o); job,o=varint(h,o); kind=h[o]; d0=h[o+1]; o+=2
    pre=list(struct.unpack_from('<%dH'%d0,h,o)); o+=2*d0
    D=int.from_bytes(h[o:o+64],'little'); o+=64
    wit=[]
    if hlen>o+4:                     # #pcwit: witness rows of D (delta-coded)
        n,o=varint(h,o); acc=0
        for _ in range(n):
            d,o=varint(h,o); acc+=d; wit.append(acc)
    l,p=struct.unpack_from('<HH',h,o); o+=4
    assert o==hlen, (o,hlen)
    return dict(item=item,job=job,kind=kind,prefix=pre,D=D,witness=wit,l=l,p=p,hlen=hlen)
def node(labels):
    S=0
    for x in labels: S|=1<<x
    return (S, labels[-1] if labels else 0)
def key(path,refs=None):
    h=parse(path)
    ext=[]; rng=[]
    if refs:
        for ln in open(refs):
            a=ln.split()
            if not a: continue
            if a[0]=='root':           # r3qglue --itemkey: "root LABELS lo L" must agree with the binary header
                labs=[int(x) for x in a[1:a.index('lo')]]; lo=int(a[a.index('lo')+1])
                if labs!=h['prefix'] or lo!=(h['l'] if h['kind']==3 else 0): sys.exit('itemkey: root line disagrees with the header')
            elif a[0]=='ext': ext.append(node([int(x) for x in a[1:]]))
            elif a[0]=='rng': rng.append((node([int(x) for x in a[1:-1]]),int(a[-1])))
    return segkey.encode(node(h['prefix']), h['l'] if h['kind']==3 else 0, ext, rng)
if __name__=='__main__':
    if sys.argv[1]=='--info':
        h=parse(sys.argv[2]); h['D']=hex(h['D']); print(h)
    else:
        print(key(sys.argv[1], sys.argv[2] if len(sys.argv)>2 else None))
