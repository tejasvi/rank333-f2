#!/usr/bin/env python3
"""glue.py STORE OUTDIR ROOTS...: the glue generator of form (B) (PROOF_OBJECT.md §3.2a/§3.2b).
Reads STORE/*.keys (written by nchk.sh: "KEY MODULE POS THM CHECKMODS..."), decodes every segment key (lib/py/segkey.py),
checks the closure (every external child (e, 0) and every range (n, l) is the interface of exactly one checked item; every ROOT is),
orders items children-first, and writes aggregator modules OUTDIR/<NS>/A<j>.lean proving `R22N.Cov <Checked> (iface)` for each item,
plus OUTDIR/<NS>/Top.lean proving the ROOTS (`S,last,lo` triples).  The kernel re-checks everything; this script is untrusted.
Checked predicate: the module's `Checked` (e.g. R22N.Toy.Checked); the chunk fact for key k is `R22N.allL_getD k <M>.thm`.

Incremental aggregation (production, 2026-10-07): a job's modules need only its own chunks, so aggregation runs in ROUNDS during the
run and only the top levels remain for the end.
  GLUE_NS=GA<x>        the round's namespace and module prefix (default GA): modules <NS>.A<j>, constants <NS>.c<i>, files OUTDIR/<NS>/.
  GLUE_COMPLETE=1      round mode: of the ROOTS (e.g. the job roots, GLUE_ROOTS_FILE), glue exactly those whose closure is complete in
                       STORE (plus GLUE_DONE) and not yet done; items outside their closures are ignored this round.  Writes
                       OUTDIR/<NS>/DONE.txt: "IFACE CONST MODULE" per glued root (IFACE = S,last,lo or S).
  GLUE_DONE=F1,F2,...  earlier rounds' DONE.txt files: those interfaces are covered by existing constants (imported, not re-glued).
  Without GLUE_COMPLETE every ROOT must be covered and every reachable item's children too (the final glue: any uncovered key fails).
Audit checks (T-1/T-3/T-4): GLUE_LIBALLOW (required), chunk olean pins (<NS>/CHUNKS.sha256), aggregator templates (<NS>/TEMPLATE.txt).
  GLUE_EXCEPT=FILE     the explicit exception list for job roots whose original tree can never close (case II, 2026-10-07: 10 jobs
                       with a truncated record, re-run as fresh redo jobs; lib/py/redoexcl.py writes it).  Lines: "root S last lo ..."
                       (the exception roots), "drop CHUNK POS KEYSHA" (an item of the original trees: excluded; KEYSHA = sha256 of
                       its decimal key, first 16 hex, must match the store), "keep S last lo CHUNK" (optional: the root must be covered
                       by that chunk's item, the redo's J item).  Every drop line must match an item of STORE; nothing else changes
                       (two different keys for one interface still stop the glue).  Logged, and copied to <NS>/EXCEPT.txt."""
import sys as _s; _s.set_int_max_str_digits(0) if hasattr(_s, "set_int_max_str_digits") else None
import sys,os,glob,collections,re
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))+'/py'); import segkey, gatemplate
store,out=sys.argv[1],sys.argv[2]
FAM=os.environ.get('GLUE_FAM','seg')   # seg: R22N.Cov, segment keys (roots "S,last,lo"); e1: R22N.CovG, E1 job keys (roots "S")
NS=os.environ.get('GLUE_NS','GA')
if not re.match(r'^GA[A-Za-z0-9_]*$',NS): sys.exit('glue: GLUE_NS must be GA followed by letters, digits or _')
COMPLETE=os.environ.get('GLUE_COMPLETE')=='1'
roots=[tuple(int(x) for x in r.split(',')) for r in sys.argv[3:]]
RFILE=os.environ.get('GLUE_ROOTS_FILE')   # one root per line, in table order (e1: "S"; seg: "S last lo") -> <NS>.RootsL + <NS>.Roots.roots_all
if RFILE: roots+=[(int(l.split()[0]),) if FAM=='e1' else tuple(int(x) for x in l.split()[:3]) for l in open(RFILE) if l.strip()]
W=int(os.environ.get('GLUE_W','192'))   # e1: key width W: [0,W) S | [W,W+16) m | m x [W] children (W = 640 for leaf2's E1 W-bit keys)
def e1dec(k):
    m=(k>>W)&0xffff
    return {'S':k%(1<<W),'kids':[(k>>(W+16+W*i))%(1<<W) for i in range(m)]}
PER=int(os.environ.get('GLUE_PER','400'))      # items per aggregator module
items=[]   # (key, module, pos, checkmod, thm)
# audit T-1/T-3 (2026-10-07): every chunk must come from an allow-listed library (its .keys fields fp=, so=; GLUE_LIBALLOW: lines
# "fp=<closure fp> so=<sha256 of libnative.so>", from lib/py/libmeta.py allow over the FINAL build) and its exported .olean must still
# have the sha256 recorded at check time (.keys olean=, ir=; or GLUE_SHA lines "MODULE SHA256" for chunks of the older format).
# Chunks without fp=/so= are admitted only with GLUE_LEGACY=1 (not in the final glue: coordinator 2026-10-07).  GLUE_NOLIBCHECK=1
# disables both checks (development only; printed).
ALLOW=set()
if os.environ.get('GLUE_LIBALLOW'):
    for l in open(os.environ['GLUE_LIBALLOW']):
        kv=dict(t.split('=',1) for t in l.split() if '=' in t)
        if 'fp' in kv and 'so' in kv: ALLOW.add((kv['fp'],kv['so']))
NOLIB=os.environ.get('GLUE_NOLIBCHECK')=='1'; LEGACY=os.environ.get('GLUE_LEGACY')=='1'
if not NOLIB and not ALLOW: sys.exit('glue: GLUE_LIBALLOW (the final library allow-list) is required (or GLUE_NOLIBCHECK=1 for development)')
if NOLIB: print('glue: WARNING: library and chunk-olean checks DISABLED (GLUE_NOLIBCHECK=1): not for the final run')
SHA={}
if os.environ.get('GLUE_SHA'):
    for l in open(os.environ['GLUE_SHA']):
        a=l.split()
        if len(a)>=2: SHA[a[0]]=a[1]
XROOTS=set(); XDROP={}; XKEEP={}; XFILE=os.environ.get('GLUE_EXCEPT')
if XFILE:
    import hashlib
    for l in open(XFILE):
        a=l.split()
        if not a or a[0].startswith('#'): continue
        if a[0]=='root' and len(a)>=4: XROOTS.add(((int(a[1]),int(a[2])),int(a[3])))
        elif a[0]=='drop' and len(a)==4: XDROP[(a[1],int(a[2]))]=a[3]
        elif a[0]=='keep' and len(a)>=5: XKEEP[((int(a[1]),int(a[2])),int(a[3]))]=a[4]   # further fields: provenance (J item id)
        else: sys.exit('glue: bad GLUE_EXCEPT line: %s'%l.strip())
    if FAM!='seg' or not XROOTS: sys.exit('glue: GLUE_EXCEPT needs GLUE_FAM=seg and at least one root line')
    if any(k not in XROOTS for k in XKEEP): sys.exit('glue: GLUE_EXCEPT keep line for a root that is not listed')
XFOUND=set()
pins={}   # module -> [(sha256, path)]
for f in sorted(glob.glob(store+'/*.keys')):
    d=os.path.dirname(os.path.realpath(f)); mk=None; m=None
    for l in open(f):
        a=l.split(); kv=dict(t.split('=',1) for t in a[5:] if '=' in t)
        if (a[1],int(a[2])) in XDROP:
            # an item of an exception root's original tree: excluded (its key must be the listed one)
            if hashlib.sha256(a[0].encode()).hexdigest()[:16]!=XDROP[(a[1],int(a[2]))]: sys.exit('glue: GLUE_EXCEPT drop %s %s: the key differs from the list'%(a[1],a[2]))
            XFOUND.add((a[1],int(a[2])))
        else: items.append((int(a[0]),a[1],int(a[2]),a[4],a[3]))   # key, module, position, checker module, chunk theorem
        m=a[1]
        if NOLIB: continue
        k=(kv.get('fp'),kv.get('so'),kv.get('olean'),kv.get('ir'))
        if mk is None: mk=k
        elif k!=mk: sys.exit('glue: %s: lines disagree on lib/olean fields'%f)
    if NOLIB or mk is None: continue
    fp,so,osha,irsha=mk
    if fp is None or so is None:
        if not LEGACY: sys.exit('glue: chunk %s has no fp=/so= (older checker); admitted only with GLUE_LEGACY=1'%m)
    elif (fp,so) not in ALLOW: sys.exit('glue: chunk %s: library fp=%s so=%s is not allow-listed'%(m,fp[:16],so[:16]))
    osha=osha or SHA.get(m)
    if not osha: sys.exit('glue: chunk %s: no recorded olean sha256 (.keys olean= or GLUE_SHA)'%m)
    pins[m]=[(osha,os.path.join(d,m+'.olean'))]+([(irsha,os.path.join(d,m+'.ir'))] if irsha not in (None,'-') else [])
if XFILE:
    if len(XFOUND)!=len(XDROP): sys.exit('glue: GLUE_EXCEPT: %d drop lines match no item of the store (e.g. %s)'%(len(XDROP)-len(XFOUND),sorted(set(XDROP)-XFOUND)[:3]))
    print('glue: GLUE_EXCEPT %s (md5 %s): %d exception roots, %d items of their original trees excluded, %d keep lines'
          %(XFILE,hashlib.md5(open(XFILE,'rb').read()).hexdigest(),len(XROOTS),len(XDROP),len(XKEEP)))
iface={}; dups=0
for it in sorted(items,key=lambda t:(t[1],t[2])):   # deterministic: an interface checked twice keeps the first chunk by name
    if FAM=='e1':
        d=e1dec(it[0]); k=d['S']
    else:
        d=segkey.decode(it[0]); k=(d['root'],d['lo'])
    if k in iface:
        # the same item checked twice (checkd re-checks a segment after an ERROR, in another batch): identical keys are the same
        # fact; different keys for one interface would be two different segmentations of one subtree: an error
        if iface[k][0][0]!=it[0]: sys.exit('glue: interface %s covered twice with different keys (%s, %s)'%(k,iface[k][0][1],it[1]))
        dups+=1
        if k in XKEEP and it[1]==XKEEP[k]: iface[k]=(it,d)   # GLUE_EXCEPT keep: of identical copies, the listed redo chunk's is used
        continue
    iface[k]=(it,d)
if dups: print('glue: %d items checked twice (identical keys; the first chunk by name is used)'%dups)
for r in sorted(XROOTS):
    if r in iface:
        if r in XKEEP and iface[r][0][1]!=XKEEP[r]: sys.exit('glue: GLUE_EXCEPT root %s is covered by %s, not by the listed redo chunk %s'%(r,iface[r][0][1],XKEEP[r]))
        print('glue: GLUE_EXCEPT root %d,%d,%d: covered by %s:%d'%(r[0][0],r[0][1],r[1],iface[r][0][1],iface[r][0][2]))
def kids(d): return d['kids'] if FAM=='e1' else [(e,0) for e in d['ext']]+[tuple(p) for p in d['rng']]
def rootkey(r): return r[0] if FAM=='e1' else ((r[0],r[1]),r[2])
def keytxt(k): return '%d'%k if FAM=='e1' else '%d,%d,%d'%(k[0][0],k[0][1],k[1])
def parsekey(s): return int(s) if FAM=='e1' else (lambda a: ((a[0],a[1]),a[2]))([int(x) for x in s.split(',')])
done={}   # interface -> (constant, module) proved by an earlier round
for df in [x for x in os.environ.get('GLUE_DONE','').split(',') if x]:
    for l in open(df):
        a=l.split()
        if len(a)==3:
            if not re.match(r'^GA[A-Za-z0-9_]*\.c\d+$',a[1]) or not re.match(r'^GA[A-Za-z0-9_]*\.[A-Za-z0-9_]+$',a[2]): sys.exit('glue: bad DONE line in %s: %s'%(df,l.strip()))
            done[parsekey(a[0])]=(a[1],a[2])
for k in done:
    if k in iface: pass   # its items are in the store too; it is not re-glued (the walk stops at done interfaces)
if os.environ.get('GLUE_PRUNE')=='1' and os.environ.get('GLUE_REHEARSAL')!='1':
    sys.exit('glue: GLUE_PRUNE drops uncovered items, so it is for rehearsals only (set GLUE_REHEARSAL=1); the final glue fails on any uncovered key')
if os.environ.get('GLUE_PRUNE')=='1':
    # rehearsal / partial runs only: drop every item with an uncovered child, transitively, and every root that loses its item
    n0=len(iface); changed=True
    while changed:
        changed=False
        for k,(it,d) in list(iface.items()):
            if k not in done and any(c not in iface and c not in done for c in kids(d)): del iface[k]; changed=True
    r0=len(roots); roots=[r for r in roots if rootkey(r) in iface or rootkey(r) in done]
    print('glue: GLUE_PRUNE dropped %d items and %d roots'%(n0-len(iface),r0-len(roots)))
# completeness of a root's closure (items, stopping at done interfaces), memoized; iterative (trees can be deep)
okc={}
def complete(k0):
    st=[(k0,False)]
    while st:
        k,post=st.pop()
        if k in okc: continue
        if k in done: okc[k]=True; continue
        if k not in iface: okc[k]=False; continue
        cs=kids(iface[k][1])
        if not post:
            st.append((k,True)); st+=[(c,False) for c in cs if c not in okc]
        else: okc[k]=all(okc.get(c,False) for c in cs)
    return okc[k0]
if COMPLETE:
    nr=len(roots); roots=[r for r in roots if rootkey(r) not in done and complete(rootkey(r))]
    print('glue: GLUE_COMPLETE: %d of %d roots have a complete closure and are not done yet'%(len(roots),nr))
    if not roots:
        os.makedirs(out+'/'+NS,exist_ok=True); open(out+'/'+NS+'/DONE.txt','w').close(); print('glue: nothing to glue in this round'); sys.exit(0)
else:
    for r in roots:
        if rootkey(r) not in iface and rootkey(r) not in done: sys.exit('glue: root %s not covered'%(r,))
# children-first order of the reachable items (the walk stops at done interfaces); every reachable item's children must be covered
order=[]; seen=set()
def visit(k0):
    st=[(k0,False)]
    while st:
        k,post=st.pop()
        if post: order.append(k); continue
        if k in seen or k in done: continue
        seen.add(k)
        if k not in iface: sys.exit('glue: child %s not covered'%(k,))
        st.append((k,True)); st+=[(c,False) for c in reversed(kids(iface[k][1]))]
for r in roots:
    if rootkey(r) not in done: visit(rootkey(r))
if not COMPLETE:
    # items of the store reachable from no root even through done subtrees (e.g. a superseded chunk set): reported, not glued
    allr=set(); st=[rootkey(r) for r in roots]
    while st:
        k=st.pop()
        if k in allr or k not in iface: continue
        allr.add(k); st+=kids(iface[k][1])
    orphans=len(iface)-len(allr)
    if orphans: print('glue: note: %d items of the store are reachable from no root (not glued)'%orphans)
if os.environ.get('GLUE_ORDER','height')=='height':
    # pack by height (leaves first), not DFS: an aggregator module only imports modules of lower height, so the module DAG's longest
    # chain is about the item trees' height instead of (items of the largest job / PER)
    hgt={}
    for k in order: hgt[k]=1+max([hgt[c] for c in kids(iface[k][1]) if c in hgt] or [0])
    pos={k:i for i,k in enumerate(order)}
    order=sorted(order,key=lambda k:(hgt[k],pos[k]))
checked=os.environ.get('GLUE_CHECKED','R22N.Toy.Checked'); chkmod=items[0][3] if items else os.environ.get('GLUE_CHKMOD','NN.Case')
O=out+'/'+NS; os.makedirs(O,exist_ok=True)
if XFILE: open(O+'/EXCEPT.txt','w').write(open(XFILE).read())   # the exception list this round was glued under (the record)
if not NOLIB:
    used=set(iface[k][0][1] for k in order); bad=0
    with open(O+'/CHUNKS.sha256','w') as o:
        for m in sorted(used):
            for sh,pth in pins[m]:
                o.write('%s  %s\n'%(sh,pth))
                if not os.path.exists(pth) or gatemplate.sha(pth)!=sh: bad+=1; print('glue: chunk part changed or missing: %s'%pth)
    if bad: sys.exit('glue: %d chunk parts do not match their recorded sha256 (audit T-3)'%bad)
MEMSTYLE=os.environ.get('GLUE_MEM','getD')
def mem(pos): return '(List.Mem.head _)' if pos==0 else '(List.Mem.tail _ %s)'%mem(pos-1)
def fact(thm,pos): return '(R22N.allL_getD %d %s (by decide))'%(pos,thm) if MEMSTYLE=='getD' else '(R22N.allL_mem %s _ %s)'%(thm,mem(pos))
idx={k:i for i,k in enumerate(order)}
def name(k): return 'c%d'%idx[k]   # position in the children-first order: unique, deterministic
def ref(c): return done[c][0] if c in done else '%s.%s'%(NS,name(c))
def iftxt(k): return '%d'%k if FAM=='e1' else '((%d, %d), %d)'%(k[0][0],k[0][1],k[1])
COV=os.environ.get('GLUE_COV') or ('R22N.Cov %s'%checked)   # e1: e.g. "R22N.CovG E1N.keyS E1N.keyExt (E1N.Checked E1N.IP_pt.D)"
DIRECT=os.environ.get('GLUE_DIRECT')=='1' and FAM!='e1'   # kernel-only declarations (R22G.Cmd): no per-item elaboration
# e1 items with many children (coordinator 2026-10-07 ~20:40: E1's tops with ~10k children took hours each to elaborate, since the
# anonymous constructor was elaborated against `AllL P (keyExt <multi-MB key>)` and every cons step re-reduced keyExt at Meta level):
# for m >= GLUE_XLIST children (default 64) the item's children are written out as a literal list, the equation
# `[c_1, …, c_m] = keyExt <key>` is proved by ONE kernel evaluation (`by decide +kernel`: kernel-checked, no native code, no axiom), and
# the constructor is elaborated against the literal list (linear).  The theorem's statement (`public theorem c<i> : COV <iface>`) is
# unchanged.  gatemplate.py (T-4) admits exactly this form.
XLIST=int(os.environ.get('GLUE_XLIST','64'))
def covterms(cov):
    # the top-level arguments of `R22N.CovG root kids checked` (a name or a parenthesized term each)
    a=[]; i=len('R22N.CovG '); depth=0; cur=''
    for ch in cov[i:]:
        if ch==' ' and depth==0:
            if cur: a.append(cur); cur=''
            continue
        depth+=(ch=='(')-(ch==')'); cur+=ch
    if cur: a.append(cur)
    return a
def bighc(key,kidlist,refs):
    kext=covterms(COV)[1]
    return '(Eq.mp (congrArg (R22N.AllL (%s)) (by decide +kernel : [%s] = %s %d)) ⟨%s, trivial⟩)'%(COV,', '.join('%d'%c for c in kidlist),kext,key,', '.join(refs))
mods=[]; where={}
def modof(c): return done[c][1] if c in done else where.get(c)
# modules: at most PER items, and (GLUE_MAXW, default 8000 for e1, off for seg) at most MAXW children in total, so that the giant tops
# of an E1 final (~10k children each, all at the top height) each get their own module and build in parallel (coordinator 2026-10-07)
MAXW=int(os.environ.get('GLUE_MAXW','8000' if FAM=='e1' else '0'))
groups=[]; cur=[]; wsum=0
for k in order:
    wk=len(kids(iface[k][1]))+1
    if cur and (len(cur)>=PER or (MAXW and wsum+wk>MAXW)): groups.append(cur); cur=[]; wsum=0
    cur.append(k); wsum+=wk
if cur: groups.append(cur)
for j,grp in enumerate(groups):
    m='%s.A%d'%(NS,j); mods.append(m)
    needm=set(iface[k][0][1] for k in grp); needa=set(modof(c) for k in grp for c in kids(iface[k][1]) if modof(c) is not None and modof(c)!=m)
    lines=['module','public import %s'%chkmod,'public import R22N.Glue']+(['public meta import R22G.Cmd'] if DIRECT else [])+['import %s'%x for x in sorted(needm|needa)]
    # maxHeartbeats 0: an E1 top part's key has up to ~740k decimal digits and its CovG.mk' item exceeds the elaborator's default
    # 200000 heartbeats at isDefEq (native/e1, 2026-10-07); the bound only limits elaboration, the kernel still checks every item
    lines+=['set_option exponentiation.threshold 10000000','set_option maxRecDepth 100000','set_option maxHeartbeats 0','namespace %s'%NS]
    for k in grp:
        it,d=iface[k]
        if FAM!='e1':
            he='⟨'+', '.join(ref(c) for c in [(e,0) for e in d['ext']])+', trivial⟩' if d['ext'] else 'trivial'
            hr='⟨'+', '.join(ref(tuple(p)) for p in d['rng'])+', trivial⟩' if d['rng'] else 'trivial'
        if FAM=='e1':
            hc='⟨'+', '.join(ref(c) for c in d['kids'])+', trivial⟩' if d['kids'] else 'trivial'
            if len(d['kids'])>=XLIST: hc=bighc(it[0],d['kids'],[ref(c) for c in d['kids']])
            lines.append('public theorem %s : %s %s :=\n  R22N.CovG.mk\' %d %s %s'%(name(k),COV,iftxt(k),it[0],fact(it[4],it[2]),hc))
        elif DIRECT:
            lines.append('#r22g_cov %s.%s %s %d %s %d %d %d %d %s / %s'%(NS,name(k),checked,it[0],it[4],it[2],k[0][0],k[0][1],k[1],
                ' '.join(ref((e,0)) for e in d['ext']),' '.join(ref(tuple(p)) for p in d['rng'])))
        else:
            lines.append('public theorem %s : %s %s :=\n  R22N.Cov.mk\' %d %s %s %s'%(name(k),COV,iftxt(k),it[0],fact(it[4],it[2]),he,hr))
        where[k]=m
    lines.append('end %s'%NS)
    open(O+'/A%d.lean'%j,'w').write('\n'.join(lines)+'\n')
if not COMPLETE:   # a round's roots are referenced through DONE.txt (constants and modules), so rounds need no Top module
    top=['module','public import %s'%chkmod,'public import R22N.Glue']+['import %s'%x for x in sorted(set(modof(rootkey(r)) for r in roots))]
    top+=['namespace %s'%NS]+['public theorem root_%d : %s %s := %s'%(i,COV,iftxt(rootkey(r)),ref(rootkey(r))) for i,r in enumerate(roots)]+['end %s'%NS]
    open(O+'/Top.lean','w').write('\n'.join(top)+'\n')
if COMPLETE:
    open(O+'/DONE.txt','w').write(''.join('%s %s %s\n'%(keytxt(rootkey(r)),ref(rootkey(r)),modof(rootkey(r))) for r in roots))
if RFILE and not COMPLETE:
    # the root list as BLOCKS of module constants (<NS>.RootsL.b<j>, <NS>.RootsL.blocks): a single literal of 1e4+ entries exceeds the
    # elaborator's recursion limit, and a long literal inside a statement elaborates to `have` chains that env N cannot restate
    # (native/e1's findings). roots_all : AllL (fun l => AllL COV l) <NS>.RootsL.blocks
    rl=[rootkey(r) for r in roots]; B=int(os.environ.get('GLUE_RBLOCK','500'))
    T='Nat' if FAM=='e1' else '((Nat × Nat) × Nat)'
    def lit(ks): return '['+', '.join(iftxt(k) for k in ks)+']'
    blocks=[rl[i:i+B] for i in range(0,len(rl),B)]
    rL=['module','@[expose] public section','set_option maxRecDepth 100000','namespace %s.RootsL'%NS]
    for jb,bk in enumerate(blocks): rL.append('abbrev b%d : List %s :=\n  %s'%(jb,T,lit(bk)))
    rL.append('/-- the covered roots, in table order, in blocks of %d -/'%B)
    rL.append('abbrev blocks : List (List %s) := [%s]'%(T,', '.join('%s.RootsL.b%d'%(NS,jb) for jb in range(len(blocks)))))
    rL.append('end %s.RootsL'%NS)
    open(O+'/RootsL.lean','w').write('\n'.join(rL)+'\n')
    rs=['module','public import %s'%chkmod,'public import R22N.Glue','public import %s.RootsL'%NS]+['import %s'%x for x in sorted(set(modof(k) for k in rl))]
    rs+=['set_option exponentiation.threshold 10000000','set_option maxRecDepth 100000','namespace %s'%NS]
    for jb,bk in enumerate(blocks):
        rs.append('public theorem roots_%d : R22N.AllL (fun s => %s s) %s.RootsL.b%d :=\n  %s'%(jb,COV,NS,jb,'⟨'+', '.join(ref(k) for k in bk)+', trivial⟩'))
    rs.append('/-- every listed root is covered (blocks of %s.RootsL) -/'%NS)
    rs.append('public theorem roots_all : R22N.AllL (fun l => R22N.AllL (fun s => %s s) l) %s.RootsL.blocks :=\n  ⟨%s, trivial⟩'%(COV,NS,', '.join('roots_%d'%jb for jb in range(len(blocks)))))
    rs.append('end %s'%NS)
    open(O+'/Roots.lean','w').write('\n'.join(rs)+'\n')
    print('glue: %s.Roots with %d roots in %d blocks'%(NS,len(rl),len(blocks)))
open(O+'/TEMPLATE.txt','w').write('COV %s\nCHKMOD %s\nNS %s\n'%(COV,chkmod,NS))
if not gatemplate.COVRE.match(COV): sys.exit('glue: COV %r is not of the template form'%COV)
nb=gatemplate.check_files(out,gatemplate.read_template(out,NS),NS)
if nb: sys.exit('glue: %d generated lines fail the aggregator template (audit T-4)'%nb)
print('glue: %d items, %d aggregator modules, %d roots%s'%(len(order),len(mods),len(roots),', %d done interfaces referenced'%len(done) if done else ''))
print(' '.join(mods+([] if COMPLETE else ['%s.Top'%NS])))
