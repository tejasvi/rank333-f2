#!/bin/bash
# lpcheck.sh MOD...: are the oleans of MOD's import closure unambiguous under $LEAN_PATH?  Lists the closure (LpList.lean, first
# provider per module), then looks for the same module in every other LEAN_PATH entry and byte-compares all its parts (.olean,
# .olean.private, .olean.server, .ir).  Note: a root namespace (e.g. `Top`) resolves to the FIRST entry holding a `Top/` directory;
# its modules cannot be split across entries ("object file … does not exist" if that entry lacks one).  Mixed builds (oleans compiled against different copies of a dependency) are sound only
# if every duplicate is byte-identical (Lean does not re-check imported declarations).  Prints DIFF lines and a summary;
# exit 1 if any duplicate differs.  Absolute nice 10.
T=$LEAN_TOOLCHAIN/bin
NI=$((10-$(nice))); [ $NI -lt 0 ] && NI=0; export PATH=$T:$PATH   # findSysroot runs `lean --print-prefix`
D=$(cd "$(dirname "$0")"; pwd)
nice -n $NI $T/lean --run $D/LpList.lean "$@" > /tmp/lpcheck.$$ || { echo "LpList failed"; exit 2; }
python3 - /tmp/lpcheck.$$ <<'PY'
import os,sys,filecmp
lp=[d for d in os.environ['LEAN_PATH'].split(':') if d]
rows=[l.split() for l in open(sys.argv[1]) if l.strip()]
ndup=ndiff=0
for m,p in rows:
    rel=os.path.join(*m.split('.'))
    # Lean resolves a module's ROOT namespace to the first LEAN_PATH entry holding that root directory (or root .olean), so the
    # provider is the path LpList printed, not necessarily the first entry holding the file
    first=os.path.normpath(p[:-len(rel+'.olean')])
    provs=[d for d in lp if os.path.exists(os.path.join(d,rel+'.olean')) and os.path.normpath(d)!=first]
    if not provs: continue
    ndup+=1
    for d in provs:
        bad=[]
        for ext in ['.olean','.olean.private','.olean.server','.ir']:
            a=os.path.join(first,rel+ext); b=os.path.join(d,rel+ext)
            if os.path.exists(a)!=os.path.exists(b) or (os.path.exists(a) and not filecmp.cmp(a,b,shallow=False)): bad.append(ext)
        if bad: ndiff+=1; print('DIFF %s: %s vs %s (%s)'%(m,first,d,','.join(bad)))
print('lpcheck: %d modules in the closure, %d with several providers, %d differing'%(len(rows),ndup,ndiff))
sys.exit(1 if ndiff else 0)
PY
rc=$?; rm -f /tmp/lpcheck.$$; exit $rc
