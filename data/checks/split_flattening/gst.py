"""gst.py: Gram states and cliques for local excess-1 systems (2026-10-06).

A term is (a, B, C, U, V): first factor a = L R^T (FAC[a], rank r), second factor B (B[j][k] = bit 3j+k), third factor C
(C[k][i] = bit 3k+i), dirt vectors U, V in F2^r.  A set S of terms solves the local excess-1 system if
    G_ts = R_t^T B_s C_t L_s = delta_ts I + U_t V_s^T      for all t, s in S.
For a 22-term decomposition with Delta_A = 1, Pi = I + G = p q^T (p spans ker X, q spans ker Y, q^T p = 1), so every subset of
its terms solves the system with U_t = p_t, V_t = q_t.  Pairing vectors: y_{t,al}[(j,k,i)] = R_t[j,al] C_t[k,i] (row role) and
x_{s,be}[(j,k,i)] = B_s[j,k] L_s[i,be] (column role), bit 9j+3k+i, so that (G_ts)[al,be] = <y_{t,al}, x_{s,be}>."""
import numpy as np, itertools
from sat0 import FAC
def M(m): return np.array([[(m>>(3*i+j))&1 for j in range(3)] for i in range(3)],dtype=np.int64)
def bits9(A): return int(sum(int(A[i][j]&1)<<(3*i+j) for i in range(3) for j in range(3)))
def solve_affine(rows, n=9):
    """rows: list of (mask, rhs) over F2^n.  Returns the list of all solutions (as ints), or [] if inconsistent."""
    piv={}
    for m,r in rows:
        while m:
            h=m.bit_length()-1
            if h in piv: pm,pr=piv[h]; m^=pm; r^=pr
            else: piv[h]=(m,r); break
        else:
            if r: return []
    keys=sorted(piv)
    for h in keys:                                   # back-substitute to reduced form
        m,r=piv[h]
        for h2 in keys:
            if h2!=h and (piv[h2][0]>>h)&1: piv[h2]=(piv[h2][0]^m, piv[h2][1]^r)
    free=[q for q in range(n) if q not in piv]
    sols=[]
    for vals in itertools.product((0,1),repeat=len(free)):
        x=0
        for q,v in zip(free,vals):
            if v: x|=1<<q
        for h,(m,r) in piv.items():
            # x_h = r + sum over free bits in m
            if r ^ (bin(m & x & ~(1<<h)).count('1')&1): x|=1<<h
        sols.append(x)
    return sols
def yvecs(a,C):
    L,R=FAC[a]; Cm=M(C); out=[]
    for al in range(R.shape[1]):
        v=0
        for j in range(3):
            if R[j,al]:
                for k in range(3):
                    for i in range(3):
                        if Cm[k,i]: v|=1<<(9*j+3*k+i)
        out.append(v)
    return out
def xvecs(a,B):
    L,R=FAC[a]; Bm=M(B); out=[]
    for be in range(L.shape[1]):
        v=0
        for j in range(3):
            for k in range(3):
                if Bm[j,k]:
                    for i in range(3):
                        if L[i,be]: v|=1<<(9*j+3*k+i)
        out.append(v)
    return out
def par(x): return bin(x).count('1')&1
def gblock(t,s):
    """G_ts for terms t, s given as dicts with keys a,B,C (uses the pairing vectors)."""
    return [[par(yt & xs) for xs in s['x']] for yt in t['y']]
def mkterm(a,B,C,U,V):
    return {'a':a,'B':B,'C':C,'U':tuple(U),'V':tuple(V),'y':yvecs(a,C),'x':xvecs(a,B),'r':FAC[a][0].shape[1]}
def check_pair(t,s,same=False):
    G=gblock(t,s)
    for al in range(t['r']):
        for be in range(s['r']):
            if G[al][be] != ((same and al==be) ^ (t['U'][al] & s['V'][be])): return False
    return True
def states(a, core):
    """all terms (a, B, C, U, V) compatible with every core term (both orders) and with its own diagonal block."""
    L,R=FAC[a]; r=L.shape[1]; out=[]
    # B-system rows: core t as row, candidate as column: R_t[:,al]^T B (C_t L[:,be]) = U_t[al] V[be]
    brow=[]   # (mask, t, al, be)
    for t in core:
        Lt,Rt=FAC[t['a']]; Ct=M(t['C'])
        for al in range(Rt.shape[1]):
            for be in range(r):
                w=(Ct@L[:,be])%2; m=0
                for j in range(3):
                    if Rt[j,al]:
                        for k in range(3):
                            if w[k]: m|=1<<(3*j+k)
                brow.append((m,t['U'][al],be))
    crow=[]   # candidate as row, core t as column: R[:,al]^T B_t C L_t[:,be] = U[al] V_t[be]
    for t in core:
        Lt,Rt=FAC[t['a']]; Bt=M(t['B'])
        for al in range(r):
            z=(Bt.T@R[:,al])%2
            for be in range(Lt.shape[1]):
                m=0
                for k in range(3):
                    if z[k]:
                        for i in range(3):
                            if Lt[i,be]: m|=1<<(3*k+i)
                crow.append((m,al,t['V'][be]))
    for U in itertools.product((0,1),repeat=r):
        for V in itertools.product((0,1),repeat=r):
            Bs=solve_affine([(m, u_t & V[be]) for (m,u_t,be) in brow])
            if not Bs: continue
            cbase=[(m, U[al] & v_t) for (m,al,v_t) in crow]
            for B in Bs:
                Bm=M(B); rows=list(cbase)
                for al in range(r):
                    z=(Bm.T@R[:,al])%2
                    for be in range(r):
                        m=0
                        for k in range(3):
                            if z[k]:
                                for i in range(3):
                                    if L[i,be]: m|=1<<(3*k+i)
                        rows.append((m, (al==be) ^ (U[al] & V[be])))
                for C in solve_affine(rows):
                    out.append(mkterm(a,B,C,U,V))
    return out
class Graph:
    """vertices: list of terms; adjacency (bitsets) = pairwise compatibility with distinct first factors."""
    def __init__(self, verts):
        self.v=verts; n=len(verts); self.n=n
        Y=np.zeros((n,3),dtype=np.uint32); X=np.zeros((n,3),dtype=np.uint32)
        U=np.zeros((n,3),dtype=np.uint8); V=np.zeros((n,3),dtype=np.uint8); r=np.zeros(n,dtype=np.int64)
        A=np.array([t['a'] for t in verts],dtype=np.int64)
        for q,t in enumerate(verts):
            r[q]=t['r']
            for al in range(t['r']): Y[q,al]=t['y'][al]; X[q,al]=t['x'][al]; U[q,al]=t['U'][al]; V[q,al]=t['V'][al]
        self.adj=[0]*n; rm=int(r.max()) if n else 1
        CH=512
        for q0 in range(0,n,CH):
            q1=min(n,q0+CH); ok=np.ones((q1-q0,n),dtype=bool)
            for al in range(rm):
                for be in range(rm):
                    # row q (al) vs column w (be): <y_{q,al}, x_{w,be}> = U_q[al] V_w[be]   (zero-padded entries give 0 = 0)
                    g1=(np.bitwise_count(Y[q0:q1,al][:,None] & X[None,:,be])&1).astype(np.uint8)
                    ok&= g1==(U[q0:q1,al][:,None] & V[None,:,be])
                    g2=(np.bitwise_count(Y[None,:,al] & X[q0:q1,be][:,None])&1).astype(np.uint8)
                    ok&= g2==(U[None,:,al] & V[q0:q1,be][:,None])
            ok&= A[q0:q1][:,None]!=A[None,:]
            pk=np.packbits(ok,axis=1,bitorder='little')
            for qq in range(q1-q0): self.adj[q0+qq]=int.from_bytes(pk[qq].tobytes(),'little')
def cliques(G, k, groups=None, limit=1):
    """find up to 'limit' k-cliques (lists of vertex indices) in G; returns the list found."""
    found=[]
    def rec(cl, cand):
        if len(cl)==k: found.append(list(cl)); return len(found)>=limit
        if bin(cand).count('1') < k-len(cl): return False
        while cand:
            i=cand.bit_length()-1; cand&=~(1<<i)
            if rec(cl+[i], cand & G.adj[i] & ((1<<i)-1)): return True
        return False
    rec([], (1<<G.n)-1)
    return found
