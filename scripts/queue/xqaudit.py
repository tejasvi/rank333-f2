#!/usr/bin/env python3
"""xqaudit.py MANIFEST [--prof FILE_OR_DIR ...] [--ref STATEFILE ...] [--pool POOL]: audit of the prof7L92 work queue (2026-10-06).

Replays DIR/manifest.log (ops/xqd.py) and checks, for every job tree (J item = a pool job handed to the queue):
  1. structure: every child lies strictly inside its parent's region (a piece prefix extends the parent's prefix; below a range item
     the first label under its node is >= the range's start, in the search label order), siblings are pairwise disjoint (no region
     contains another's prefix), the tree has no cycles and every child was created while its parent was leased (records in order);
  2. accounting: every Complete item has exactly one accepted report (own n l p), every child Complete, and total = own + the sum
     of its children's totals; a Complete job root has one S record with that total, and its line "ix n l p sec" is in
     <statedir>/gather/xq/state_<pool>_xq.txt;
  3. liveness: items Failed, Queued, Leased or Reported-but-waiting are listed (an incomplete tree is not covered);
  4. with --prof: every profile line in the given files (F_*.prof of the runs, *_xq.prof of imports) that lies in a job tree is assigned
     to the item whose own region holds it; per item, the profiles found in the reporting run's file must equal its reported profile
     count (fewer = lost profiles; profiles of an item in other files = copies from a lost or revoked holder, reported separately);
  5. with --ref: per-job state lines of a reference run (e.g. single-process prof7L87) compared with the queue's job totals;
  6. prof7R3q (certificate rerun) manifests, whose reports carry seg=HOST:FILE:OFFSET:LENGTH:SHA256: every reported item of a complete
     job has a segment (none "ERR"); with --plan OUT, the item trees of the complete jobs are written for r3q/r3qglue (assembly of each
     job's canonical certificate stream from the item segments), with each item's prefix, range start, delta base, dead mask, segment
     and the Lean check result of its segment (W records), if any.
Exit status 0 iff no structural or accounting error and every tree is complete (and, with --prof/--ref, no mismatch)."""
import sys, os, collections, argparse, glob

def rank3(v):
    rows=[v&7,(v>>3)&7,(v>>6)&7]; rk=0
    for b in (2,1,0):
        p=-1
        for i in range(rk,3):
            if (rows[i]>>b)&1: p=i; break
        if p<0: continue
        rows[rk],rows[p]=rows[p],rows[rk]
        for i in range(3):
            if i!=rk and (rows[i]>>b)&1: rows[i]^=rows[rk]
        rk+=1
    return rk
def lab_order(rord):
    ro=[rord//100,(rord//10)%10,rord%10]; vec=[v for t in ro for v in range(1,512) if rank3(v)==t]; return {v:i for i,v in enumerate(vec)}

class It:
    __slots__=('id','kind','space','pool','statedir','ix','pre','rs','parent','children','state','holder','own','reporter','outfile','total','rord','nrep','S','creator','t','dinh','win','rp','seg','chk','dump')
    def __init__(s,**k):
        s.children=[]; s.state='Q'; s.holder=None; s.own=None; s.reporter=None; s.outfile=None; s.total=None; s.nrep=0; s.S=[]; s.dinh=None; s.win=None; s.rp=0; s.seg=None; s.chk=None; s.dump=None
        for a,b in k.items(): setattr(s,a,b)

def kvs(tokens): return dict(t.split('=',1) for t in tokens if '=' in t)

def load(path):
    items={}; errs=[]; claims=collections.defaultdict(set); runs={}
    for ln,line in enumerate(open(path),1):
        a=line.split()
        if not a: continue
        t=a[0]
        try:
            if t=='V': continue
            if t=='H': runs[a[2]]=dict(kv.split('=',1) for kv in a[3:] if '=' in kv); continue
            if t=='J':
                _,ts,id_,space,compat,pool,statedir,ix,holder,rord,d=a[:11]; d=int(d); pre=tuple(int(x) for x in a[11:11+d])
                if len(a)!=11+d: errs.append('line %d: J record length'%ln)
                items[int(id_)]=It(id=int(id_),kind='J',space=space,pool=pool,statedir=statedir,ix=int(ix),pre=pre,rs=0,parent=0,rord=int(rord),creator=holder,t=float(ts))
                it=items[int(id_)]; it.state='L'; it.holder=holder
                if holder=='-': it.state='Q'; it.holder=None   # queued by ADDJOBS
                continue
            if t=='X':
                _,ts,id_,par,kind,ix,rs,creator,key,d=a[:10]; d=int(d); pre=tuple(int(x) for x in a[10:10+d])
                kv=kvs(a[10+d:])
                if len(a)!=10+d+len(kv): errs.append('line %d: X record length'%ln)
                p=items.get(int(par))
                if p is None: errs.append('line %d: item %s has unknown parent %s'%(ln,id_,par)); continue
                if p.state not in ('L',): errs.append('line %d: child %s created while parent %d is %s'%(ln,id_,p.id,p.state))
                if int(ix)!=p.ix: errs.append('line %d: child %s job %s != parent job %d'%(ln,id_,ix,p.ix))
                it=It(id=int(id_),kind=kind,space=p.space,pool=p.pool,statedir=p.statedir,ix=p.ix,pre=pre,rs=int(rs),parent=p.id,rord=p.rord,creator=creator,t=float(ts))
                it.dinh=kv.get('dinh'); it.win=kv.get('win'); it.rp=int(kv.get('p',0))
                items[it.id]=it; p.children.append(it.id); continue
            if t=='L': it=items[int(a[2])]; it.state='L'; it.holder=a[3]; continue
            if t=='Q':
                it=items[int(a[2])]
                if it.state=='R' or it.state=='C': errs.append('line %d: reported item %d re-queued'%(ln,it.id))
                it.state='Q'; it.holder=None; continue
            if t=='R':
                _,ts,id_,run,key,n_,l_,p_,nch,outf=a[:10]; it=items[int(id_)]
                if it.state not in ('L','Q'): errs.append('line %d: second report for item %d (state %s)'%(ln,it.id,it.state))
                it.state='R'; it.own=(int(n_),int(l_),int(p_)); it.reporter=run; it.outfile=outf; it.nrep+=1; it.holder=None; it.seg=kvs(a[10:]).get('seg')
                if int(nch)!=len(it.children): errs.append('line %d: report of item %d says %s children, %d recorded'%(ln,it.id,nch,len(it.children)))
                continue
            if t=='C': it=items[int(a[2])]; it.state='C'; it.total=(int(a[3]),int(a[4]),int(a[5])); continue
            if t=='S':
                _,ts,space,pool,statedir,ix,n_,l_,p_,sec=a[:10]
                js=[i for i in items.values() if i.kind=='J' and i.space==space and i.ix==int(ix)]
                if len(js)!=1: errs.append('line %d: S record for %s %s matches %d job roots'%(ln,pool,ix,len(js))); continue
                js[0].S.append((int(n_),int(l_),int(p_))); continue
            if t=='F': it=items[int(a[2])]; it.state='F'; continue
            if t=='M':   # re-parent (xqd adopt): the child must lie inside the new parent's region; the old parent is still held
                c=items[int(a[2])]; old=items[c.parent]; nw=items[int(a[3])]
                if nw.parent!=old.id: errs.append('line %d: item %d moved to %d, not a sibling'%(ln,c.id,nw.id))
                if old.state!='L': errs.append('line %d: item %d moved while its parent %d is %s'%(ln,c.id,old.id,old.state))
                if not region_contains(nw,c.pre,lab_order(nw.rord)) or len(c.pre)<=len(nw.pre): errs.append('line %d: item %d moved into %d, not inside it'%(ln,c.id,nw.id))
                old.children.remove(c.id); nw.children.append(c.id); c.parent=nw.id; continue
            if t=='A': claims[a[2]].add(int(a[3])); continue
            if t=='U': claims[a[2]].discard(int(a[3])); continue
            if t in ('G','GL','GQ','GN'): continue   # regeneration requested / leased / re-queued / failed (the old segment stays)
            if t=='T':   # a top segment (--pctop, xqctl addtop): complete; its JOB children are the DUMP range
                _,ts,id_,space,pool,statedir,i_,rord,d=a[:9]; d=int(d); pre=tuple(int(x) for x in a[9:9+d]); kv=kvs(a[9+d:])
                it=It(id=int(id_),kind='T',space=space,pool=pool,statedir=statedir,ix=int(i_),pre=pre,rs=0,parent=0,rord=int(rord),creator='-',t=float(ts))
                it.state='C'; it.seg=kv.get('seg'); it.dump=kv.get('dump'); it.own=(int(kv.get('nodes',0)),0,0); it.total=it.own; it.nrep=1; items[it.id]=it; continue
            if t=='GS':   # the segment of an item reported with seg=pending (fast spill)
                it=items[int(a[2])]; it.seg=kvs(a[4:]).get('seg'); continue
            if t=='GR':   # regenerated: same counts and sha256 (checked by the queue); the segment reference names the new copy
                it=items[int(a[2])]; ns=kvs(a[4:]).get('seg','')
                if not it.seg or (not it.seg.endswith((':pending',':ERR')) and ns.split(':')[-1]!=it.seg.split(':')[-1]): errs.append('line %d: regenerated segment of item %d has another sha256'%(ln,it.id))
                it.seg=ns; continue
            if t=='W':   # the Lean check of an item segment: W t id sha256 result ndecl thmhash
                it=items[int(a[2])]
                if not it.seg or it.seg.split(':')[-1]!=a[3]: errs.append('line %d: check of item %d names another segment'%(ln,it.id))
                kv=kvs(a[7:]); it.chk=tuple(a[3:7])+(kv.get('conf','-'),kv.get('chunk','-'),kv.get('olean','-'),kv.get('keys','-')); continue   # sha, result, ndecl, thm, conf, chunk, olean, keys
            if t in ('N','K'): continue
            errs.append('line %d: unknown record %s'%(ln,t))
        except (KeyError,ValueError,IndexError) as e: errs.append('line %d: %r on %r'%(ln,e,line[:120]))
    return items,errs,claims,runs

def region_contains(it,pre,L):
    """does item it's region contain the node with prefix pre (pre at least as deep as it's node; ranges: below their node)"""
    P=it.pre
    if len(pre)<len(P) or pre[:len(P)]!=P: return False
    if it.kind=='Q':
        if len(pre)==len(P): return False
        return pre[len(P)] in L and L[pre[len(P)]]>=L[it.rs]
    return True

def audit(items,errs,args):
    LABS={}
    roots=[i for i in items.values() if i.kind=='J']
    for it in items.values():
        L=LABS.setdefault(it.rord,lab_order(it.rord))
        if it.kind=='Q' and it.rs not in L: errs.append('item %d: range start %d is not a label'%(it.id,it.rs))
        if it.parent:
            p=items[it.parent]
            if it.kind=='Q' and it.pre==p.pre:   # the rest of the parent's own node (a spill at the parent's root)
                if p.kind=='Q' and L[it.rs]<L[p.rs]: errs.append('item %d: range start below its parent range %d'%(it.id,p.id))
            elif not (len(it.pre)>len(p.pre) and region_contains(p,it.pre,L)): errs.append('item %d (%s, depth %d) not inside its parent %d (%s, depth %d)'%(it.id,it.kind,len(it.pre),p.id,p.kind,len(p.pre)))
    # sibling disjointness
    for it in items.values():
        ch=[items[c] for c in it.children]
        if len(ch)<2: continue
        L=LABS[it.rord]
        byp=collections.defaultdict(list)
        for c in ch: byp[c.pre].append(c)
        for pre,cs in byp.items():
            if len(cs)>1 and not all(c.kind=='Q' for c in cs): errs.append('item %d: %d children with the same prefix (depth %d)'%(it.id,len(cs),len(pre)))
            if len(cs)>1 and all(c.kind=='Q' for c in cs): errs.append('item %d: %d ranges at the same node (depth %d)'%(it.id,len(cs),len(pre)))
        pres=set(byp)
        for c in ch:
            for k in range(len(it.pre)+1,len(c.pre)):
                q=c.pre[:k]
                if q in byp:
                    for o in byp[q]:
                        if o.id!=c.id and region_contains(o,c.pre,L): errs.append('item %d: child %d lies inside sibling %d'%(it.id,c.id,o.id))
            if c.kind=='Q':   # a range at node S also contains pieces deeper below S with first label >= its start
                pass
    # accounting
    bad_tot=0
    for it in items.values():
        if it.state=='C':
            if it.nrep!=1: errs.append('item %d complete with %d reports'%(it.id,it.nrep))
            tot=list(it.own or (0,0,0))
            for c in it.children:
                ch=items[c]
                if ch.state!='C': errs.append('item %d complete but child %d is %s'%(it.id,c,ch.state)); continue
                for k in range(3): tot[k]+=ch.total[k]
            if tuple(tot)!=it.total: errs.append('item %d total %s != own+children %s'%(it.id,it.total,tuple(tot))); bad_tot+=1
    # job state lines
    done={}; incomplete=[]
    sfiles={}
    for j in roots:
        if j.state=='C':
            if len(j.S)!=1 or j.S[0]!=j.total: errs.append('job %s %d: S records %s, total %s'%(j.pool,j.ix,j.S,j.total))
            sp=os.path.join(j.statedir,'gather','xq','state_%s_xq.txt'%j.pool)
            if sp not in sfiles:
                d=collections.defaultdict(list)
                if os.path.exists(sp):
                    for l in open(sp):
                        b=l.split()
                        if len(b)>=5: d[int(b[0])].append((int(b[1]),int(b[2]),int(b[3])))
                sfiles[sp]=d
            got=sfiles[sp].get(j.ix,[])
            if got.count(j.total)<1: errs.append('job %s %d: line %s missing from %s (has %s)'%(j.pool,j.ix,j.total,sp,got))
            done[(j.pool,j.space,j.ix)]=j.total
        else: incomplete.append(j)
    r3q=any(i.seg for i in items.values())
    if r3q:   # prof7R3q: every reported item of a complete job carries its certificate segment
        for j in roots:
            if j.state!='C': continue
            for x in sub(items,j):
                it=items[x]
                if not it.seg or it.seg.endswith(':ERR') or len(it.seg.split(':'))!=5: errs.append('item %d (job %s %d): no certificate segment (%s)'%(it.id,j.pool,j.ix,it.seg))
                if it.kind=='Q' and not it.rp: errs.append('item %d: range without a delta base'%it.id)
    st=collections.Counter(i.state for i in items.values())
    waiting=[i for i in items.values() if i.state in ('Q','L','F')]
    print('items %d %s; job roots %d (complete %d, incomplete %d); structural/accounting errors %d'%(len(items),dict(st),len(roots),len(done),len(incomplete),len(errs)))
    for e in errs[:50]: print('ERROR',e)
    for j in incomplete[:20]:
        n=collections.Counter(items[c].state for c in sub(items,j))
        print('INCOMPLETE job %s %d: root %s, tree states %s'%(j.pool,j.ix,j.state,dict(n)))
    for i in waiting[:20]: print('WAITING item %d %s job %s %d state %s holder %s'%(i.id,i.kind,i.pool,i.ix,i.state,i.holder))
    return done,incomplete

def top_coverage(items,errs,root=None):
    """top segments (T): every JOB prefix of a T's DUMP range is the root of exactly one T or J item; with any T present, every J item and every T
    but the root(s) has exactly one JOB pointing at it; root (codes) given: the unreferenced T items are exactly that prefix"""
    import hashlib
    tops=[i for i in items.values() if i.kind=='T']
    if not tops: return
    byroot=collections.defaultdict(list)
    for i in items.values():
        if i.kind in ('T','J'): byroot[(i.space if i.kind=='J' else None,i.pre)].append(i)
    roots_any=collections.defaultdict(list)
    for (sp,pre),lst in byroot.items():
        for i in lst: roots_any[pre].append(i)
    refs=collections.Counter(); dumps={}; njob=0
    for t in tops:
        if not t.dump: errs.append('top segment %d: no DUMP range'%t.id); continue
        path,sha,first,count=t.dump.rsplit(':',3); first=int(first); count=int(count)
        if path not in dumps:
            raw=open(path,'rb').read()
            if hashlib.sha256(raw).hexdigest()[:16]!=sha: errs.append('DUMP %s changed since addtop'%path)
            dumps[path]={int(l.split()[0]):tuple(int(x) for x in l.split()[1:]) for l in raw.decode().splitlines() if l.split()}
        dm=dumps[path]
        for ix in range(first,first+count):
            pre=dm.get(ix)
            if pre is None: errs.append('top segment %d: JOB %d not in %s'%(t.id,ix,path)); continue
            tgt=roots_any.get(pre,[]); njob+=1
            if len(tgt)!=1: errs.append('top segment %d: JOB %d (depth %d) resolves to %d items'%(t.id,ix,len(pre),len(tgt))); continue
            refs[tgt[0].id]+=1
    for i in items.values():
        if i.kind=='J' and refs[i.id]!=1: errs.append('job root %d (%s %d): %d JOBs point at it'%(i.id,i.pool,i.ix,refs[i.id]))
        if i.kind=='T' and refs[i.id]>1: errs.append('top segment %d: %d JOBs point at it'%(i.id,refs[i.id]))
    unref=[t for t in tops if refs[t.id]==0]
    if root is not None and (len(unref)!=1 or unref[0].pre!=root): errs.append('unreferenced top segments %s, expected exactly the root %s'%([t.pre for t in unref][:5],root))
    print('top segments %d, JOBs %d, unreferenced (roots) %d'%(len(tops),njob,len(unref)))

def write_plan(items,path):
    """item trees of the complete jobs, for r3qglue: J pool space ix root n l p, then the tree's items in pre-order (children by id):
    I id parent kind rs rp d prefix... [dinh=HEX] [win=HEX] seg=HOST:FILE:OFF:LEN:SHA [chk=RESULT:NDECL:THMHASH]  (prefixes and labels as vectors)"""
    n=0
    with open(path,'w') as f:
        f.write('#r3qplan 1\n')
        for t in sorted((i for i in items.values() if i.kind=='T'),key=lambda i:(i.pool,i.ix)):   # top segments: T pool space i id d prefix... seg=... dump=PATH:SHA:FIRST:COUNT
            f.write('T %s %s %d %d %d%s seg=%s dump=%s\n'%(t.pool,t.space,t.ix,t.id,len(t.pre),''.join(' %d'%v for v in t.pre),t.seg,t.dump))
        for j in sorted((i for i in items.values() if i.kind=='J' and i.state=='C'),key=lambda i:(i.pool,i.ix)):
            f.write('J %s %s %d %d %d %d %d\n'%(j.pool,j.space,j.ix,j.id,*j.total)); n+=1
            st=[j.id]
            while st:
                it=items[st.pop()]
                f.write('I %d %d %s %d %d %d%s%s%s seg=%s%s\n'%(it.id,it.parent,it.kind,it.rs,it.rp,len(it.pre),''.join(' %d'%v for v in it.pre),
                        ' dinh='+it.dinh if it.dinh else '',' win='+it.win if it.win else '',it.seg,(' chk='+':'.join(it.chk[1:5])+(' chunk=%s olean=%s'%(it.chk[5],it.chk[6]) if len(it.chk)>6 and it.chk[6]!='-' else '')+(' keys=%s'%it.chk[7] if len(it.chk)>7 and it.chk[7]!='-' else '')) if it.chk else ''))
                st.extend(sorted(it.children,reverse=True))
    print('plan: %d complete jobs -> %s'%(n,path))

def sub(items,j):
    st=[j.id]; out=[]
    while st:
        x=st.pop(); out.append(x); st.extend(items[x].children)
    return out

def owner(items,j,p,L):
    """the item of job tree j whose own region holds the leaf with path p"""
    cur=j
    while True:
        nxt=None
        for c in cur.children:
            ch=items[c]
            if len(p)>len(ch.pre) and region_contains(ch,p,L) or (ch.kind!='Q' and p[:len(ch.pre)]==ch.pre): nxt=ch; break
        if nxt is None: return cur
        cur=nxt

def prof_check(items,files):
    roots=[i for i in items.values() if i.kind=='J']; byd=collections.defaultdict(dict)
    for j in roots: byd[len(j.pre)][j.pre]=j
    L=lab_order(roots[0].rord) if roots else {}
    cnt=collections.Counter(); seen=collections.defaultdict(set); nin=0; nout=0
    for f in files:
        bn=os.path.basename(f)
        for line in open(f):
            a=line.split()
            if len(a)!=22: continue
            p=tuple(int(x) for x in a); j=None
            for d,m in byd.items():
                j=m.get(p[:d])
                if j: break
            if j is None: nout+=1; continue
            nin+=1; o=owner(items,j,p,L); cnt[(o.id,bn)]+=1; seen[o.id].add(bn)
    bad=0; copies=0
    for it in items.values():
        if it.state not in ('R','C'): continue
        bn=os.path.basename(it.outfile or '-'); got=cnt.get((it.id,bn),0)
        if got!=it.own[2]:
            bad+=1
            if bad<=30: print('PROFILES item %d (%s job %s %d): reported %d in %s, found %d there; other files %s'%(it.id,it.kind,it.pool,it.ix,it.own[2],bn,got,{b:cnt[(it.id,b)] for b in seen[it.id] if b!=bn}))
        copies+=sum(cnt[(it.id,b)] for b in seen[it.id] if b!=bn)
    print('profiles: %d lines in queue job trees (%d outside), items with a profile mismatch %d, copies in other files %d'%(nin,nout,bad,copies))
    return bad

if __name__=='__main__':
    ap=argparse.ArgumentParser(); ap.add_argument('manifest'); ap.add_argument('--prof',nargs='*',default=[]); ap.add_argument('--ref',nargs='*',default=[]); ap.add_argument('--plan')
    ap.add_argument('--root',help='codes of the one top segment no JOB points at (case II: the code of label 0)')
    o=ap.parse_args()
    items,errs,claims,runs=load(o.manifest)
    top_coverage(items,errs,tuple(int(x) for x in o.root.split(',')) if o.root else None)
    done,inc=audit(items,errs,o)
    if o.plan: write_plan(items,o.plan)
    rc=0 if not errs and not inc else 1
    if o.prof:
        files=[]
        for x in o.prof: files+=sorted(glob.glob(os.path.join(x,'*.prof'))) if os.path.isdir(x) else [x]
        if prof_check(items,files): rc=1
    if o.ref:
        ref={}
        for f in o.ref:
            for l in open(f):
                b=l.split()
                if len(b)>=5: ref[int(b[0])]=(int(b[1]),int(b[2]),int(b[3]))
        mism=0
        for (pool,space,ix),tot in done.items():
            if ix in ref and ref[ix]!=tot: mism+=1; print('REF job %s %d: queue %s, reference %s'%(pool,ix,tot,ref[ix]))
        print('reference: %d queue jobs compared, %d mismatches'%(sum(1 for k in done if k[2] in ref),mism))
        if mism: rc=1
    print('AUDIT %s'%('OK' if rc==0 else 'FAILED'))
    sys.exit(rc)
