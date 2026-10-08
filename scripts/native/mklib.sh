#!/bin/bash
# mklib.sh NAME OUT ROOT:MOD[,MOD...] [ROOT:MOD...]: the native track's checker library.
#   Compiles core-only `module` files (module names MOD, sources ROOT/<MOD path>.lean, `-R ROOT`) in dependency order into OUT
#   (.olean parts, .ilean, .ir, and C in OUT/c), then links OUT/lib<NAME>.so with the standard flags:
#     leanc -O3 -DNDEBUG -DLEAN_EXPORTING -fPIC -shared -march=$MARCH   (MARCH default x86-64-v3: AVX2 + popcnt, runs on every
#     fleet CPU type; -DNDEBUG drops lean.h's assertions, 25-35% on the X tier; without -DLEAN_EXPORTING the library is unused)
#   and writes OUT/lib<NAME>.manifest: lean version, flags, md5 of every source, C file and the .so.  Absolute nice 10.
#   Data modules (static tables) are NOT linked: they stay IR-interpreted (chunks `meta import` them; PROOF_OBJECT.md §9.2).
#   NOLINK: space-separated glob patterns of modules compiled into OUT (olean, ilean, ir) but not emitted as C / not linked: the data
#   modules and the per-instance binding modules (e.g. NOLINK='R22D.* NN.Load NN.DataII NN.Case E1N.IP_* E1N.Roots_* R22N.Drv').
#   LEANFLAGS: extra lean options for every module (e.g. -DElab.async=false, as the (B+) port build passes).
set -e
NAME=$1; OUT=$(mkdir -p "$2" && cd "$2" && pwd); shift 2
T=$LEAN_TOOLCHAIN/bin
MARCH=${MARCH:-x86-64-v3}; FLAGS="-O3 -DNDEBUG -DLEAN_EXPORTING -fPIC -shared -march=$MARCH"
NI=$((10-$(nice))); [ $NI -lt 0 ] && NI=0
mkdir -p $OUT/c
export LEAN_PATH=$OUT${EXTRA_LEAN_PATH:+:$EXTRA_LEAN_PATH}:$T/../lib/lean
ORDER=$(python3 - "$@" <<'PY'
import sys,re,os
specs=[]
for a in sys.argv[1:]:
    root,mods=a.split(':',1)
    for m in mods.split(','): specs.append((m,root))
src={m:os.path.join(r,*m.split('.'))+'.lean' for m,r in specs}
seen=set(); order=[]
def visit(m):
    if m in seen: return
    seen.add(m)
    for im in re.findall(r'^(?:public\s+)?(?:meta\s+)?import\s+(?:all\s+)?(\S+)',open(src[m]).read(),re.M):
        if im in src: visit(im)
    order.append(m)
for m,_ in specs: visit(m)
print(' '.join('%s=%s'%(m,src[m]) for m in order))
PY
)
CS=""
for ms in $ORDER; do
  m=${ms%%=*}; f=${ms#*=}; root=${f%/$(echo $m | tr . /).lean}
  o=$OUT/$(echo $m | tr . /).olean; mkdir -p $(dirname $o)
  c=$OUT/c/$(echo $m | tr . _).c; link=1
  for p in ${NOLINK:-}; do [[ $m == $p ]] && link=0; done
  if [ $link = 1 ]; then nice -n $NI $T/lean ${LEANFLAGS:-} -R $root -o $o -i ${o%.olean}.ilean -c $c $f; CS="$CS $c"
  else nice -n $NI $T/lean ${LEANFLAGS:-} -R $root -o $o -i ${o%.olean}.ilean $f; fi
done
nice -n $NI $T/leanc $FLAGS -o $OUT/lib$NAME.so $CS
{ echo "lean $($T/lean --version | head -1)"; echo "flags $FLAGS"
  for ms in $ORDER; do echo "src ${ms%%=*} $(md5sum ${ms#*=} | cut -c1-32) ${ms#*=}"; done
  for c in $CS; do echo "c $(md5sum $c | cut -c1-32) $c"; done
  echo "so $(md5sum $OUT/lib$NAME.so | cut -c1-32) $OUT/lib$NAME.so"; } > $OUT/lib$NAME.manifest
echo "built $OUT/lib$NAME.so ($(echo $ORDER | wc -w) modules)"
