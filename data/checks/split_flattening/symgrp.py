"""grp.py: the A-side symmetry group of <3,3,3> over F2 acting on first factors: a -> P a Q^-1 (P, Q in GL3) and a -> a^T
(order 168^2 * 2 = 56,448), as permutations of the 512 matrices.  Matrices are 9-bit ints, bit 3i+j = a[i][j]."""
import numpy as np, itertools
def m2a(m): return np.array([[(m>>(3*i+j))&1 for j in range(3)] for i in range(3)],dtype=np.int64)
def a2m(A): return int(sum(int(A[i][j]&1)<<(3*i+j) for i in range(3) for j in range(3)))
def rank3(m):
    rows=[(m>>(3*i))&7 for i in range(3)]; piv={}; r=0
    for v in rows:
        while v:
            h=v.bit_length()-1
            if h in piv: v^=piv[h]
            else: piv[h]=v; r+=1; break
    return r
GL3=[m for m in range(512) if rank3(m)==3]
assert len(GL3)==168
def inv3(m):
    A=m2a(m)
    for x in GL3:
        if (((A@m2a(x))%2)==np.eye(3,dtype=np.int64)).all(): return x
MUL=None
def group_perms():
    """56,448 x 512 array: perm[g][a] = image of a."""
    mats=np.array([m2a(m) for m in range(512)])            # 512 x 3 x 3
    Pm=np.array([m2a(p) for p in GL3]); Qi=np.array([m2a(inv3(q)) for q in GL3])
    out=np.zeros((2*168*168,512),dtype=np.int16); k=0
    w=np.array([[1<<(3*i+j) for j in range(3)] for i in range(3)])
    for tr in (0,1):
        M=mats.transpose(0,2,1) if tr else mats
        for p in range(168):
            PM=np.einsum('ij,ajk->aik',Pm[p],M)%2              # 512 x 3 x 3
            for q in range(168):
                R=np.einsum('aij,jk->aik',PM,Qi[q])%2
                out[k]=(R*w).sum(axis=(1,2)); k+=1
    return out
if __name__=='__main__':
    import time; t=time.time(); G=group_perms(); print(G.shape, time.time()-t)
    # sanity: ranks preserved, permutations
    r=np.array([rank3(m) for m in range(512)])
    assert all((r[G[g]]==r).all() for g in range(0,len(G),997))
    assert all(len(set(G[g].tolist()))==512 for g in range(0,len(G),997))
    np.save('gperm512.npy',G); print('saved')
