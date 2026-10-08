#!/usr/bin/env python3
# pbuild.py LIST SRC OUT P [EXTRA_LEAN_PATH]: compile the (ported) modules of LIST from SRC into OUT, P at a time, local-import order;
# LEAN_PATH = OUT:EXTRA:sound5 lpath.  Absolute nice 10.  `-R SRC` so module names are the LIST names.  Logs OUT/../log/<M>.txt.
import os,re,subprocess,sys,time
from concurrent.futures import ThreadPoolExecutor, FIRST_COMPLETED, wait
R='r22/lean'
LEAN='$LEAN_TOOLCHAIN/bin/lean'
LP=open(R+'/sound5/lpath.txt').read().strip()
L,SRC,OUT,P=sys.argv[1],sys.argv[2],sys.argv[3],int(sys.argv[4])
EXTRA=sys.argv[5] if len(sys.argv)>5 else ''
env=dict(os.environ, LEAN_PATH=OUT+':'+(EXTRA+':' if EXTRA else '')+LP)
NI=max(0,10-os.nice(0)); LOG=os.path.join(os.path.dirname(OUT.rstrip('/')),'log'); os.makedirs(LOG,exist_ok=True)
mods=[l.split()[0] for l in open(L)]; local=set(mods)
srcf=lambda m: os.path.join(SRC,*m.split('.'))+'.lean'
olean=lambda m: os.path.join(OUT,*m.split('.'))+'.olean'
deps={m:[i for i in re.findall(r'^(?:public\s+)?(?:meta\s+)?import\s+(?:all\s+)?(\S+)',open(srcf(m)).read(),re.M) if i in local] for m in mods}
def comp(m):
    o=olean(m); os.makedirs(os.path.dirname(o),exist_ok=True); t0=time.time()
    with open(os.path.join(LOG,m+'.txt'),'w') as lf:
        rc=subprocess.call(['nice','-n',str(NI),'/usr/bin/time','-f','%e s %M KB',LEAN,'-R',SRC,'-o',o,'-i',o[:-6]+'.ilean',srcf(m)],stdout=lf,stderr=subprocess.STDOUT,env=env)
    return m,rc,time.time()-t0
done=set(); failed=set(); running={}
with ThreadPoolExecutor(P) as ex:
    while True:
        for m in mods:
            if m in done or m in failed or m in running: continue
            if any(d in failed for d in deps[m]): failed.add(m); print('SKIP',m,flush=True); continue
            if all(d in done for d in deps[m]) and len(running)<P: running[m]=ex.submit(comp,m)
        if not running: break
        fin,_=wait(list(running.values()),return_when=FIRST_COMPLETED)
        for f in fin:
            m,rc,dt=f.result(); del running[m]
            if rc==0: done.add(m); print(f'OK   {m} {dt:.1f}s',flush=True)
            else: failed.add(m); print(f'FAIL {m} {dt:.1f}s rc={rc}',flush=True)
print('done',len(done),'failed',len(failed))
