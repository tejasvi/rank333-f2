#!/usr/bin/env python3
"""build.py [-j P] [--mem GB] [--only M,...] [--upto M,...] [--keep-going] [--dry]: compile the ported tree src/ into build/.

* Module names come from `-R src`, so they equal the originals (private and auxiliary names included).
* LEAN_PATH = build/ followed by the external libraries only (Mathlib and its dependencies, core): lp_mod.sh. No agent
  directory and no RR or kernel/proj build is on it, so a reference to an unported non-module file cannot resolve.
* Incremental, content-hashed: build/<M>.trace holds md5(md5 of the ported source file as it is on disk, lean args, traces of its
  local imports, toolchain and LEAN_PATH). A module is rebuilt iff its trace changed or an output is missing. Removed modules leave stale oleans, which
  are harmless (nothing imports them) and are deleted by `--clean-stale`.
* Scheduling: at most P jobs; a job starts only while the sum of the memory estimates of the running jobs plus its own stays
  under --mem GB and MemAvailable exceeds its estimate. Estimate = 1.3 x the peak RSS of the module's last build (log/
  status.tsv), else the original build's peak RSS if known (est_mem.tsv), else 4 GB. Priority: longest estimated path to a sink.
* Absolute nice 10. Per-module log: log/<M>.txt (lean output, then a line `wall s, peak KB, user s` from wait4). Results:
  log/status.tsv (module, rc, wall s, peak MB, date, user s) appended per job.
"""
import os, re, sys, time, json, hashlib, argparse, subprocess, heapq, shutil

# frozen tree (out/FROZEN, coordinator 2026-10-08: the final V5 re-run must run over exactly the tree V1-V4 validated):
# this tool changes the tree, so it refuses to run unless PORT_UNFREEZE=1
if os.path.exists(os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'FROZEN')) and \
        os.environ.get('PORT_UNFREEZE') != '1' and '--dry' not in sys.argv:
    sys.exit('port/out is FROZEN (see out/FROZEN); set PORT_UNFREEZE=1 to change it')

def wopen(path, *a, **k):
    """open for writing as a new file (unlink first): never writes through a hard link of a copied tree"""
    if os.path.lexists(path): os.remove(path)
    return open(path, 'w', *a, **k)

def aopen(path):
    """open for appending; a hard-linked file is first replaced by a private copy"""
    if os.path.exists(path) and os.stat(path).st_nlink > 1:
        import shutil as _sh
        _sh.copyfile(path, path + '.unshare'); os.replace(path + '.unshare', path)
    return open(path, 'a')
HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.dirname(HERE)
SRC, BUILD, LOG = (os.path.join(OUT, d) for d in ('src', 'build', 'log'))
LEAN = '$LEAN_TOOLCHAIN/bin/lean'
ap = argparse.ArgumentParser()
ap.add_argument('-j', type=int, default=8)
ap.add_argument('--mem', type=float, default=28, help='GB budget for the sum of estimates')
ap.add_argument('--only', default='', help='comma list: build only these modules (their imports must be built)')
ap.add_argument('--upto', default='', help='comma list: build these modules and everything they import')
ap.add_argument('--keep-going', action='store_true', default=True)
ap.add_argument('--dry', action='store_true')
ap.add_argument('--clean-stale', action='store_true')
ap.add_argument('--threads', type=int, default=1, help='lean -j for each process')
A = ap.parse_args()
LP = subprocess.check_output([os.path.join(HERE, 'lp_mod.sh')], text=True).strip()
# Every module is compiled with Elab.async=false (RR's lakefile already sets it for most of RR). In module mode, a command that
# adds thousands of declarations (the table loaders) is pathological with async elaboration: RT.K3eD_Data took 275 s / 21 GB
# against 29 s / 4.3 GB synchronously (the original non-module build: 35 s / 7.2 GB). It changes scheduling only.
DEFAULT_ARGS = ['-DElab.async=false']
SALT = hashlib.md5((LEAN + open(LEAN, 'rb').read(1 << 20).hex()[:64] + LP + ' '.join(DEFAULT_ARGS)).encode()).hexdigest()
man = [l.rstrip('\n').split('\t') for l in open(os.path.join(SRC, 'manifest.tsv')) if not l.startswith('#')]
# module files of ours used as they are (snap/modules.tsv): "built" by copying their frozen olean parts into build/
OWN = {}
mp = os.path.join(OUT, 'snap', 'modules.tsv')
if os.path.exists(mp):
    for l in open(mp):
        if l.startswith('#') or not l.strip(): continue
        f = l.rstrip('\n').split('\t')
        if len(f) < 5 or f[3] == '-': OWN[f[0]] = f[2]   # no source: copied; with a source it is in src/manifest.tsv
man = [[m, h, '-', '-', '-', 'own module'] for m, h in OWN.items()] + man
mods = [f[0] for f in man]
info = {f[0]: f for f in man}
deps = {f[0]: ([] if f[3] == '-' else f[3].split()) for f in man}
# extra lean arguments per module (tools/extra_args.tsv); @NATIVELIB: build/libnative.so, built by nativelib.py from the
# module files of tools/nativelib.txt, which therefore become dependencies of such a module
EXTRA = {}
if os.path.exists(os.path.join(HERE, 'extra_args.tsv')):
    for l in open(os.path.join(HERE, 'extra_args.tsv')):
        if l.startswith('#') or not l.strip(): continue
        m, a = l.rstrip('\n').split('\t', 1); EXTRA[m] = a
NATIVELIB = os.path.join(BUILD, 'libnative.so')
LIBPKGS = [x for x in (l.split('#')[0].strip() for l in open(os.path.join(HERE, 'nativelib.txt'))) if x and ' ' not in x and ':' not in x] \
    if os.path.exists(os.path.join(HERE, 'nativelib.txt')) else []
LIBMODS = [m for m in mods if info[m][5] == 'module file' and m.split('.')[0] in LIBPKGS and not m.startswith('R22D.')]
for m, a in EXTRA.items():
    if m in deps and '@NATIVELIB' in a: deps[m] = deps[m] + [x for x in LIBMODS if x not in deps[m]]
# modules that import external module files (port.py flag `ext`: infra's GA_* glues / NC_* chunks, tools/ext_modules.txt):
# their directories go on LEAN_PATH after build/ (for these modules only, so no other trace changes), and the md5 of the GA
# oleans enters their trace (a rebuilt `fin` glue rebuilds them)
EXTMODS = {m for m in mods if 'ext' in info[m][5].split(',')}
TRACEX = {}; EXTDIRS = []
if EXTMODS:
    sys.path.insert(0, HERE); import extmod
    EXTDIRS = extmod.dirs(); fp = extmod.fingerprint()
    print('external module files: %d importing modules, %d directories, %s' % (len(EXTMODS), len(EXTDIRS), fp), flush=True)
    for m in EXTMODS: TRACEX[m] = fp
srcf = lambda m: os.path.join(SRC, *m.split('.')) + '.lean'
outb = lambda m: os.path.join(BUILD, *m.split('.'))
os.makedirs(LOG, exist_ok=True)

# memory / time estimates
est_mem = {}; est_t = {}
emp = os.path.join(HERE, 'est_mem.tsv')
if os.path.exists(emp):
    for l in open(emp):
        if l.startswith('#') or not l.strip(): continue
        f = l.split(); est_mem[f[0]] = float(f[1]); est_t[f[0]] = float(f[2]) if len(f) > 2 else 10.0
stp = os.path.join(LOG, 'status.tsv')
if os.path.exists(stp):
    for l in open(stp):
        f = l.rstrip('\n').split('\t')
        if len(f) >= 4 and f[1] == '0':
            try: est_mem[f[0]] = float(f[3]) / 1024; est_t[f[0]] = float(f[2])
            except ValueError: pass
memof = lambda m: max(1.0, 1.3 * est_mem.get(m, 2.0))
timeof = lambda m: est_t.get(m, 10.0)

# selection
sel = set(mods)
if A.upto:
    sel = set(); st = A.upto.split(',')
    while st:
        x = st.pop()
        if x in sel: continue
        if x not in info: sys.exit('unknown module ' + x)
        sel.add(x); st += deps[x]
if A.only:
    sel = set(A.only.split(','))

# traces (content hashes), in import order. The content hash is computed from the file itself (audit P-3), not taken from
# src/manifest.tsv: the ported source for a ported module, the frozen olean parts for a module file used as it is. When the file
# agrees with the manifest (the normal case) the trace is unchanged; a file edited after port.py is rebuilt and reported.
def file_md5(m):
    if m in OWN:   # the frozen .olean that is copied (snap/modules.tsv records its md5)
        o = os.path.join(OUT, 'snap', 'modolean', *m.split('.')) + '.olean'
        return hashlib.md5(open(o, 'rb').read()).hexdigest() if os.path.exists(o) else 'missing:' + info[m][1]
    return hashlib.md5(open(srcf(m), 'rb').read()).hexdigest()
fmd5 = {}; edited = []
for m in mods:
    fmd5[m] = file_md5(m)
    if fmd5[m] != info[m][1]: edited.append(m)
if edited:
    print('WARNING: %d sources differ from src/manifest.tsv (edited after port.py?), traced by their content: %s' % (
        len(edited), ' '.join(edited[:20])), flush=True)
trace = {}
for m in mods:
    f = info[m]
    trace[m] = hashlib.md5(('\n'.join([SALT, fmd5[m], f[2], EXTRA.get(m, '')] + ([TRACEX[m]] if m in TRACEX else []) +
                                       [d + ':' + trace[d] for d in deps[m]])).encode()).hexdigest()
def uptodate(m):
    o = outb(m)
    if not all(os.path.exists(o + e) for e in ('.olean', '.ilean')): return False
    try: return open(o + '.trace').read().strip() == trace[m]
    except OSError: return False
todo = [m for m in mods if m in sel and not uptodate(m)]
tset = set(todo)
print('%d modules, %d selected, %d to build' % (len(mods), len(sel), len(todo)), flush=True)
if A.clean_stale:
    keep = {outb(m) for m in mods}
    for dp, dn, fn in os.walk(BUILD):
        if os.path.relpath(dp, BUILD).split(os.sep)[0] == 'c': continue   # nativelib.py's C files
        for x in fn:
            if dp == BUILD and x.startswith('libnative.'): continue       # nativelib.py's library and manifest
            base = os.path.join(dp, x.split('.')[0])
            if base not in keep:
                if A.dry: print('stale (--dry: kept)', os.path.join(dp, x)); continue
                os.remove(os.path.join(dp, x)); print('removed', os.path.join(dp, x))
if A.dry:
    for m in todo[:100]: print('  ' + m)
    sys.exit(0)
rdeps = {m: [] for m in mods}
for m in mods:
    for d in deps[m]: rdeps[d].append(m)
# longest estimated path to a sink (over modules still to build)
prio = {}
for m in reversed(mods):
    prio[m] = timeof(m) + max([prio[r] for r in rdeps[m] if r in tset] or [0])
NI = max(0, 10 - os.nice(0))
def memavail():
    for line in open('/proc/meminfo'):
        if line.startswith('MemAvailable:'): return int(line.split()[1]) / 1048576
    return 0
env = dict(os.environ, LEAN_PATH=BUILD + ':' + LP)
failed = set(); done = set(); running = {}; nativelib_done = False
waiting = {m: sum(1 for d in deps[m] if d in tset) for m in todo}
ready = [(-prio[m], m) for m in todo if waiting[m] == 0]
heapq.heapify(ready)
t0 = time.time(); nd = 0; used = 0.0
status = aopen(stp)
def skip(m):
    # mark m and everything above it as skipped
    st = [m]
    while st:
        x = st.pop()
        for r in rdeps[x]:
            if r in tset and r not in failed:
                failed.add(r); print('SKIP %s (needs %s)' % (r, x), flush=True); st.append(r)
while ready or running:
    started = True
    while ready and len(running) < A.j and started:
        started = False
        pr, m = ready[0]
        need = memof(m)
        if running and (used + need > A.mem or memavail() < need + 4): break
        heapq.heappop(ready)
        if m in failed: continue
        o = outb(m); os.makedirs(os.path.dirname(o), exist_ok=True)
        for e in ('.olean', '.ilean', '.trace', '.olean.private', '.olean.server', '.ir'):
            if os.path.exists(o + e): os.remove(o + e)
        if m in OWN:
            base = os.path.join(OUT, 'snap', 'modolean', *m.split('.'))
            for e in ('.olean', '.ilean', '.olean.private', '.olean.server', '.ir'):
                if os.path.exists(base + e): shutil.copy2(base + e, o + e)
            if not os.path.exists(o + '.ilean'): wopen(o + '.ilean').close()
            wopen(o + '.trace').write(trace[m] + '\n'); done.add(m); nd += 1
            print('COPY %s (module file used as it is)' % m, flush=True)
            for r in rdeps[m]:
                if r in waiting:
                    waiting[r] -= 1
                    if waiting[r] == 0 and r not in failed: heapq.heappush(ready, (-prio[r], r))
            started = True; continue
        extra = info[m][2].split() if info[m][2] != '-' else []
        extra = [a for a in DEFAULT_ARGS if a not in extra] + extra
        if m in EXTRA:
            if '@NATIVELIB' in EXTRA[m] and not nativelib_done:
                print('building libnative.so for %s' % m, flush=True)
                subprocess.check_call([sys.executable, os.path.join(HERE, 'nativelib.py')]); nativelib_done = True
            extra += EXTRA[m].replace('@NATIVELIB', NATIVELIB).split()
        cmd = ['nice', '-n', str(NI), LEAN, '-j', str(A.threads), '-R', SRC] + extra + \
              [srcf(m), '-o', o + '.olean', '-i', o + '.ilean']
        lf = wopen(os.path.join(LOG, m + '.txt'))
        envm = env if m not in EXTMODS else dict(env, LEAN_PATH=':'.join([BUILD] + EXTDIRS + [LP]))
        running[m] = (subprocess.Popen(cmd, stdout=lf, stderr=subprocess.STDOUT, env=envm, cwd=SRC), time.time(), lf, need)
        used += need; started = True
    time.sleep(0.2)
    for m in list(running):
        p, ts, lf, need = running[m]
        # wait4 instead of /usr/bin/time (the fleet VMs lack it): exit status and this child's own rusage
        pid, wst, ru = os.wait4(p.pid, os.WNOHANG)
        if pid == 0: continue
        p.returncode = rc = os.waitstatus_to_exitcode(wst)
        wall = time.time() - ts; rss = ru.ru_maxrss // 1024
        lf.write('%.2f s %d KB %.2f user\n' % (wall, ru.ru_maxrss, ru.ru_utime)); lf.close()
        del running[m]; used -= need; nd += 1
        status.write('%s\t%d\t%.1f\t%d\t%s\t%.1f\n' % (m, rc, wall, rss, time.strftime('%Y-%m-%dT%H:%M:%S'), ru.ru_utime)); status.flush()
        if rc != 0:
            failed.add(m); print('FAIL %s %.1fs rc=%d' % (m, wall, rc), flush=True); skip(m); continue
        wopen(outb(m) + '.trace').write(trace[m] + '\n')
        done.add(m)
        for r in rdeps[m]:
            if r in waiting:
                waiting[r] -= 1
                if waiting[r] == 0 and r not in failed: heapq.heappush(ready, (-prio[r], r))
        if nd % 100 == 0:
            print('%d/%d done, %d failed, %d running, %.0f s, est %.0f GB, MemAvailable %.0f GB' % (
                nd, len(todo), len(failed), len(running), time.time() - t0, used, memavail()), flush=True)
print('DONE built %d, failed/skipped %d, in %.0f s' % (len(done), len(failed), time.time() - t0), flush=True)
fl = sorted(m for m in failed if not any(d in failed for d in deps[m]))
if fl: print('first failures:', ' '.join(fl))
sys.exit(1 if failed else 0)
