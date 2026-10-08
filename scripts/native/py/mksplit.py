#!/usr/bin/env python3
"""mksplit.py PFX NAME FILE CH W [PB]: split module-land copy of a big #rttablew table (R22D.Load.rttableSplit).
  Writes src/R22D/<NAME>_P<j>.lean (chunks and dispatcher levels <= PB inside chunk range j) and src/R22D/<NAME>.lean (the levels
  above PB, chunk, entry, N; imports every part).  Same definitions as the monolithic `#r22d_rttablew`, so the bridge is unchanged."""
import sys,os
pfx,name,f,ch,w=sys.argv[1],sys.argv[2],sys.argv[3],int(sys.argv[4]),int(sys.argv[5]); pb=int(sys.argv[6]) if len(sys.argv)>6 else 13
L=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
n=os.path.getsize(f)//(w//8); nch=(n+ch-1)//ch; parts=(nch+2**pb-1)//2**pb
hdr='module\npublic meta import R22D.Load\npublic import R22N.Rec\n'
for j in range(parts):
    open(L+'/src/R22D/%s_P%d.lean'%(name,j),'w').write(hdr+'@[expose] public section\nset_option Elab.async false\n#r22d_rttablew_part %s "%s" %d %d %d %d\n'%(pfx,f,ch,w,pb,j))
imps=''.join('public import R22D.%s_P%d\n'%(name,j) for j in range(parts))
open(L+'/src/R22D/%s.lean'%name,'w').write(hdr+imps+'@[expose] public section\nset_option Elab.async false\n#r22d_rttablew_top %s "%s" %d %d %d\n'%(pfx,f,ch,w,pb))
print(name, n,'entries', nch,'chunks', parts,'parts of', 2**pb)
