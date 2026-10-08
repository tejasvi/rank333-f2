"""sat0.py: Delta_A = 0 analysis (2026-10-05).  With Delta_A = 0 the side-A Gram matrix of a 22-term decomposition is the identity:
G_ts = R_t^T B_s C_t L_s = delta_ts I (a_t = L_t R_t^T), and conversely G = I with sum rank a_t = 27 IS a decomposition (X Y^T = P).
Lemma S then forces the first-factor type (17,5,0).  feasible(S): do b_t, c_t exist with G_SS = I for a set S of first factors?"""
import numpy as np, itertools, pycryptosat
from symgrp import m2a, rank3
def factor(m):
    M=m2a(m)%2; basis=[]
    def rk(rows):
        rows=[int(sum(int(x)<<k for k,x in enumerate(r))) for r in rows]; piv={}; n=0
        for v in rows:
            while v:
                h=v.bit_length()-1
                if h in piv: v^=piv[h]
                else: piv[h]=v; n+=1; break
        return n
    for i in range(3):
        if rk(basis+[M[i]])>len(basis): basis.append(M[i].copy())
    r=len(basis); R=np.array(basis,dtype=np.int64).T.reshape(3,r); L=np.zeros((3,r),dtype=np.int64)
    for i in range(3):
        for co in itertools.product((0,1),repeat=r):
            v=np.zeros(3,dtype=np.int64)
            for c,b in zip(co,basis): v=(v+c*b)%2
            if (v==M[i]).all(): L[i]=co; break
    assert (((L@R.T)%2)==M).all()
    return L,R
FAC={m:factor(m) for m in range(1,512)}
def build(S, extra_unit=None):
    """CNF for G_SS = I over the first factors S (list of 9-bit ints).  Variables: b_t bits 1+18t..9+18t, c_t bits 10+18t..18+18t."""
    n=len(S); s=pycryptosat.Solver(threads=1); nv=18*n
    def bv(t,q): return 1+18*t+q
    def cv(t,q): return 10+18*t+q
    prod={}
    def P(sidx,tidx,j,k,i):
        nonlocal nv
        key=(sidx,tidx,j,k,i)
        if key not in prod:
            nv+=1; y=nv; b=bv(sidx,3*j+k); c=cv(tidx,3*k+i)
            s.add_clause([-y,b]); s.add_clause([-y,c]); s.add_clause([y,-b,-c]); prod[key]=y
        return prod[key]
    for t in range(n):
        Lt,Rt=FAC[S[t]]
        for sidx in range(n):
            Ls,Rs=FAC[S[sidx]]
            for al in range(Rt.shape[1]):
                for be in range(Ls.shape[1]):
                    vs=[P(sidx,t,j,k,i) for j in range(3) for k in range(3) for i in range(3) if Rt[j,al] and Ls[i,be]]
                    rhs=(t==sidx and al==be)
                    if vs: s.add_xor_clause(vs,rhs)
                    elif rhs: return None,None
    return s,(bv,cv)
def feasible(S):
    s,_=build(S)
    if s is None: return False
    sat,_=s.solve()
    return sat
def solutions(S, limit=100000):
    s,(bv,cv)=build(S)
    if s is None: return []
    out=[]; n=len(S)
    while len(out)<limit:
        sat,m=s.solve()
        if not sat: break
        B=[sum(1<<q for q in range(9) if m[bv(t,q)]) for t in range(n)]; C=[sum(1<<q for q in range(9) if m[cv(t,q)]) for t in range(n)]
        out.append((B,C)); s.add_clause([-(bv(t,q)) if m[bv(t,q)] else bv(t,q) for t in range(n) for q in range(9)]+[-(cv(t,q)) if m[cv(t,q)] else cv(t,q) for t in range(n) for q in range(9)])
    return out
if __name__=='__main__':
    # sanity on the rank-23 decompositions: G is not I there (Delta >= 1), but every term satisfies the diagonal block G_tt only
    # when ... just check that a known decomposition's rank-2 subset with its own b, c gives G entries consistent with core.gram
    import sys; sys.path.insert(0,'.'); from core import load23, gram
    A,B,C=load23()[2]; G,bl=gram(A,B,C)
    idx=[t for t in range(len(A)) if rank3(A[t])==2]
    print('dec3 rank-2 first factors',[A[t] for t in idx])
    print('feasible(all rank-2 of dec3) =',feasible([A[t] for t in idx]), '(Delta_A = 1 there, so G_HH = I need not hold)')
    print('single rank-2 term feasible:',feasible([A[idx[0]]]))
