"""dirt23.py: dirt structure (kernel vectors p of X, q of Y) of the known 23-term decompositions, side by side."""
import numpy as np
from core import *
def nullspace(M):
    M=(np.array(M,dtype=np.uint8)%2).copy(); rows,cols=M.shape; piv=[]; r=0
    for c in range(cols):
        pr=next((i for i in range(r,rows) if M[i,c]),None)
        if pr is None: continue
        M[[r,pr]]=M[[pr,r]]
        for i in range(rows):
            if i!=r and M[i,c]: M[i]^=M[r]
        piv.append(c); r+=1
    free=[c for c in range(cols) if c not in piv]; out=[]
    for f in free:
        v=np.zeros(cols,dtype=np.uint8); v[f]=1
        for i,c in enumerate(piv): v[c]=M[i,f]
        out.append(v)
    return out
if __name__=="__main__":
    for di,(A,B,C) in enumerate(load23()):
      for side,(a,b,c) in sides(A,B,C).items():
          X,Y,bl=XY(a,b,c); D=sum(bl)-27
          P_=nullspace(X); Q_=nullspace(Y)
          off=np.cumsum([0]+bl)
          def blocks(v): return [tuple(v[off[t]:off[t+1]]) for t in range(len(bl))]
          rks=bl
          s='dec%d side %s Delta %d type (%d,%d,%d)'%(di,side,D,rks.count(1),rks.count(2),rks.count(3))
          if D==1:
              p=P_[0]; q=Q_[0]; pb=blocks(p); qb=blocks(q)
              Dl=[t for t in range(len(bl)) if any(pb[t])]; Dm=[t for t in range(len(bl)) if any(qb[t])]
              star=[t for t in range(len(bl)) if sum(x*y for x,y in zip(pb[t],qb[t]))%2]
              s+=' | D_l %s ranks %s | D_m %s ranks %s | q.p=1 at %s ranks %s'%(Dl,[rks[t] for t in Dl],Dm,[rks[t] for t in Dm],star,[rks[t] for t in star])
          else:
              s+=' | dim ker X %d, ker Y %d'%(len(P_),len(Q_))
              # support of kernel spaces
              supl=set(t for v in P_ for t,blk in enumerate(blocks(v)) if any(blk)); supm=set(t for v in Q_ for t,blk in enumerate(blocks(v)) if any(blk))
              s+=' | supp kerX %d terms ranks %s | supp kerY %d terms ranks %s'%(len(supl),sorted(rks[t] for t in supl),len(supm),sorted(rks[t] for t in supm))
          print(s)
