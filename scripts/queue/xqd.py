#!/usr/bin/env python3
"""xqd.py --base DIR [--port 7919] [--lease 120]: the item queue of prof7L92 / prof7L93 (2026-10-06).

State = a tree of items per job, kept in DIR/manifest.log (append-only, every acknowledged change fsynced before the answer is sent):
  J  job root: a list job of some run that handed pieces to the queue (or spilled); its "own part" is the job's tree minus its children.
  P  piece: the subtree of a prefix.   Q  range: node prefix S and first child label l: S's children with label >= l (S not counted).
An item is Queued, Leased (to one run), Reported (its own part done: counts n l p by one run), Complete (reported and every child
complete; total = own + sum of the children's totals), or Failed (the run could not replay it).  When a job root completes, the job's
state line "ix n l p sec" is appended to <statedir>/gather/xq/state_<pool>_xq.txt (statedir = the dirname of the producer's --state),
where the pool controllers' gather union finds it.  Leases die with their run: no message for --lease seconds re-queues them.

Runs connect over TCP (protocol in DESIGN.md).  Pieces are handed out only within a compat group (search options without the frontier,
table and kept-row identity).  Idle runs say W k; the server leases queued items or asks busy runs to hand over pieces (GIVE k).
Coordination with ops/autosplit.py: CLAIM pool x.. marks jobs as autosplit's (exports and spills of them are refused) unless the queue
already tracks them; DIR/tracked_<pool>.txt and DIR/moved_from_<pool>.txt list the jobs the queue holds (the second is what the cover
scripts put into the pools' skip files).  Admin commands come from ops/xqctl.py.  Restart-safe: the manifest is replayed at start."""
import asyncio, os, sys, time, json, argparse, collections

def now(): return time.time()
def kvs(tokens):
    """trailing key=value tokens of a record or message -> dict (prof7R3q: dinh, win, p, seg)"""
    return dict(t.split('=',1) for t in tokens if '=' in t)

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
_LAB={}
def lab_order(rord):
    if rord not in _LAB:
        ro=[rord//100,(rord//10)%10,rord%10]; vec=[v for t in ro for v in range(1,512) if rank3(v)==t]
        _LAB[rord]={v:i for i,v in enumerate(vec)}
    return _LAB[rord]

class Item:
    __slots__=('id','kind','space','compat','pool','statedir','ix','prefix','rs','parent','children','state','holder','last_holder',
               'own','reporter','outfile','total','creator','key','t0','rord','pidx','ridx','inh','inh_for','dinh','win','rp','_seg','chk','rg','rg_holder','dump')
    SEGIDX=collections.defaultdict(set)   # host -> ids of the items whose segment reference names it: SEGS host=H walks only those (run 1: 88 checkds
    # walking all 1.2M items kept xqd at 100% CPU)
    @property
    def seg(s): return s._seg
    @seg.setter
    def seg(s,v):
        o=getattr(s,'_seg',None)
        if o: Item.SEGIDX[o.split(':')[0]].discard(s.id)
        s._seg=v
        if v: Item.SEGIDX[v.split(':')[0]].add(s.id)
    def __init__(s,id,kind,space,compat,pool,statedir,ix,prefix,rs,parent,creator,key,t0,rord):
        s.id=id; s.kind=kind; s.space=space; s.compat=compat; s.pool=pool; s.statedir=statedir; s.ix=ix; s.prefix=prefix; s.rs=rs
        s.parent=parent; s.children=[]; s.state='Q'; s.holder=None; s.last_holder=None; s.own=None; s.reporter=None; s.outfile=None
        s.total=None; s.creator=creator; s.key=key; s.t0=t0; s.rord=rord; s.pidx=None; s.ridx=None; s.inh=None; s.inh_for=None
        s.dinh=None; s.win=None; s.rp=0; s.seg=None; s.chk=None; s.rg=None; s.rg_holder=None; s.dump=None   # prof7R3q (dump: a top segment's JOB range PATH:SHA:FIRST:COUNT): inherited dead mask (hex), range delta base (vec), segment host:file:off:len:sha256, check result

class Run:
    def __init__(s,name):
        s.name=name; s.info={}; s.writer=None; s.last_seen=now(); s.alive=True; s.ready=False; s.want=0; s.qlen=0; s.idle=0
        s.free=0; s.leased=set(); s.give_t=0.0; s.bye=False
    @property
    def compat(s): return s.info.get('compat','')
    @property
    def space(s): return s.info.get('space','')

class XQ:
    def __init__(s,base,lease):
        s.base=base; s.lease_t=lease; os.makedirs(base,exist_ok=True)
        s.items={}; s.next_id=1; s.jobs={}; s.runs={}; s.keys={}; s.claims=collections.defaultdict(set); s.repkey={}   # repkey: report key run:c -> item (SG)
        s.tops={}   # (space, prefix) -> top segment item (--pctop, xqctl addtop)
        s.queue=collections.defaultdict(collections.deque); s.buf=[]; s.side=collections.defaultdict(list); s.waiters=[]; s.ev=None
        s.pub_dirty=True; s.stats=collections.Counter(); s.t_start=now(); s.log_f=open(os.path.join(base,'xqd.log'),'a',buffering=1)
        s.mpath=os.path.join(base,'manifest.log'); s.mid=None; s.replay()
        s.mf=open(s.mpath,'a')
        if os.path.getsize(s.mpath)==0: s.mid='%.3f'%now(); s.mf.write('V 1 %s\n'%s.mid); s.mf.flush(); os.fsync(s.mf.fileno())
    def log(s,m): s.log_f.write('%s %s\n'%(time.strftime('%Y-%m-%dT%H:%M:%SZ',time.gmtime()),m))

    # ---------------- manifest ----------------
    def rec(s,*a): s.buf.append(' '.join(str(x) for x in a))
    def side_line(s,path,line): s.side[path].append(line)
    async def sync(s):
        fut=asyncio.get_running_loop().create_future(); s.waiters.append(fut); s.ev.set(); await fut
    def _write(s,data,side):
        if data: s.mf.write(data); s.mf.flush(); os.fsync(s.mf.fileno())
        for path,lines in side.items():
            os.makedirs(os.path.dirname(path),exist_ok=True)
            with open(path,'a') as f: f.write(''.join(l+'\n' for l in lines)); f.flush(); os.fsync(f.fileno())
    async def flusher(s):
        loop=asyncio.get_running_loop()
        while True:
            await s.ev.wait(); s.ev.clear()
            buf,s.buf=s.buf,[]; side,s.side=s.side,collections.defaultdict(list); waiters,s.waiters=s.waiters,[]
            if buf or side:
                try: await loop.run_in_executor(None,s._write,''.join(l+'\n' for l in buf),side)
                except Exception as e: s.log('FATAL manifest write failed: %r'%e); os._exit(3)
            for w in waiters:
                if not w.done(): w.set_result(True)

    def replay(s):
        if not os.path.exists(s.mpath): return
        n=0; sfx=collections.defaultdict(dict)
        for line in open(s.mpath):
            a=line.split()
            if not a: continue
            try: s.apply(a,sfx)
            except Exception as e: s.log('replay: bad line %r: %r'%(line[:200],e)); continue
            n+=1
        t=now()
        for r in s.runs.values(): r.alive=True; r.last_seen=t; r.writer=None; r.ready=False   # they get --lease seconds to come back
        # state lines whose manifest S record exists but whose file line was lost in a crash
        for path,lines in sfx.items():
            have=set()
            if os.path.exists(path):
                for l in open(path):
                    b=l.split()
                    if b: have.add(int(b[0]))
            miss=[ln for ix,ln in lines.items() if ix not in have]
            if miss:
                os.makedirs(os.path.dirname(path),exist_ok=True)
                with open(path,'a') as f: f.write(''.join(m+'\n' for m in miss)); f.flush(); os.fsync(f.fileno())
                s.log('replay: %d state lines restored into %s'%(len(miss),path))
        for it in s.items.values():
            if it.state=='Q': s.queue[it.compat].append(it.id)
            if it.rg=='Q': s.queue[it.compat].appendleft(it.id)
        s.log('replay: %d records, %d items, %d runs, %d claims'%(n,len(s.items),len(s.runs),sum(len(v) for v in s.claims.values())))

    def apply(s,a,sfx=None):
        """apply one manifest record (replay); the live handlers build the same state and append the same record"""
        t=a[0]
        if t=='V':
            if s.mid is None: s.mid=a[2]   # manifest id: the creation time of this manifest (same across restarts)
            return
        if t=='H':
            name=a[2]; r=s.runs.get(name) or Run(name); s.runs[name]=r
            r.info=dict(kv.split('=',1) for kv in a[3:] if '=' in kv); return
        if t=='J':
            _,ts,id_,space,compat,pool,statedir,ix,holder,rord,d=a[:11]; id_=int(id_); d=int(d); pre=tuple(int(x) for x in a[11:11+d])
            it=Item(id_,'J',space,compat,pool,statedir,int(ix),pre,0,0,holder,'-',float(ts),int(rord)); it.state='L'; it.holder=holder; it.last_holder=holder; it.inh=set(); it.inh_for=holder
            if holder=='-': it.state='Q'; it.holder=None; it.last_holder=None   # queued by ADDJOBS (no producer)
            s.items[id_]=it; s.jobs[(space,int(ix))]=id_; s.next_id=max(s.next_id,id_+1)
            r=s.runs.get(holder)
            if r and holder!='-': r.leased.add(id_)
            return
        if t=='X':
            _,ts,id_,parent,kind,ix,rs,creator,key,d=a[:10]; id_=int(id_); parent=int(parent); d=int(d); pre=tuple(int(x) for x in a[10:10+d])
            p=s.items[parent]
            it=Item(id_,kind,p.space,p.compat,p.pool,p.statedir,int(ix),pre,int(rs),parent,creator,key,float(ts),p.rord)
            kv=kvs(a[10+d:]); it.dinh=kv.get('dinh'); it.win=kv.get('win'); it.rp=int(kv.get('p',0))
            s.items[id_]=it; p.children.append(id_); s.idx_add(p,it); s.next_id=max(s.next_id,id_+1); s.keys[key]=('XA',id_,parent); return
        if t=='L':
            it=s.items[int(a[2])]; s._unhold(it); it.state='L'; it.holder=a[3]; it.last_holder=a[3]; it.inh=set(it.children); it.inh_for=a[3]
            r=s.runs.get(a[3])
            if r: r.leased.add(it.id)
            return
        if t=='Q':
            it=s.items[int(a[2])]; s._unhold(it); it.state='Q'; return
        if t=='R':
            _,ts,id_,run,key,n_,l_,p_,nexp,outf=a[:10]; it=s.items[int(id_)]; s._unhold(it)
            it.state='R'; it.own=(int(n_),int(l_),int(p_)); it.reporter=run; it.outfile=outf; it.seg=kvs(a[10:]).get('seg'); s.keys[key]=('RA',); s.repkey[key]=it.id; return
        if t=='C':
            it=s.items[int(a[2])]; it.state='C'; it.total=(int(a[3]),int(a[4]),int(a[5])); return
        if t=='S':
            _,ts,space,pool,statedir,ix,n_,l_,p_,sec=a[:10]
            if sfx is not None: sfx[s.state_path(statedir,pool)][int(ix)]='%s %s %s %s %s'%(ix,n_,l_,p_,sec)
            return
        if t=='A': s.claims[a[2]].add(int(a[3])); return
        if t=='U': s.claims[a[2]].discard(int(a[3])); return
        if t=='F':
            it=s.items[int(a[2])]; s._unhold(it); it.state='F'; return
        if t=='N': s.keys[a[2]]=('N',' '.join(a[3:])); return
        if t in ('G','GL','GQ','GR','GN'):   # prof7R3q regeneration: requested / leased / re-queued / done (new segment) / failed
            it=s.items[int(a[2])]
            if t=='G' or t=='GQ': it.rg='Q'; it.rg_holder=None
            elif t=='GL':
                it.rg='L'; it.rg_holder=a[3]; r=s.runs.get(a[3])
                if r: r.leased.add(it.id)
            else:
                r=s.runs.get(it.rg_holder) if it.rg_holder else None
                if r: r.leased.discard(it.id)
                it.rg=None; it.rg_holder=None
                if t=='GR': it.seg=kvs(a[4:]).get('seg',it.seg)
            return
        if t=='T':   # prof7R3q: T t id space pool statedir i rord d prefix... seg=... dump=PATH:SHA:FIRST:COUNT nodes=N: a top segment (--pctop), complete
            _,ts,id_,space,pool,statedir,i_,rord,d=a[:9]; id_=int(id_); d=int(d); pre=tuple(int(x) for x in a[9:9+d]); kv=kvs(a[9+d:])
            it=Item(id_,'T',space,'-',pool,statedir,int(i_),pre,0,0,'-','-',float(ts),int(rord)); it.state='C'; it.seg=kv.get('seg'); it.dump=kv.get('dump')
            it.own=(int(kv.get('nodes',0)),0,0); it.total=it.own; s.items[id_]=it; s.tops[(space,pre)]=id_; s.next_id=max(s.next_id,id_+1); return
        if t=='GS':   # prof7R3q: GS t id run seg=...: the segment of an item reported with seg=pending (fast spill), sent later by the same host
            it=s.items[int(a[2])]; it.seg=kvs(a[4:]).get('seg',it.seg); return
        if t=='WV':   # prof7R3q: WV t id reason: the item's check is void (its chunk was lost with a host's local store): it is checked again
            it=s.items.get(int(a[2]))
            if it is not None: it.chk=None
            return
        if t=='W':   # prof7R3q: W t id sha256 result ndecl thmhash: the item segment's Lean check
            it=s.items.get(int(a[2]))
            if it is not None: it.chk=tuple(a[3:7])+(kvs(a[7:]).get('conf','-'),)   # (sha256, result, ndecl, thm, check configuration)
            return
        if t=='K':
            it=s.items[int(a[2])]; s._unhold(it); it.state='K'; return
        if t=='M':   # re-parent: an earlier holder's child lies inside a new child's region
            c=s.items[int(a[2])]; old=s.items[c.parent]; new=s.items[int(a[3])]; old.children.remove(c.id); s.idx_del(old,c); new.children.append(c.id); s.idx_add(new,c); c.parent=new.id
            if old.inh is not None: old.inh.discard(c.id)
            return

    def _unhold(s,it):
        if it.holder:
            r=s.runs.get(it.holder)
            if r: r.leased.discard(it.id)
        it.holder=None

    def state_path(s,statedir,pool): return os.path.join(statedir,'gather','xq','state_%s_xq.txt'%pool)

    # ---------------- helpers ----------------
    def new_id(s): i=s.next_id; s.next_id+=1; return i
    async def send(s,r,line):
        if r.writer is None: return
        try: r.writer.write((line+'\n').encode())
        except Exception: pass
    def under(s,parent,pre,rs_ok=True):
        """child prefix pre lies strictly inside the subtree of item parent (a range: below its node, first label >= the start)"""
        P=parent.prefix
        if len(pre)<=len(P) or pre[:len(P)]!=P: return False
        if parent.kind=='Q':
            L=lab_order(parent.rord)
            if pre[len(P)] not in L or L[pre[len(P)]]<L[parent.rs]: return False
        return True
    def idx_add(s,parent,ch):
        if parent.pidx is None: parent.pidx={}; parent.ridx=collections.defaultdict(list)
        if ch.kind=='Q': parent.ridx[ch.prefix].append((ch.rs,ch.id))
        else: parent.pidx[ch.prefix]=ch.id
    def idx_del(s,parent,ch):
        if parent.pidx is None: return
        if ch.kind=='Q': parent.ridx[ch.prefix]=[x for x in parent.ridx[ch.prefix] if x[1]!=ch.id]
        elif parent.pidx.get(ch.prefix)==ch.id: del parent.pidx[ch.prefix]
    def overlap(s,unit,pre,kind):
        """a new child of unit at node pre starts at or inside an existing child (no run explores inside a child: a client bug otherwise)"""
        if unit.pidx is None: return False
        L=lab_order(unit.rord); n0=len(unit.prefix)
        for k in range(n0+1,len(pre)+1):
            if pre[:k] in unit.pidx: return True
        for k in range(n0,len(pre)):
            for (rs2,cid) in unit.ridx.get(pre[:k],()):
                if L.get(pre[k],-1)>=L.get(rs2,1<<30): return True
        if kind=='Q' and unit.ridx.get(pre): return True
        return False
    def adopt(s,unit,ch,holder):
        """children of unit exported by an earlier holder (a re-leased item) whose region lies inside the new child ch move under ch: the
        holder that created ch skipped them, and so will ch's holder (they are in ch's skip list); without this they are counted twice"""
        if unit.inh_for!=holder: unit.inh=set(c for c in unit.children if s.items[c].creator!=holder); unit.inh_for=holder   # (not reached: lease() sets it)
        if not unit.inh: return
        mv=[c for c in unit.inh if c!=ch.id and s.under(ch,s.items[c].prefix)]
        for c in mv:
            unit.children.remove(c); s.idx_del(unit,s.items[c]); unit.inh.discard(c); ch.children.append(c); s.idx_add(ch,s.items[c]); s.items[c].parent=ch.id; s.rec('M','%.3f'%now(),c,ch.id)
        if mv: s.stats['adopted']+=len(mv); s.log('item %d (%s) takes %d children of item %d from earlier holders'%(ch.id,ch.kind,len(mv),unit.id))
    # ---------------- regeneration of a lost certificate segment (prof7R3q) ----------------
    # REGEN re-runs a reported item on any compatible run with all its children in the item line (pieces skipped as DON, ranges stopped
    # at as RNG), no hand-offs: the run must report the same own counts and a segment with the same sha256; the item's segment
    # reference then names the new copy.  The tree, the totals and the job state lines do not change.
    def dispatchable(s,it): return it.state=='Q' or it.rg=='Q'
    def rg_request(s,it):
        if it.state not in ('R','C') or not it.seg or it.rg or it.kind=='T': return False
        it.rg='Q'; it.rg_holder=None; s.rec('G','%.3f'%now(),it.id,'req'); s.queue[it.compat].appendleft(it.id); return True
    def rg_lease(s,it,r):
        it.rg='L'; it.rg_holder=r.name; r.leased.add(it.id); s.rec('GL','%.3f'%now(),it.id,r.name)
    def rg_requeue(s,it,reason):
        if it.rg!='L': return
        r=s.runs.get(it.rg_holder)
        if r: r.leased.discard(it.id)
        it.rg='Q'; it.rg_holder=None; s.rec('GQ','%.3f'%now(),it.id,reason); s.queue[it.compat].appendleft(it.id)
    def lease(s,it,r):   # inh: the children at lease time (the item line's skip list); adopt() moves the ones a new child contains
        s.rec('L','%.3f'%now(),it.id,r.name); it.state='L'; it.holder=r.name; it.last_holder=r.name; it.inh=set(it.children); it.inh_for=r.name; r.leased.add(it.id)
    def requeue(s,it,reason,front=True):
        s._unhold(it); it.state='Q'; s.rec('Q','%.3f'%now(),it.id,reason)
        (s.queue[it.compat].appendleft if front else s.queue[it.compat].append)(it.id)
    def item_line(s,it):
        rsv=it.rs if it.kind=='Q' else 0
        t='I %d %s %d %d %d %s'%(it.id,it.kind,it.ix,rsv,len(it.prefix),' '.join(map(str,it.prefix)))
        if it.dinh: t+=' dinh='+it.dinh
        if it.win: t+=' win='+it.win   # batch 12 (--pcwit): the witness rows of dinh
        if it.kind=='Q' and it.rp: t+=' p=%d'%it.rp
        if it.rg=='L': t+=' rg=1'
        for c in it.children:   # children exported before (by an earlier holder): the new holder skips them
            ch=s.items[c]
            if ch.kind=='P': t+=' | %d %s'%(len(ch.prefix),' '.join(map(str,ch.prefix)))
            elif it.rg=='L': t+=' | R %d %s %d'%(len(ch.prefix),' '.join(map(str,ch.prefix)),ch.rs)   # regeneration: the range child starts here (RNG)
            else: raise RuntimeError('item %d has a %s child %d: only spills create ranges, and a spill reports its unit'%(it.id,ch.kind,c))
        return t
    def check_complete(s,it):
        """it is Reported: complete it if every child is complete; propagate up; job roots write their state line"""
        while it is not None and it.state=='R':
            tot=list(it.own)
            for c in it.children:
                ch=s.items[c]
                if ch.state!='C': return
                for k in range(3): tot[k]+=ch.total[k]
            it.state='C'; it.total=tuple(tot); s.rec('C','%.3f'%now(),it.id,*tot); s.stats['complete']+=1
            if it.kind=='J':
                sec=now()-it.t0; s.rec('S','%.3f'%now(),it.space,it.pool,it.statedir,it.ix,tot[0],tot[1],tot[2],'%.2f'%sec)
                s.side_line(s.state_path(it.statedir,it.pool),'%d %d %d %d %.2f'%(it.ix,tot[0],tot[1],tot[2],sec))
                s.log('job %s %d complete: %d %d %d (%d items)'%(it.pool,it.ix,tot[0],tot[1],tot[2],s.count_tree(it))); s.pub_dirty=True
                return
            it=s.items.get(it.parent)
    def count_tree(s,it):
        n=1; st=list(it.children)
        while st:
            c=s.items[st.pop()]; n+=1; st.extend(c.children)
        return n
    def tracked_others(s,r):
        """job indices of r's space handed to the queue and not leased to r"""
        out=[]
        for (space,ix),jid in s.jobs.items():
            if space!=r.space: continue
            it=s.items[jid]
            if not (it.state=='L' and it.holder==r.name): out.append(ix)
        return out
    async def broadcast_T(s,it):
        for r in s.runs.values():
            if r.writer and r.space==it.space and r.name!=it.holder: await s.send(r,'T %d'%it.ix)

    # ---------------- unit resolution (X and SP) ----------------
    def resolve_unit(s,r,ref):
        """ref = ['j', ix, d, v..] or ['i', id] -> (item, created, error)"""
        if ref[0]=='j':
            ix=int(ref[1]); d=int(ref[2]); pre=tuple(int(x) for x in ref[3:3+d])
            if ix in s.claims.get(r.info.get('pool','-'),()): return None,False,'claimed'
            jid=s.jobs.get((r.space,ix))
            if jid is None:
                it=Item(s.new_id(),'J',r.space,r.compat,r.info.get('pool','-'),r.info.get('statedir','-'),ix,pre,0,0,r.name,'-',now(),int(r.info.get('rord','123')))
                it.state='L'; it.holder=r.name; it.last_holder=r.name; it.inh=set(); it.inh_for=r.name; r.leased.add(it.id); s.items[it.id]=it; s.jobs[(r.space,ix)]=it.id
                s.rec('J','%.3f'%it.t0,it.id,it.space,it.compat,it.pool,it.statedir,ix,r.name,it.rord,len(pre),*pre); s.pub_dirty=True; s.stats['jobs']+=1
                return it,True,None
            it=s.items[jid]
            if it.prefix!=pre: return None,False,'rootmismatch'
            if it.state=='L' and it.holder==r.name: return it,False,None
            if it.state=='Q' and it.last_holder==r.name: s.lease(it,r); return it,False,None
            return None,False,('owned' if it.state in ('L','Q') else 'done')
        it=s.items.get(int(ref[1]))
        if it is None: return None,False,'noitem'
        if it.state=='L' and it.holder==r.name: return it,False,None
        if it.state=='Q' and it.last_holder==r.name: s.lease(it,r); return it,False,None
        return None,False,'notyours'

    # ---------------- message handlers ----------------
    async def h_hello(s,r,a):
        info=dict(kv.split('=',1) for kv in a[2:] if '=' in kv)
        r.info=info; r.alive=True; r.bye=False; r.ready=False; r.last_seen=now()
        s.rec('H','%.3f'%now(),r.name,*['%s=%s'%kv for kv in sorted(info.items())]); await s.sync()
        await s.send(r,'WELCOME epoch=%d items=%d mid=%s'%(int(s.t_start),len(s.items),s.mid))
        tr=s.tracked_others(r)
        for i in range(0,len(tr),500): await s.send(r,'T '+' '.join(map(str,tr[i:i+500])))
        s.log('run %s connected (%s threads, mode %s, pool %s, space %s, compat %s): %d tracked jobs of its space sent'%(r.name,info.get('threads'),info.get('mode'),info.get('pool'),r.space,r.compat,len(tr)))
    async def h_hold(s,r,a):
        held=set(int(x) for x in a[1:])
        for iid in list(r.leased):
            it=s.items[iid]
            if iid not in held and it.state=='L': s.requeue(it,'lost'); s.log('item %d leased to %s but not held there: re-queued'%(iid,r.name))
            if iid not in held and it.rg=='L' and it.rg_holder==r.name: s.rg_requeue(it,'lost')
        rev=[]
        for iid in held:
            it=s.items.get(iid)
            if it is None: continue
            if it.state=='L' and it.holder==r.name: continue
            if it.rg=='L' and it.rg_holder==r.name: continue   # a regeneration in progress there
            if it.state=='Q' and it.last_holder==r.name: s.lease(it,r); continue
            if it.state in ('L','Q') or (it.state in ('R','C','F') and it.reporter!=r.name): rev.append(iid)   # leased elsewhere, or finished by another run: drop it
        await s.sync()
        if rev: await s.send(r,'REVOKE '+' '.join(map(str,rev))); s.log('revoked from %s: %s'%(r.name,rev[:20]))
    async def h_x(s,r,a):
        c=a[1]; key='%s:%s'%(r.name,c)
        if key in s.keys:
            k=s.keys[key]; await s.send(r,'XA %s %d %d'%(c,k[1],k[2]) if k[0]=='XA' else 'XN %s %s'%(c,k[1])); return
        i=2; ref=[a[i]]
        if a[i]=='j': d=int(a[i+2]); ref+=a[i+1:i+3+d]; i+=3+d
        else: ref.append(a[i+1]); i+=2
        kind=a[i]; d=int(a[i+1]); pre=tuple(int(x) for x in a[i+2:i+2+d]); xkv=kvs(a[i+2+d:])
        unit,created,err=s.resolve_unit(r,ref)
        if unit is not None and (kind!='P' or not s.under(unit,pre)): err='notunder'; unit=None
        if unit is not None and s.overlap(unit,pre,'P'): err='overlap'; unit=None; s.log('X %s refused: prefix at or inside an existing child'%key)
        if unit is None:
            s.rec('N','%.3f'%now(),key,err); s.keys[key]=('N',err); await s.sync(); await s.send(r,'XN %s %s'%(c,err)); s.stats['xn_'+err]+=1; return
        ch=Item(s.new_id(),'P',unit.space,unit.compat,unit.pool,unit.statedir,unit.ix,pre,0,unit.id,r.name,key,now(),unit.rord); ch.dinh=xkv.get('dinh'); ch.win=xkv.get('win')
        s.items[ch.id]=ch; unit.children.append(ch.id); s.idx_add(unit,ch); s.keys[key]=('XA',ch.id,unit.id)
        s.rec('X','%.3f'%ch.t0,ch.id,unit.id,'P',ch.ix,0,r.name,key,len(pre),*pre,*(['dinh='+ch.dinh] if ch.dinh else []),*(['win='+ch.win] if ch.win else [])); s.queue[ch.compat].append(ch.id); s.stats['exports']+=1
        s.adopt(unit,ch,r.name)
        await s.sync(); await s.send(r,'XA %s %d %d'%(c,ch.id,unit.id))
        if created: await s.broadcast_T(unit)
        await s.dispatch()
    def accept_report(s,r,it,key,n,l,p,outf,seg=None,skh=None):
        s._unhold(it); it.state='R'; it.own=(n,l,p); it.reporter=r.name; it.outfile=outf
        if seg is not None: it.seg='%s:%s'%(r.info.get('host','-'),seg)   # prof7R3q: host:file:offset:length:sha256 (or host:ERR)
        s.rec('R','%.3f'%now(),it.id,r.name,key,n,l,p,len(it.children),outf,*(['seg='+it.seg] if it.seg else []),*(['skh=%s/%d'%(skh,len(it.inh or ()))] if skh is not None else [])); s.keys[key]=('RA',); s.repkey[key]=it.id; s.stats['reports']+=1
        if seg=='pending': s.stats['seg_pending']+=1
        if seg=='ERR': s.stats['seg_err']+=1; s.log('item %d reported by %s WITHOUT a certificate segment (assembly error): regeneration %s'%(it.id,r.name,'queued' if s.rg_request(it) else 'not possible'))
        s.check_complete(it)
    def outfile_for(s,r,it):
        return r.info.get('out','-') if (it.kind=='J' and it.creator==r.name) else r.info.get('xqout','-')
    async def h_r(s,r,a):
        c=a[1]; key='%s:%s'%(r.name,c)
        if key in s.keys:
            k=s.keys[key]; await s.send(r,'RA %s'%c if k[0]=='RA' else 'RN %s %s'%(c,k[1])); return
        iid=int(a[2]); n,l,p,nexp=int(a[3]),int(a[4]),int(a[5]),int(a[6]); it=s.items.get(iid); err=None
        if it is not None and it.rg=='L' and it.rg_holder==r.name:   # a regeneration: same counts, same segment bytes, every child met
            kv=kvs(a[7:]); seg=kv.get('seg'); np_=sum(1 for c in it.children if s.items[c].kind=='P'); nq=len(it.children)-np_
            if it.own!=(n,l,p): err='rgcounts_%d_%d_%d_!=_%d_%d_%d'%(n,l,p,*it.own)
            elif nexp!=0: err='rgnexp_%d'%nexp
            elif not seg or seg=='ERR' or len(seg.split(':'))!=4: err='rgnoseg'
            elif not (it.seg.endswith(':pending') or it.seg.endswith(':ERR')) and seg.split(':')[-1]!=it.seg.split(':')[-1]: err='rgsha_%s_!=_%s'%(seg.split(':')[-1][:16],it.seg.split(':')[-1][:16])
            elif int(kv.get('skh',-1))!=np_ or int(kv.get('rsh',-1))!=nq: err='rgskip_%s/%d_%s/%d'%(kv.get('skh'),np_,kv.get('rsh'),nq)
            r.leased.discard(it.id); it.rg=None; it.rg_holder=None
            if err:
                s.rec('GN','%.3f'%now(),it.id,r.name,err); s.keys[key]=('N',err); s.stats['regen_failed']+=1
                s.log('REGENERATION of item %d by %s FAILED: %s'%(it.id,r.name,err)); await s.sync(); await s.send(r,'RN %s %s'%(c,err)); return
            old=it.seg; it.seg='%s:%s'%(r.info.get('host','-'),seg)
            s.rec('GR','%.3f'%now(),it.id,r.name,'seg='+it.seg); s.keys[key]=('RA',); s.stats['regenerated']+=1
            s.log('item %d regenerated by %s: same counts%s (was on %s)'%(it.id,r.name,' (no earlier segment)' if (old.endswith(':pending') or old.endswith(':ERR')) else ' and sha256',old.split(':')[0])); await s.sync(); await s.send(r,'RA %s'%c); return
        if it is None: err='noitem'
        elif not ((it.state=='L' and it.holder==r.name) or (it.state=='Q' and it.last_holder==r.name)): err='notyours(%s)'%it.state
        elif nexp!=s.n_exports_by(it,r.name): err='nexp %d != %d'%(nexp,s.n_exports_by(it,r.name))
        elif 'skh' in kvs(a[7:]) and it.inh_for==r.name and int(kvs(a[7:])['skh'])!=len(it.inh or ()): err='skipmiss %s != %d'%(kvs(a[7:])['skh'],len(it.inh or ()))
        if err:
            s.rec('N','%.3f'%now(),key,err.replace(' ','_')); s.keys[key]=('N',err.replace(' ','_'))
            if it is not None and err.startswith('nexp') and it.state=='L': s.requeue(it,'nexp')
            if it is not None and err.startswith('skipmiss') and it.state in ('L','Q'):   # its count includes subtrees of other items: never accept it
                s._unhold(it); it.state='F'; s.rec('F','%.3f'%now(),it.id,'skipmiss'); s.stats['skipmiss']+=1
            await s.sync(); await s.send(r,'RN %s %s'%(c,err.replace(' ','_'))); s.log('report %s on item %s rejected: %s'%(key,iid,err)); return
        s.accept_report(r,it,key,n,l,p,s.outfile_for(r,it),kvs(a[7:]).get('seg'),kvs(a[7:]).get('skh')); await s.sync(); await s.send(r,'RA %s'%c)
    def n_exports_by(s,it,run):
        return sum(1 for c in it.children if s.items[c].creator==run and s.keys.get(s.items[c].key,('',))[0]=='XA' and '#' not in s.items[c].key)
    async def h_sp(s,r,a,submit=False):
        c=a[1]; key='%s:%s'%(r.name,c)
        if key in s.keys:
            k=s.keys[key]; await s.send(r,'SPA %s'%c if k[0]=='RA' else 'SPN %s %s'%(c,k[1])); return
        i=2; ref=[a[i]]
        if a[i]=='j': d=int(a[i+2]); ref+=a[i+1:i+3+d]; i+=3+d
        else: ref.append(a[i+1]); i+=2
        n,l,p,nexp=int(a[i]),int(a[i+1]),int(a[i+2]),int(a[i+3]); i+=4
        spkv={}
        while i<len(a) and a[i]!='|' and '=' in a[i]:
            k_,v_=a[i].split('=',1); spkv[k_]=v_; i+=1
        spseg=spkv.get('seg')
        kids=[]; err=None; rest=a[i:]; j=0
        while j<len(rest):
            if rest[j]!='|': err='syntax'; break
            j+=1; t=rest[j]; kk=None
            if t=='K': kk=rest[j+1]; j+=2; t=rest[j]
            d=int(rest[j+1]); pre=tuple(int(x) for x in rest[j+2:j+2+d]); j+=2+d; rs=0
            if t=='Q': rs=int(rest[j]); j+=1
            elif t!='P': err='kind'; break
            kkv={}
            while j<len(rest) and rest[j]!='|' and '=' in rest[j]: k_,v_=rest[j].split('=',1); kkv[k_]=v_; j+=1
            kids.append((t,pre,rs,kk,kkv))
        unit,created,uerr=(None,False,err) if err else s.resolve_unit(r,ref)
        if unit is not None:
            L=lab_order(unit.rord)
            for (t,pre,rs,kk,kkv) in kids:
                if t=='Q' and pre==unit.prefix:   # the rest of the unit's own root node
                    if unit.kind=='Q' and (rs not in L or L[rs]<L[unit.rs]): uerr='notunder'; break
                    if rs not in L: uerr='notunder'; break
                elif not s.under(unit,pre): uerr='notunder'; break
            if uerr is None:
                for (t,pre,rs,kk,kkv) in kids:
                    if (kk is None or kk not in s.keys) and s.overlap(unit,pre,t): uerr='overlap'; break
            if uerr is None:   # the exports the server took from this run = the ones the run saw accepted + its unresolved ones the server has
                have=s.n_exports_by(unit,r.name); kn=sum(1 for k in kids if k[3] is not None and k[3] in s.keys and s.keys[k[3]][0]=='XA')
                if have!=nexp+kn: uerr='nexp_%d_!=_%d+%d'%(have,nexp,kn)
            if uerr is None and 'skh' in spkv and unit.inh_for==r.name:   # skip-list entries met = the ones the new items do not take over
                exp=set(unit.inh or ())
                for (t,pre,rs,kk,kkv) in kids:
                    if kk is not None and kk in s.keys: continue
                    tmp=Item(0,t,unit.space,unit.compat,unit.pool,unit.statedir,unit.ix,pre,rs,unit.id,r.name,'-',0.0,unit.rord)
                    exp={c for c in exp if not s.under(tmp,s.items[c].prefix)}
                if int(spkv['skh'])!=len(exp): uerr='skipmiss_%s_!=_%d'%(spkv['skh'],len(exp)); s.stats['skipmiss']+=1
            if uerr: unit=None
        if unit is None:
            s.rec('N','%.3f'%now(),key,uerr); s.keys[key]=('N',uerr); await s.sync(); await s.send(r,'SPN %s %s'%(c,uerr)); s.log('spill %s refused: %s'%(key,uerr)); return
        nk=0
        for idx,(t,pre,rs,kk,kkv) in enumerate(kids):
            if kk is not None and kk in s.keys: continue   # an export the server already took
            ck=kk if kk is not None else '%s#%d'%(key,idx)
            ch=Item(s.new_id(),t,unit.space,unit.compat,unit.pool,unit.statedir,unit.ix,pre,rs,unit.id,r.name,ck,now(),unit.rord); ch.dinh=kkv.get('dinh'); ch.win=kkv.get('win'); ch.rp=int(kkv.get('p',0))
            s.items[ch.id]=ch; unit.children.append(ch.id); s.idx_add(unit,ch); s.keys[ck]=('XA',ch.id,unit.id)
            s.rec('X','%.3f'%ch.t0,ch.id,unit.id,t,ch.ix,rs,r.name,ck,len(pre),*pre,*(['dinh='+ch.dinh] if ch.dinh else []),*(['win='+ch.win] if ch.win else []),*(['p=%d'%ch.rp] if ch.rp else [])); s.queue[ch.compat].append(ch.id); nk+=1
            s.adopt(unit,ch,r.name)
        s.accept_report(r,unit,key,n,l,p,s.outfile_for(r,unit),spseg,spkv.get('skh')); s.stats['spills']+=1
        await s.sync(); await s.send(r,'SPA %s'%c)
        s.log('spill %s: unit %d (%s %s %d) own %d %d %d, %d new items'%(key,unit.id,unit.kind,unit.pool,unit.ix,n,l,p,nk))
        if created: await s.broadcast_T(unit)
        await s.dispatch()
    async def h_sg(s,r,a):
        """SG RUN:C seg=FILE:OFF:LEN:SHA: the segment of the item whose report RUN:C said seg=pending (fast spill: the counts went first);
        accepted from a run on the same host as the report (the reporting run itself, or a later launch recovering it)"""
        key=a[1]; ref=kvs(a[2:]).get('seg'); iid=s.repkey.get(key); it=s.items.get(iid) if iid else None; err=None
        if it is None: err='noreport'
        elif not ref or len(ref.split(':'))!=4: err='badseg'
        elif not it.seg or not (it.seg.endswith(':pending') or it.seg.endswith(':ERR')):
            err='notpending' if (it.seg or '').split(':')[-1]!=ref.split(':')[-1] else None   # a repeat of an accepted SG is fine
            if err is None: await s.send(r,'SGA %s'%key); return
        elif it.seg.split(':')[0]!=r.info.get('host','-'): err='otherhost'
        if err: await s.send(r,'SGN %s %s'%(key,err)); s.log('segment for %s refused: %s'%(key,err)); return
        it.seg='%s:%s'%(r.info.get('host','-'),ref); s.rec('GS','%.3f'%now(),it.id,r.name,'seg='+it.seg); s.stats['seg_late']+=1
        await s.sync(); await s.send(r,'SGA %s'%key)
    async def h_sgl(s,r,a):
        """SGL RUN:C REASON: the host of a report made with seg=pending cannot produce its segment (its recovery could not assemble it):
        the item is re-run elsewhere for the segment (regeneration: same counts; any segment sha256, as none was ever recorded)"""
        key=a[1]; why=a[2] if len(a)>2 else '-'; iid=s.repkey.get(key); it=s.items.get(iid) if iid else None
        if it is None: await s.send(r,'SGN %s noreport'%key); return
        if not it.seg or not (it.seg.endswith(':pending') or it.seg.endswith(':ERR')): await s.send(r,'SGA %s'%key); return   # its segment arrived after all
        if it.seg.split(':')[0]!=r.info.get('host','-'): await s.send(r,'SGN %s otherhost'%key); return
        q=s.rg_request(it); s.log('segment of item %d (report %s) lost on %s: %s; %s'%(it.id,key,r.info.get('host','-'),why,'regeneration queued' if q else 'regeneration already under way'))
        s.stats['seg_lost']+=1; await s.sync(); await s.send(r,'SGA %s'%key); await s.dispatch()
    async def h_ul(s,r,a):
        for x in a[1:]:
            it=s.items.get(int(x))
            if it is not None and it.state=='L' and it.holder==r.name: s.requeue(it,'returned')
            if it is not None and it.rg=='L' and it.rg_holder==r.name: s.rg_requeue(it,'returned')
        await s.sync(); await s.dispatch()
    async def h_e(s,r,a):
        it=s.items.get(int(a[1]))
        if it is not None and it.state=='L' and it.holder==r.name:
            s._unhold(it); it.state='F'; s.rec('F','%.3f'%now(),it.id,(a[2] if len(a)>2 else 'error')); await s.sync()
            s.log('item %d FAILED on %s: %s'%(it.id,r.name,' '.join(a[2:])))

    # ---------------- scheduling ----------------
    def lease_room(s,r):   # run 1 (15:36): a helper that stopped importing (paused by its checkd) kept sending W and was sent 27k items in 2 s,
        # which no other run could then take; a run is never leased more than 2 x its threads + 64 items at once
        try: t=int(r.info.get('threads') or 0)
        except (TypeError,ValueError): t=0
        return (2*t+64 if t>0 else 1<<30)-len(r.leased)
    async def dispatch(s):
        sent=collections.defaultdict(list)
        for comp,q in s.queue.items():
            want=[r for r in s.runs.values() if r.writer and r.ready and r.alive and r.compat==comp and r.want>0 and s.lease_room(r)>0]
            while q and want:
                for r in list(want):
                    if not q: break
                    while q and not s.dispatchable(s.items[q[0]]): q.popleft()
                    if not q: break
                    it=s.items[q.popleft()]
                    if it.rg=='Q': s.rg_lease(it,r)
                    else: s.lease(it,r)
                    r.want-=1; sent[r.name].append(it)
                    if r.want<=0 or s.lease_room(r)<=0: want.remove(r)
                while q and not s.dispatchable(s.items[q[0]]): q.popleft()
        if sent:
            await s.sync()
            for name,its in sent.items():
                r=s.runs[name]
                for it in its: await s.send(r,s.item_line(it))
                s.stats['leases']+=len(its)
        await s.give()
    def queued(s,comp):   # O(1): len of the deque (stale entries, e.g. items re-leased by HOLD, are popped lazily by dispatch)
        return len(s.queue.get(comp,()))
    async def give(s):
        t=now()
        bycomp=collections.defaultdict(int)
        for r in s.runs.values():
            if r.writer and r.ready and r.alive and r.want>0: bycomp[r.compat]+=r.want
        for comp,w in bycomp.items():
            unmet=w-s.queued(comp)
            if unmet<=0: continue
            prod=sorted((r for r in s.runs.values() if r.writer and r.ready and r.alive and r.compat==comp and r.qlen>0 and t-r.give_t>=2.0),key=lambda r:-r.qlen)
            for r in prod:
                if unmet<=0: break
                k=min(unmet,r.qlen); r.give_t=t; await s.send(r,'GIVE %d'%k); unmet-=k; s.stats['gives']+=1

    async def h_line(s,r,a):
        t=a[0]; r.last_seen=now()
        if t=='B':
            r.qlen,r.idle=int(a[1]),int(a[2]); r.free=int(a[4]) if len(a)>4 else 0; await s.give(); return
        if t=='W': r.want=max(0,int(a[1])); await s.dispatch(); return
        if t=='X': await s.h_x(r,a); return
        if t=='R': await s.h_r(r,a); return
        if t=='SP': await s.h_sp(r,a); return
        if t=='SG': await s.h_sg(r,a); return
        if t=='SGL': await s.h_sgl(r,a); return
        if t=='UL': await s.h_ul(r,a); return
        if t=='E': await s.h_e(r,a); return
        if t=='HOLD': await s.h_hold(r,a); return
        if t=='READY': r.ready=True; await s.dispatch(); return
        if t=='GD': return
        if t=='PONG': return
        if t=='BYE':
            r.bye=True; r.ready=False; r.want=0
            for iid in list(r.leased):
                it=s.items[iid]
                if it.state=='L': s.requeue(it,'bye'); s.log('run %s said BYE holding item %d: re-queued'%(r.name,iid))
                if it.rg=='L' and it.rg_holder==r.name: s.rg_requeue(it,'bye')
            await s.sync(); await s.dispatch(); return
        await s.send(r,'ERR unknown %s'%t)

    # ---------------- admin ----------------
    def status(s):
        if now()-getattr(s,'_cnt_t',0)>=60 or len(s.items)<200000:   # full counts are O(N): at most once a minute on big manifests
            s._cnt=(collections.Counter(it.state for it in s.items.values()),collections.Counter(it.kind for it in s.items.values()),
                    collections.Counter(s.items[j].state for j in s.jobs.values())); s._cnt_t=now()
        st,kinds,jobs=s._cnt
        runs=[]
        for r in s.runs.values():
            if not r.alive: continue
            runs.append({'name':r.name,'connected':r.writer is not None,'ready':r.ready,'want':r.want,'qlen':r.qlen,'idle':r.idle,'leased':len(r.leased),
                         'age':round(now()-r.last_seen,1),'mode':r.info.get('mode'),'threads':r.info.get('threads'),'pool':r.info.get('pool')})
        return {'t':now(),'items':dict(st),'kinds':dict(kinds),'jobs':dict(jobs),'queued':{c:s.queued(c) for c in s.queue},'runs':runs,'stats':dict(s.stats),
                'claims':{p:len(v) for p,v in s.claims.items()}}
    async def admin(s,reader,writer):
        async def out(x): writer.write((x+'\n').encode()); await writer.drain()
        while True:
            line=await reader.readline()
            if not line or not line.endswith(b'\n'): break   # an admin command cut by a connection loss is not run
            a=line.decode(errors='replace').split()
            if not a: continue
            c=a[0]
            try:
                if c=='STATUS': await out(json.dumps(s.status()))
                elif c=='CLAIM':
                    pool=a[1]; got=[]; tr=[]
                    spaces=set(it.space for it in (s.items[j] for j in s.jobs.values()) if it.pool==pool)
                    for x in a[2:]:
                        x=int(x)
                        if any((sp,x) in s.jobs for sp in spaces): tr.append(x); continue
                        if x not in s.claims[pool]: s.claims[pool].add(x); s.rec('A','%.3f'%now(),pool,x)
                        got.append(x)
                    await s.sync(); await out('CLAIMED '+' '.join(map(str,got))); await out('TRACKED '+' '.join(map(str,tr)))
                    s.log('CLAIM %s: granted %d, refused (tracked) %d'%(pool,len(got),len(tr)))
                elif c=='ADDJOBS':   # ADDJOBS pool=P space=S compat=HEX|auto statedir=D frontier=F rord=R jobs=FILE: list jobs as queued job roots (no producer)
                    kv=dict(x.split('=',1) for x in a[1:] if '=' in x); need=('pool','space','compat','statedir','frontier','jobs')
                    if any(k not in kv for k in need): await out('ERR need '+' '.join(k+'=' for k in need)); continue
                    comp=kv['compat']
                    if comp=='auto':   # the compat of the connected runs, if they agree
                        cs={r.compat for r in s.runs.values() if r.writer is not None and r.compat}
                        if len(cs)!=1: await out('ERR compat=auto needs connected runs of one compat (have %s)'%sorted(cs)); continue
                        comp=cs.pop()
                    order=[]; seen=set()
                    for l in open(kv['jobs']):
                        b=l.split()
                        if b and b[0].lstrip('-').isdigit() and int(b[0]) not in seen: seen.add(int(b[0])); order.append(int(b[0]))
                    pres={}
                    for l in open(kv['frontier']):
                        b=l.split()
                        if b and int(b[0]) in seen: pres[int(b[0])]=tuple(int(x) for x in b[1:])
                    miss=[ix for ix in order if ix not in pres]
                    if miss: await out('ERR %d jobs not in %s (first %s)'%(len(miss),kv['frontier'],miss[:5])); continue
                    rord=int(kv.get('rord','123')); na=nk=0
                    for ix in order:
                        if (kv['space'],ix) in s.jobs: nk+=1; continue
                        it=Item(s.new_id(),'J',kv['space'],comp,kv['pool'],kv['statedir'],ix,pres[ix],0,0,'-','-',now(),rord)
                        s.items[it.id]=it; s.jobs[(kv['space'],ix)]=it.id; s.queue[comp].append(it.id); na+=1
                        s.rec('J','%.3f'%it.t0,it.id,it.space,it.compat,it.pool,it.statedir,ix,'-',rord,len(it.prefix),*it.prefix)
                    s.pub_dirty=True; s.stats['jobs']+=na; await s.sync(); await s.dispatch(); await out('OK %d job roots queued (compat %s), %d already known'%(na,comp,nk))
                elif c=='ADDTOP':   # ADDTOP pool=P space=S statedir=D listing=FILE dump=DUMP [rord=R]: the top segments of a --pctop run (r3qglue --mktop listing)
                    kv=dict(x.split('=',1) for x in a[1:] if '=' in x); need=('pool','space','statedir','listing','dump')
                    if any(k not in kv for k in need): await out('ERR need '+' '.join(k+'=' for k in need)); continue
                    import hashlib
                    dsha=hashlib.sha256(open(kv['dump'],'rb').read()).hexdigest()[:16]; rord=int(kv.get('rord','123')); na=nk=0
                    for l in open(kv['listing']):
                        b=l.split()
                        if len(b)<3 or b[0]!='T': continue
                        i_=int(b[1]); d=int(b[2]); pre=tuple(int(x) for x in b[3:3+d]); lk=kvs(b[3+d:])
                        if (kv['space'],pre) in s.tops: nk+=1; continue
                        fc=lk.get('dump','0:0'); dref='%s:%s:%s'%(kv['dump'],dsha,fc)
                        it=Item(s.new_id(),'T',kv['space'],'-',kv['pool'],kv['statedir'],i_,pre,0,0,'-','-',now(),rord); it.state='C'; it.seg=lk.get('seg'); it.dump=dref
                        it.own=(int(lk.get('nodes',0)),0,0); it.total=it.own; s.items[it.id]=it; s.tops[(kv['space'],pre)]=it.id; na+=1
                        s.rec('T','%.3f'%it.t0,it.id,it.space,it.pool,it.statedir,i_,rord,len(pre),*pre,'seg='+it.seg,'dump='+dref,'nodes=%d'%it.own[0])
                    await s.sync(); await out('OK %d top segments recorded, %d already known (dump sha256 %s)'%(na,nk,dsha))
                elif c=='REGEN':   # REGEN <item id>... | host=<host> [all]: re-run reported items for their segment (lost host); unchecked only unless "all"
                    sel=[]
                    if a[1:] and a[1].startswith('host='):
                        h=a[1][5:]; sel=[it for it in s.items.values() if it.seg and it.seg.split(':')[0]==h and ('all' in a[2:] or not (it.chk and it.chk[1]=='OK'))]
                    else: sel=[s.items[int(x)] for x in a[1:] if int(x) in s.items]
                    n_=sum(1 for it in sel if s.rg_request(it)); await s.sync(); await s.dispatch(); await out('OK %d of %d items queued for regeneration'%(n_,len(sel)))
                elif c=='CHECK':   # CHECK <item id> <sha256> <OK|FAIL|PARTIAL> <ndecl> <thmhash> [conf=C] [chunk=NAME] [olean=URL] [keys=URL]: the Lean check of an item segment
                    it=s.items.get(int(a[1]))
                    if it is None or not it.seg or it.seg.split(':')[-1]!=a[2]: await out('ERR no item %s with that segment hash'%a[1]); continue
                    ckv=kvs(a[6:]); cf=ckv.get('conf','-'); it.chk=tuple(a[2:6])+(cf,)
                    s.rec('W','%.3f'%now(),it.id,*a[2:6],'conf='+cf,*['%s=%s'%(k,ckv[k]) for k in ('chunk','olean','keys','kept','keptref') if k in ckv]); await s.sync(); await out('OK'); s.stats['checks_'+a[3]]+=1   # keys: the checker's key sidecar of the chunk; kept / keptref: a retained segment (FAIL or sample) and its uploaded copy
                elif c=='VOIDCHK':   # VOIDCHK host=<host> | <item id>...: void the checks of the items whose segment is on host (or the listed items): their
                    # check results (chunk olean, keys) were lost with that host's local store; with REGEN host=<host> they are made and checked again
                    if a[1:] and a[1].startswith('host='):
                        h=a[1][5:]; sel=[it for it in s.items.values() if it.chk is not None and it.seg and it.seg.split(':')[0]==h]
                    else: sel=[s.items[int(x)] for x in a[1:] if int(x) in s.items and s.items[int(x)].chk is not None]
                    for it in sel: it.chk=None; s.rec('WV','%.3f'%now(),it.id,'void')
                    await s.sync(); await out('OK %d checks voided'%len(sel))
                elif c=='UNCLAIM':
                    pool=a[1]
                    for x in a[2:]:
                        x=int(x)
                        if x in s.claims[pool]: s.claims[pool].discard(x); s.rec('U','%.3f'%now(),pool,x)
                    await s.sync(); await out('OK')
                elif c in ('SPILLRUN','EXITRUN'):
                    pat=a[1] if len(a)>1 else '*'; n=0
                    for r in s.runs.values():
                        if r.writer and (pat=='*' or r.name==pat or r.name.startswith(pat)): await s.send(r,'SPILL' if c=='SPILLRUN' else 'EXIT'); n+=1
                    await out('OK %d'%n)
                elif c=='ITEMS':
                    want=a[1] if len(a)>1 else None
                    for it in s.items.values():
                        if want and it.state!=want: continue
                        await out('%d %s %s %s %d par=%d st=%s holder=%s own=%s total=%s d=%d nchild=%d'%(it.id,it.kind,it.pool,it.space,it.ix,it.parent,it.state,it.holder,it.own,it.total,len(it.prefix),len(it.children)))
                    await out('END')
                elif c=='SEGS':   # SEGS [host=H] [unchecked] [conf=C]: item segments (prof7R3q) for the per-host Lean checks: "id kind pool ix file off len sha256 chk";
                    # unchecked = no OK check (with conf=C: no OK check under that check configuration)
                    h=next((x[5:] for x in a[1:] if x.startswith('host=')),None); unc='unchecked' in a[1:]; cf=next((x[5:] for x in a[1:] if x.startswith('conf=')),None)
                    for it in ([s.items[i] for i in sorted(Item.SEGIDX.get(h,()))] if h is not None else list(s.items.values())):
                        if not it.seg or it.seg.endswith(':ERR'): continue
                        f=it.seg.split(':')
                        okc=it.chk is not None and it.chk[1]=='OK' and (cf is None or (len(it.chk)>4 and it.chk[4]==cf))
                        if len(f)!=5 or (h is not None and f[0]!=h) or (unc and okc): continue
                        await out('%d %s %s %d %s %s %s %s %s'%(it.id,it.kind,it.pool,it.ix,f[1],f[2],f[3],f[4],':'.join(it.chk[1:]) if it.chk else '-'))
                    await out('END')
                elif c=='SUBMIT':   # SUBMIT <run name> [key=value...]: the following lines (until END) are a dead run's reports / spills / exports
                    name=a[1]; r=s.runs.get(name)
                    if r is None:   # a run that never reached the server (spilled while it was down): register it from the spill file header
                        hdr=dict(kv.split('=',1) for kv in a[2:] if '=' in kv)
                        if not {'space','compat','pool','statedir'}<=set(hdr): await out('ERR unknown run %s (no header fields)'%name); continue
                        r=Run(name); r.info=hdr; r.alive=False; r.bye=True; s.runs[name]=r
                        s.rec('H','%.3f'%now(),name,*['%s=%s'%kv for kv in sorted(hdr.items())]); await s.sync(); s.log('SUBMIT: run %s registered from its spill file header'%name)
                    w0=r.writer; res=[]
                    class Cap:
                        def write(self_,b): res.append(b.decode().strip())
                    r.writer=Cap()
                    while True:
                        l2=(await reader.readline()).decode().split()
                        if not l2 or l2[0]=='END': break
                        if l2[0] in ('R','SP','X'):
                            try: await s.h_line(r,l2)
                            except Exception as e: res.append('ERR %r'%e)
                    r.writer=w0; await out('RESULTS '+json.dumps(res))
                else: await out('ERR unknown admin command %s'%c)
            except Exception as e:
                import traceback; s.log('admin error %r %s'%(e,traceback.format_exc()[-500:])); await out('ERR %r'%e)
        writer.close()

    # ---------------- connections ----------------
    async def conn(s,reader,writer):
        peer=writer.get_extra_info('peername'); r=None
        try:
            first=await reader.readline()
            if not first: return
            a=first.decode(errors='replace').split()
            if a and a[0]=='ADMIN': await s.admin(reader,writer); return
            if not a or a[0]!='HELLO': writer.write(b'ERR expected HELLO\n'); return
            name=dict(kv.split('=',1) for kv in a[2:] if '=' in kv).get('name')
            if not name: writer.write(b'ERR no name\n'); return
            r=s.runs.get(name)
            if r is None: r=Run(name); s.runs[name]=r
            if r.writer is not None and r.writer is not writer:
                try: r.writer.close()
                except Exception: pass
            r.writer=writer; await s.h_hello(r,a)
            while True:
                line=await reader.readline()
                if not line: break
                if not line.endswith(b'\n'):   # run 1: a line cut by a connection loss was taken as a whole message (SP children and
                    s.log('run %s: partial last line dropped (%d bytes): %r'%(r.name,len(line),line[:120])); break   # report fields lost)
                a=line.decode(errors='replace').split()
                if a:
                    try: await s.h_line(r,a)
                    except Exception as e:
                        import traceback; s.log('error on %s line %r: %r %s'%(r.name,line[:200],e,traceback.format_exc()[-800:].replace('\n',' | ')))
                try: await writer.drain()
                except Exception: break
        except (ConnectionError,asyncio.IncompleteReadError): pass
        finally:
            if r is not None and r.writer is writer:
                r.writer=None; r.ready=False; r.want=0; s.log('run %s disconnected%s'%(r.name,' (bye)' if r.bye else ''))
                if r.bye: r.alive=False
            try: writer.close()
            except Exception: pass

    async def ticker(s):
        last_pub=0; last_stat=0
        while True:
            await asyncio.sleep(2)
            t=now(); changed=False
            for r in s.runs.values():
                if r.alive and not r.bye and t-r.last_seen>s.lease_t:
                    r.alive=False; r.want=0; r.ready=False
                    if r.writer is not None:
                        try: r.writer.close()
                        except Exception: pass
                        r.writer=None
                    lost=[iid for iid in list(r.leased) if s.items[iid].state=='L']
                    for iid in lost: s.requeue(s.items[iid],'lease')
                    for iid in list(r.leased):
                        if s.items[iid].rg=='L' and s.items[iid].rg_holder==r.name: s.rg_requeue(s.items[iid],'lease'); lost.append(iid)
                    s.log('run %s silent for %.0fs: lost; %d items re-queued %s'%(r.name,t-r.last_seen,len(lost),lost[:12])); changed=True
            if changed: await s.sync(); await s.dispatch()
            if s.pub_dirty and t-last_pub>=(5 if len(s.jobs)<100000 else 60): s.publish(); last_pub=t   # O(jobs)
            if t-last_stat>=10:
                last_stat=t; tmp=os.path.join(s.base,'status.json.tmp'); json.dump(s.status(),open(tmp,'w')); os.replace(tmp,os.path.join(s.base,'status.json'))
            await s.dispatch()
    def publish(s):
        s.pub_dirty=False; tr=collections.defaultdict(set); mv=collections.defaultdict(set)
        for (space,ix),jid in s.jobs.items():
            it=s.items[jid]; mv[it.pool].add(ix)
            if it.state!='C': tr[it.pool].add(ix)
        for pool in set(mv)|set(tr):
            for nm,st in (('tracked_%s.txt'%pool,tr[pool]),('moved_from_%s.txt'%pool,mv[pool])):
                p=os.path.join(s.base,nm); tmp=p+'.tmp'; open(tmp,'w').write(''.join('%d\n'%x for x in sorted(st))); os.replace(tmp,p)

async def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--base',required=True); ap.add_argument('--port',type=int,default=7919); ap.add_argument('--lease',type=float,default=120.0)
    ap.add_argument('--host',default='0.0.0.0')
    o=ap.parse_args()
    x=XQ(o.base,o.lease); x.ev=asyncio.Event()
    asyncio.get_running_loop().create_task(x.flusher())
    srv=await asyncio.start_server(x.conn,o.host,o.port,limit=1<<26)
    open(os.path.join(o.base,'xqd.pid'),'w').write('%d %d\n'%(os.getpid(),o.port))
    x.log('xqd listening on %s:%d (lease %.0fs), base %s'%(o.host,o.port,o.lease,o.base))
    asyncio.get_running_loop().create_task(x.ticker())
    async with srv: await srv.serve_forever()

if __name__=='__main__':
    asyncio.run(main())
