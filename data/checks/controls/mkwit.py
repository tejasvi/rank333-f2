# witness files for acchk --witness: the Laderman-profile 23-term decomposition (lader_sat.txt) and its quotients
# by the E of each positive control pos<i> (pos_list.txt line i): terms with a in span(E) vanish, a' = L(a).
import re
t=open('lader_sat.txt').read()
A=[int(x) for x in t.split('|')[0].split()[1:]]
B=[int(x) for x in t.split('B')[1].split('C')[0].split()]; C=[int(x) for x in t.split('C')[1].split()]
assert len(A)==len(B)==len(C)==23
open('lader.w','w').write(' '.join(map(str,A))+' | '+' '.join(map(str,B))+' | '+' '.join(map(str,C))+'\n')
def mkL(E):
    basis=[]
    for v in E:
        for p,b in basis:
            if (v>>p)&1: v^=b
        if v:
            p=v.bit_length()-1
            basis=[(q,(c^v) if (c>>p)&1 else c) for q,c in basis]
            basis.append((p,v))
    piv={p for p,b in basis}; comp=[x for x in range(9) if x not in piv]
    def L(a):
        for p,b in basis:
            if (a>>p)&1: a^=b
        return sum(1<<i for i,x in enumerate(comp) if (a>>x)&1)
    return L
for i,ln in enumerate(open('pos_list.txt')):
    E=[int(x) for x in ln.split('|')[0].split(',')]; L=mkL(E)
    keep=[t for t in range(23) if L(A[t])!=0]
    ap=[L(A[t]) for t in keep]
    exp=[int(x) for x in open(f'pos{i}.a').read().split(':')[1].split()]
    assert sorted(ap)==sorted(exp), (i,ap,exp)
    open(f'pos{i}.w','w').write(' '.join(map(str,ap))+' | '+' '.join(str(B[t]) for t in keep)+' | '+' '.join(str(C[t]) for t in keep)+'\n')
    print(i,E,len(keep),'terms')
