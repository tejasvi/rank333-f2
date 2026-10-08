"""test_gst2.py: the local excess-d system (gst2) holds on every side of the known 23-term decompositions with d = Delta of that
side, and states() recovers the true state of a term from a random 3-term core."""
import numpy as np, random
from core import load23, sides, gram
from gst2 import mkterm, check_set, states
from dirt23 import nullspace
def factor_pi(Pi):
    """Pi = U W^T with U a column basis (N x d)."""
    N=Pi.shape[0]; cols=[]; basis=[]
    for j in range(N):
        cand=np.array(basis+[Pi[:,j]])%2
        from core import gf2rank
        if gf2rank(cand)>len(basis): basis.append(Pi[:,j].copy()); cols.append(j)
    U=np.array(basis,dtype=np.int64).T%2; d=U.shape[1]
    # W^T: solve U W^T = Pi column by column: each column of Pi is U w for a unique w
    W=np.zeros((N,d),dtype=np.int64)
    import itertools
    combos=list(itertools.product((0,1),repeat=d))
    for j in range(N):
        for w in combos:
            if (((U@np.array(w))%2)==Pi[:,j]%2).all(): W[j]=w; break
        else: raise AssertionError
    assert (((U@W.T)%2)==Pi%2).all()
    return U,W
random.seed(2); n=0
for di,(A,B,C) in enumerate(load23()):
    for side,(a,b,c) in sides(A,B,C).items():
        G,bl=gram(a,b,c); N=G.shape[0]; d=N-27
        Pi=(np.eye(N,dtype=np.int64)+G)%2
        U,W=factor_pi(Pi); off=np.cumsum([0]+bl)
        rowint=lambda row: int(sum(int(x)<<k for k,x in enumerate(row)))
        terms=[mkterm(a[t],b[t],c[t],[rowint(U[q]) for q in range(off[t],off[t+1])],[rowint(W[q]) for q in range(off[t],off[t+1])]) for t in range(len(a))]
        assert check_set(terms), (di,side)
        for trial in range(3):
            idx=random.sample(range(len(a)),4); core=[terms[i] for i in idx[:3]]; tg=terms[idx[3]]
            st=states(tg['a'],core,d)
            assert any(x['B']==tg['B'] and x['C']==tg['C'] and x['U']==tg['U'] and x['V']==tg['V'] for x in st), (di,side,idx)
        n+=1; print('dec',di,'side',side,'d',d,'ok',flush=True)
print('ok',n,'sides')
