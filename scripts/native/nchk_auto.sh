#!/bin/bash
# nchk_auto.sh LIST WORKDIR: the native CHECKER for VMs that may see items of several cases (checkd.py batches across pools).
#   Splits checkd's LIST ("id kind pool ix ITEMBIN sha256") by case, using $NCASEMAP (default lib/casemap.txt): lines "REGEX CASE",
#   CASE = ii | i | i13, the first regex matching the pool wins.  Each group goes to nchk_<case>.sh (one chunk per group) in
#   WORKDIR/<case>; their "ITEM …" lines are printed unchanged.  An item whose pool matches no line is reported FAIL (reason=case),
#   unless NCASEDEFAULT names a case.
LIST=$1; W=$2/auto.$$; L=$(cd "$(dirname "$0")"; pwd); MAP=${NCASEMAP:-$L/casemap.txt}; rm -rf $W; mkdir -p $W   # private per invocation (see nchk_batch.sh)
python3 - "$LIST" "$W" "$MAP" "${NCASEDEFAULT:-}" <<'PY'
import re,sys,os
lst,w,mp,dflt=sys.argv[1:5]
rules=[]
if os.path.exists(mp):
    for l in open(mp):
        l=l.split('#')[0].split()
        if len(l)==2 and l[1] in ('ii','i','i13'): rules.append((re.compile(l[0]),l[1]))
groups={}
for l in open(lst):
    f=l.split()
    if len(f)<6: continue
    c=next((cs for rx,cs in rules if rx.search(f[2])),dflt or None)
    if c is None: print('ITEM %s FAIL ndecl=0 thm=- chunk=- olean=- reason=case'%f[0]); continue
    groups.setdefault(c,[]).append(l if l.endswith('\n') else l+'\n')
for c,ls in groups.items():
    os.makedirs(os.path.join(w,c),exist_ok=True); open(os.path.join(w,'list_'+c),'w').write(''.join(ls))
open(os.path.join(w,'cases'),'w').write(' '.join(groups))
PY
for c in $(cat $W/cases 2>/dev/null); do $L/nchk_$c.sh $W/list_$c $W/$c; done
