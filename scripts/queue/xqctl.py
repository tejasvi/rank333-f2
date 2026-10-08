#!/usr/bin/env python3
"""xqctl.py [--addr HOST:PORT] CMD ...: admin client of the prof7L92 work queue (ops/xqd.py; default 127.0.0.1:7919, env XQ_ADDR).
  status                 the server's summary (items by state, jobs, queued per compat group, runs, counters, claims)
  claim POOL X...        mark pool jobs as autosplit's (refused for those the queue already tracks): prints CLAIMED / TRACKED lines
  unclaim POOL X...      undo a claim (a failed autosplit generation)
  spill RUN|PREFIX|*     ask runs to spill (write out every unfinished unit and exit)
  exit RUN|PREFIX|*      ask helper / lingering runs to stop importing and exit when idle
  items [STATE]          list items (Q L R C F)
  submit FILE            send a spill file (or a .xqpend file) of a run that could not reach the server; the server dedups
  addjobs pool=P space=S compat=HEX|auto statedir=D frontier=F jobs=FILE [rord=R]  queue list jobs as job roots for any run (no
                         producer); compat=auto takes the connected runs' compat; the state lines go to D/gather/xq/state_P_xq.txt
  addtop pool=P space=S statedir=D listing=FILE dump=DUMP [rord=R]  the top segments of a --pctop run (listing of r3qglue --mktop): one
                         manifest record each, complete, with its JOB range in DUMP (for xqaudit's coverage check and the glue)
  regen ITEM...|host=H [all]  prof7R3q: re-run reported items for their certificate segment (a lost host's unchecked segments with host=);
                         the re-run must give the same counts and the same segment sha256, then the manifest names the new copy
  check ITEM SHA256 OK|FAIL|PARTIAL NDECL THMHASH [conf=C]  prof7R3q: record the Lean check of an item segment (refused unless SHA256 is
                         its segment's); C names the check configuration (checkd.py: first 16 hex of CHECK.conf's sha256)
  segs [host=H] [unchecked] [conf=C]  prof7R3q: item segments, "id kind pool ix file offset length sha256 check" (input of the per-host checks)"""
import os, sys, socket, json

def connect(addr,timeout=15):
    h,p=addr.rsplit(':',1); s=socket.create_connection((h,int(p)),timeout=timeout); s.sendall(b'ADMIN\n'); return s, s.makefile('r')

def cmd(addr,line,nreply=1,timeout=15):
    s,f=connect(addr,timeout); s.sendall((line+'\n').encode()); out=[f.readline().rstrip('\n') for _ in range(nreply)]; s.close(); return out

def claim(pool,jobs,addr=None,timeout=10):
    """-> (granted set, tracked set); raises OSError when the server is unreachable"""
    addr=addr or os.environ.get('XQ_ADDR','127.0.0.1:7919')
    if not jobs: return set(),set()
    out=cmd(addr,'CLAIM %s %s'%(pool,' '.join(str(int(x)) for x in jobs)),2,timeout)
    g=set(int(x) for x in out[0].split()[1:]) if out[0].startswith('CLAIMED') else set()
    t=set(int(x) for x in out[1].split()[1:]) if out[1].startswith('TRACKED') else set()
    return g,t

def submit(addr,path):
    lines=open(path).read().splitlines(); hdr=[l for l in lines if l.startswith('# prof7L92')]
    if not hdr: sys.exit('no prof7L92 header in %s'%path)
    kv=dict(t.split('=',1) for t in hdr[0].split() if '=' in t); run=kv['run']
    meta=' '.join('%s=%s'%(k2,kv[k2]) for k2 in ('pool','statedir','frontier','out','xqout') if k2 in kv)+' space=%s compat=%s rord=%s'%(kv.get('fp','-'),kv.get('compat','-'),kv.get('rord','123'))
    body=[l for l in lines if l.split()[:1] and l.split()[0] in ('SP','R','X')]
    s,f=connect(addr,60); s.sendall(('SUBMIT %s %s\n'%(run,meta)).encode()+''.join(l+'\n' for l in body).encode()+b'END\n')
    res=f.readline().strip(); s.close(); print(res)
    with open(path,'a') as fo: fo.write('# submitted %d lines: %s\n'%(len(body),res[:2000]))

if __name__=='__main__':
    a=sys.argv[1:]; addr=os.environ.get('XQ_ADDR','127.0.0.1:7919')
    if a[:1]==['--addr']: addr=a[1]; a=a[2:]
    if not a: sys.exit(__doc__)
    c=a[0]
    if c=='status': print(json.dumps(json.loads(cmd(addr,'STATUS')[0]),indent=1))
    elif c=='claim': g,t=claim(a[1],a[2:],addr); print('CLAIMED',*sorted(g)); print('TRACKED',*sorted(t))
    elif c=='unclaim': print(cmd(addr,'UNCLAIM %s %s'%(a[1],' '.join(a[2:])))[0])
    elif c=='spill': print(cmd(addr,'SPILLRUN %s'%(a[1] if len(a)>1 else '*'))[0])
    elif c=='exit': print(cmd(addr,'EXITRUN %s'%(a[1] if len(a)>1 else '*'))[0])
    elif c=='items':
        s,f=connect(addr); s.sendall(('ITEMS %s\n'%(a[1] if len(a)>1 else '')).encode())
        for l in f:
            if l.strip()=='END': break
            print(l.rstrip())
    elif c=='submit': submit(addr,a[1])
    elif c=='regen': print(cmd(addr,'REGEN %s'%' '.join(a[1:]))[0])
    elif c=='voidchk': print(cmd(addr,'VOIDCHK %s'%' '.join(a[1:]))[0])   # voidchk host=H | ID...: checks whose chunks were lost (then regen host=H)
    elif c=='addjobs': print(cmd(addr,'ADDJOBS %s'%' '.join(a[1:]),timeout=300)[0])
    elif c=='addtop': print(cmd(addr,'ADDTOP %s'%' '.join(a[1:]),timeout=300)[0])
    elif c=='segs':
        s,f=connect(addr); s.sendall(('SEGS %s\n'%' '.join(a[1:])).encode())
        for l in f:
            if l.strip()=='END': break
            print(l.rstrip())
    elif c=='check': print(cmd(addr,'CHECK %s'%' '.join(a[1:]))[0])
    else: sys.exit(__doc__)
