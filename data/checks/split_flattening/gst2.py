"""gst2.py: Gram states and cliques for local excess-d systems (generalizes gst.py, which is d = 1), 2026-10-06.

A term is (a, B, C, U, V) with U, V tuples of r = rank a dirt rows, each a d-bit int (a row vector in F2^d).  A set S of terms
solves the local excess-d system if  G_ts = R_t^T B_s C_t L_s = delta_ts I + U_t V_s^T  for all t, s in S, where
(U_t V_s^T)[al,be] = parity(U_t[al] & V_s[be]).  For a 22-term decomposition with Delta_A = d, Pi = I + G = U V^T (U a basis of
ker X, V^T U = I_d), so every subset of its terms solves the system.  The gauge (U, V) -> (U g, V g^-T), g in GL_d, acts on all
terms at once."""
import numpy as np, itertools
from sat0 import FAC
from gst import M, bits9, solve_affine, yvecs, xvecs, par
def mkterm(a,B,C,U,V):
    return {'a':a,'B':B,'C':C,'U':tuple(int(u) for u in U),'V':tuple(int(v) for v in V),'y':yvecs(a,C),'x':xvecs(a,B),
            'r':FAC[a][0].shape[1]}
def check_pair(t,s,same=False):
    for al in range(t['r']):
        for be in range(s['r']):
            if par(t['y'][al] & s['x'][be]) != ((same and al==be) ^ par(t['U'][al] & s['V'][be])): return False
    return True
def check_set(terms):
    return all(check_pair(x,y,same=(i==j)) for i,x in enumerate(terms) for j,y in enumerate(terms))
def _brows(core, L):
    r=L.shape[1]; out=[]
    for t in core:
        Lt,Rt=FAC[t['a']]; Ct=M(t['C'])
        for al in range(Rt.shape[1]):
            for be in range(r):
                w=(Ct@L[:,be])%2; m=0
                for j in range(3):
                    if Rt[j,al]:
                        for k in range(3):
                            if w[k]: m|=1<<(3*j+k)
                out.append((m,t['U'][al],be))
    return out
def _crows(core, R):
    r=R.shape[1]; out=[]
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
                out.append((m,al,t['V'][be]))
    return out
def states(a, core, d, Ulist=None, Vlist=None):
    """all terms (a, B, C, U, V) compatible with every core term (both orders) and with their own diagonal block.
    Ulist/Vlist optionally restrict the dirt (lists of r-tuples of d-bit ints)."""
    L,R=FAC[a]; r=L.shape[1]; out=[]
    brow=_brows(core,L); crow=_crows(core,R)
    rowsd=list(itertools.product(range(1<<d),repeat=r))
    Ul=rowsd if Ulist is None else Ulist; Vl=rowsd if Vlist is None else Vlist
    # B depends on V only, C on U only (given B for the diagonal): cache the B solutions per V
    Bcache={}
    for V in Vl:
        Bcache[V]=solve_affine([(m, par(u_t & V[be])) for (m,u_t,be) in brow])
    for U in Ul:
        cbase=[(m, par(U[al] & v_t)) for (m,al,v_t) in crow]
        if crow and not solve_affine(cbase): continue
        for V in Vl:
            Bs=Bcache[V]
            if not Bs: continue
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
                        rows.append((m, (al==be) ^ par(U[al] & V[be])))
                for C in solve_affine(rows):
                    out.append(mkterm(a,B,C,U,V))
    return out
class Graph:
    """vertices: list of terms; adjacency bitsets = pairwise compatibility with distinct first factors."""
    def __init__(self, verts, chunk=512):
        self.v=verts; n=len(verts); self.n=n
        Y=np.zeros((n,3),dtype=np.uint32); X=np.zeros((n,3),dtype=np.uint32)
        U=np.zeros((n,3),dtype=np.uint8); V=np.zeros((n,3),dtype=np.uint8); r=np.zeros(n,dtype=np.int64)
        A=np.array([t['a'] for t in verts],dtype=np.int64)
        for q,t in enumerate(verts):
            r[q]=t['r']
            for al in range(t['r']): Y[q,al]=t['y'][al]; X[q,al]=t['x'][al]; U[q,al]=t['U'][al]; V[q,al]=t['V'][al]
        self.adj=[0]*n; rm=int(r.max()) if n else 1
        for q0 in range(0,n,chunk):
            q1=min(n,q0+chunk); ok=np.ones((q1-q0,n),dtype=bool)
            for al in range(rm):
                for be in range(rm):
                    g1=(np.bitwise_count(Y[q0:q1,al][:,None] & X[None,:,be])&1)
                    ok&= g1==(np.bitwise_count(U[q0:q1,al][:,None] & V[None,:,be])&1)
                    g2=(np.bitwise_count(Y[None,:,al] & X[q0:q1,be][:,None])&1)
                    ok&= g2==(np.bitwise_count(U[None,:,al] & V[q0:q1,be][:,None])&1)
            ok&= A[q0:q1][:,None]!=A[None,:]
            pk=np.packbits(ok,axis=1,bitorder='little')
            for qq in range(q1-q0): self.adj[q0+qq]=int.from_bytes(pk[qq].tobytes(),'little')
def cliques(G, k, limit=1, allowed=None):
    """up to 'limit' k-cliques (vertex index lists); 'allowed' optionally restricts the start set (bitset)."""
    found=[]
    def rec(cl, cand):
        if len(cl)==k: found.append(list(cl)); return len(found)>=limit
        if bin(cand).count('1') < k-len(cl): return False
        while cand:
            i=cand.bit_length()-1; cand&=~(1<<i)
            if rec(cl+[i], cand & G.adj[i] & ((1<<i)-1)): return True
        return False
    rec([], (1<<G.n)-1 if allowed is None else allowed)
    return found
def cliques_typed(G, need, limit=1):
    """k-cliques with a prescribed multiset of ranks: need = {rank: count}.  Returns up to 'limit' cliques."""
    byr={}
    for i,t in enumerate(G.v): byr[t['r']]=byr.get(t['r'],0)|(1<<i)
    order=sorted(need, key=lambda r: bin(byr.get(r,0)).count('1'))
    seq=[r for r in order for _ in range(need[r])]
    found=[]
    def rec(pos, cl, cand, lastidx):
        if pos==len(seq): found.append(list(cl)); return len(found)>=limit
        r=seq[pos]; pool=cand & byr.get(r,0)
        if pos>0 and seq[pos-1]==r: pool&=(1<<lastidx)-1      # same rank: decreasing indices
        while pool:
            i=pool.bit_length()-1; pool&=~(1<<i)
            if rec(pos+1, cl+[i], cand & G.adj[i], i): return True
        return False
    rec(0, [], (1<<G.n)-1, None)
    return found
def has_clique_grouped(G, need, mask=None):
    """is there a 'need'-clique inside mask (default all) with distinct first factors (one vertex per first factor)?"""
    grp={}
    for i,t in enumerate(G.v):
        if mask is None or (mask>>i)&1: grp[t['a']]=grp.get(t['a'],0)|(1<<i)
    gmask=list(grp.values()); best=[0]
    if len(gmask)<need: return False, len(gmask)
    def rec(cand,size):
        while True:
            if size>best[0]: best[0]=size
            if size>=need: return True
            gs=[(bin(cand&m).count('1'),m) for m in gmask if cand&m]
            if size+len(gs)<need: return False
            cnt,m=min(gs); sel=cand&m
            while sel:
                i=sel.bit_length()-1; sel&=~(1<<i)
                if rec(cand&G.adj[i],size+1): return True
            cand&=~m
    full=(1<<G.n)-1 if mask is None else mask
    return rec(full,0), best[0]
