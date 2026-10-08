"""test_gst.py: the local excess-1 system holds on the Delta = 1 sides of the known 23-term decompositions, and states() finds
the true state of a term given other terms as the core."""
import numpy as np, random
from core import load23, sides, XY
from dirt23 import nullspace
from gst import mkterm, check_pair, states
random.seed(1); nside=0
for di,(A,B,C) in enumerate(load23()):
    for side,(a,b,c) in sides(A,B,C).items():
        X,Y,bl=XY(a,b,c)
        if sum(bl)-27!=1: continue
        p=nullspace(X)[0]; q=nullspace(Y)[0]; off=np.cumsum([0]+bl)
        terms=[mkterm(a[t],b[t],c[t],p[off[t]:off[t+1]],q[off[t]:off[t+1]]) for t in range(len(a))]
        bad=sum(1 for t in range(len(a)) for s in range(len(a)) if not check_pair(terms[t],terms[s],same=(t==s)))
        assert bad==0, (di,side,bad)
        for trial in range(4):
            idx=random.sample(range(len(a)),4); core=[terms[i] for i in idx[:3]]; tg=terms[idx[3]]
            st=states(tg['a'],core)
            assert any(x['B']==tg['B'] and x['C']==tg['C'] and x['U']==tg['U'] and x['V']==tg['V'] for x in st), (di,side,idx)
        nside+=1
print('ok: excess-1 system holds on',nside,'Delta=1 sides; states() recovers the true term state in',4*nside,'trials')
