"""core.py: <3,3,3> over F2, split flattening, Gram matrices on all three sides (2026-10-05).
Conventions as in r22: a first factor a is a 9-bit int, bit 3i+j = a[i][j]; b: bit 3j+k; c: bit 3k+i; T[3i+j][3j+k][3k+i] = 1.
Cyclic symmetry: T = sum a(x)b(x)c  <=>  T = sum b(x)c(x)a  (same bit patterns), so side B = side A of (b,c,a), side C of (c,a,b)."""
import numpy as np, itertools
def mat(m): return np.array([[(m>>(3*i+j))&1 for j in range(3)] for i in range(3)],dtype=np.uint8)
def tomask(M): return int(sum(int(M[i][j])<<(3*i+j) for i in range(3) for j in range(3)))
def gf2rank(M):
    M=(np.array(M,dtype=np.uint8)%2).copy(); r=0; rows,cols=M.shape
    for c in range(cols):
        piv=None
        for i in range(r,rows):
            if M[i,c]: piv=i; break
        if piv is None: continue
        if piv!=r: M[[r,piv]]=M[[piv,r]]
        nz=np.nonzero(M[:,c])[0]
        for i in nz:
            if i!=r: M[i]^=M[r]
        r+=1
        if r==rows: break
    return r
def rk(m): return gf2rank(mat(m))
def gf2inv(M):
    n=M.shape[0]; A=np.concatenate([np.array(M,dtype=np.uint8)%2,np.eye(n,dtype=np.uint8)],axis=1); r=0
    for c in range(n):
        piv=next(i for i in range(r,n) if A[i,c])
        if piv!=r: A[[r,piv]]=A[[piv,r]]
        for i in np.nonzero(A[:,c])[0]:
            if i!=r: A[i]^=A[r]
        r+=1
    return A[:,n:]
T=np.zeros((9,9,9),dtype=np.uint8)
for i in range(3):
    for j in range(3):
        for k in range(3): T[3*i+j,3*j+k,3*k+i]=1
P=np.zeros((27,27),dtype=np.uint8)   # P[(i,y),(j,z)] = T[3i+j, y, z], rows 9i+y, cols 9j+z
for i in range(3):
    for j in range(3):
        for y in range(9):
            for z in range(9): P[9*i+y,9*j+z]=T[3*i+j,y,z]
Pinv=gf2inv(P)
def factor(m):
    """a = L R^T with L, R 3 x r of full rank (R = basis of the row space, L = coordinates)."""
    M=mat(m); basis=[]
    for i in range(3):
        if gf2rank(np.array(basis+[M[i]]))>len(basis): basis.append(M[i].copy())
    r=len(basis); R=np.array(basis,dtype=np.uint8).T.reshape(3,r)
    L=np.zeros((3,r),dtype=np.uint8)
    for i in range(3):
        for co in itertools.product((0,1),repeat=r):
            v=np.zeros(3,dtype=np.uint8)
            for c,b in zip(co,basis): v^=(c*b).astype(np.uint8)
            if (v==M[i]).all(): L[i]=co; break
    assert ((L.astype(int)@R.T.astype(int))%2==M).all()
    return L,R
def vec9(m): return np.array([(m>>q)&1 for q in range(9)],dtype=np.uint8)
def XY(A,B,C):
    """X = [L_t (x) b_t]_t, Y = [R_t (x) c_t]_t (27 x N); rows of X are (i,y) -> 9i+y, rows of Y (j,z) -> 9j+z."""
    xs=[]; ys=[]; blocks=[]
    for a,b,c in zip(A,B,C):
        L,R=factor(a); r=L.shape[1]; bv=vec9(b); cv=vec9(c)
        for k in range(r):
            xs.append(np.kron(L[:,k],bv)); ys.append(np.kron(R[:,k],cv))
        blocks.append(r)
    return np.array(xs,dtype=np.uint8).T, np.array(ys,dtype=np.uint8).T, blocks
def gram(A,B,C):
    X,Y,bl=XY(A,B,C)
    assert ((X.astype(int)@Y.T.astype(int))%2==P).all(), 'X Y^T != P: not a decomposition'
    G=(Y.T.astype(int)@Pinv.astype(int)@X.astype(int))%2
    return G.astype(np.uint8), bl
def sides(A,B,C):
    return {'A':(A,B,C),'B':(B,C,A),'C':(C,A,B)}
def is_decomp(A,B,C):
    S=np.zeros((9,9,9),dtype=np.uint8)
    for a,b,c in zip(A,B,C): S^=np.einsum('i,j,k->ijk',vec9(a),vec9(b),vec9(c)).astype(np.uint8)
    return (S==T).all()
def load23():
    decs=[]
    for l in open('data/checks/decompositions23.txt'):
        if 'verified 1' not in l: continue
        head,rest=l.split('|',1)
        A=[int(x) for x in head.split(':')[1].split()]
        p=rest.split(' B ')[1]; Bs,Cs=p.split(' C ')
        decs.append((A,[int(x) for x in Bs.split()],[int(x) for x in Cs.split()]))
    return decs
