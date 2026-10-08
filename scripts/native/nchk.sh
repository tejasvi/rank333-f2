#!/bin/bash
# nchk.sh DIR POOL IID: the native CHECKER of form (B) for checkd.py (r22/xq/r3q/checkd.py; CHECK.conf CHECKER line).
#   DIR (written by the CONVERT step) holds chunk.list ("KEY PATH" per item) and chunk.conf (BATCHFN SOUND CHECKMODS DATAMODS).
#   Generates the chunk module from the FIXED template (PROOF_OBJECT.md §3.2b), compiles it with the checker library into tmpfs,
#   deletes the private parts (the data), copies the exported .olean to $NSTORE, prints "OK ndecl=<items> thm=<sha256 of the
#   exported olean> lib=<FP> fp=<closure fp> so=<sha256 of libnative.so> dyn=1|0" or "FAIL ...".
#   Env: NLIB (checker .so), NLEANPATH (module oleans), NSTORE (exported-olean store; dir), NSCRATCH (tmpfs dir, default
#   /dev/shm/r22native), NNODYNLIB=1 (IR interpreter instead of the .so; dyn=0).  Absolute nice 10.
#   Audit fixes (2026-10-07): T-2, chunk.conf is untrusted: it is PARSED (exactly the four keys, values restricted to names), never
#   sourced, and the variables are then readonly.  T-1, the library: NLEANPATH must be ONE content-addressed library directory
#   (lib/mkckr.sh) and NLIB its libnative.so; the sha256 of libnative.so and of the four olean parts of every module the chunk
#   loads are checked against its MANIFEST.sha256 before and after the compile, and lib/fp/so are recorded in the result line and
#   in every .keys line ("KEY MODULE POS THM CHECKMODS lib= fp= so= olean=<sha256> ir=<sha256> dyn= fn= sound= src="; fn/sound: the
#   template's checker pair, i.e. the native axiom's type is `fn ks ss = true`; src: sha256 of the template-checked chunk source).
D=$1; POOL=$2; IID=$3
T=$LEAN_TOOLCHAIN/bin
: "${NLIB:?set NLIB}" "${NLEANPATH:?set NLEANPATH}" "${NSTORE:?set NSTORE}"; NSCRATCH=${NSCRATCH:-/dev/shm/r22native}
BATCHFN=; SOUND=; CHECKMODS=; DATAMODS=
CONFRE='^(BATCHFN|SOUND|CHECKMODS|DATAMODS)="?([A-Za-z0-9_. ]*)"?$'
[ -f "$D/chunk.conf" ] || { echo "FAIL no chunk.conf"; exit 0; }
while IFS= read -r line || [ -n "$line" ]; do
  [ -z "${line// /}" ] && continue
  [[ $line =~ $CONFRE ]] || { echo "FAIL chunk.conf"; exit 0; }
  printf -v "${BASH_REMATCH[1]}" '%s' "${BASH_REMATCH[2]}"
done < "$D/chunk.conf"
[ -n "$BATCHFN" ] && [ -n "$SOUND" ] && [ -n "$CHECKMODS" ] || { echo "FAIL chunk.conf"; exit 0; }
DYN=1; DYNARG=--load-dynlib=$NLIB; [ "${NNODYNLIB:-0}" = 1 ] && { DYN=0; DYNARG=; }
LIBD=
case "$NLEANPATH" in *:*) ;; *) d=$(realpath -e "$NLEANPATH" 2>/dev/null) && [ "$(realpath -e "$NLIB" 2>/dev/null)" = "$d/libnative.so" ] && LIBD=$d;; esac
readonly BATCHFN SOUND CHECKMODS DATAMODS NLIB NLEANPATH NSTORE NSCRATCH LIBD DYN DYNARG
# ---- the library (audit T-1): the same code as nchk_batch.sh
libverify() {
  local f sel
  [ -n "$LIBD" ] || { LIBWHY=lib-path; return 1; }
  for f in FP MANIFEST.md5 MANIFEST.sha256 CLOSURE.tsv; do [ -f "$LIBD/$f" ] || { LIBWHY=lib-meta; return 1; }; done
  LIBFP=$(cat "$LIBD/FP"); [ "$(md5sum < "$LIBD/MANIFEST.md5" | cut -c1-12)" = "$LIBFP" ] || { LIBWHY=lib-fp; return 1; }
  sel=$(awk -v need="$*" 'BEGIN { n = split(need, w, " "); for (i = 1; i <= n; i++) N[w[i]] = 1 }
      FNR == NR { if ($1 in N) { F[$1] = 1; for (i = 1; i <= NF; i++) M[$i] = 1 } next }
      { p = substr($0, 67); q = p; if (sub(/\.(olean|olean\.private|olean\.server|ir)$/, "", q)) { q = substr(q, 3); gsub("/", ".", q); if (q in M) print } }
      END { for (k in N) if (!(k in F)) exit 3 }' "$LIBD/CLOSURE.tsv" "$LIBD/MANIFEST.sha256") || { LIBWHY=lib-closure; return 1; }
  [ -n "$sel" ] || { LIBWHY=lib-closure; return 1; }
  LIBSEL=$(printf '%s\n' "$sel" | LC_ALL=C sort -k2)
  LIBSO=$(/usr/bin/grep '  \./libnative\.so$' "$LIBD/MANIFEST.sha256") || { LIBWHY=lib-so; return 1; }
  librecheck || return 1
  CFP=$(printf '%s\n' "$LIBSEL" | sha256sum | cut -c1-64); SOSHA=${LIBSO:0:64}
}
librecheck() { ( cd "$LIBD" && printf '%s\n%s\n' "$LIBSEL" "$LIBSO" | sha256sum -c --strict --quiet > /dev/null 2>&1 ) || { LIBWHY=lib-hash; return 1; }; }
libverify $CHECKMODS $DATAMODS R22N.Drv || { echo "FAIL $LIBWHY"; exit 0; }
# the inputs (coordinator 2026-10-07: a full disk wrote empty inputs and an empty chunk was reported OK): a non-empty chunk.list of
# "KEY PATH" lines with decimal keys and non-empty item files; the caller compares ndecl with its own item count
[ -s "$D/chunk.list" ] || { echo "FAIL empty chunk.list"; exit 0; }
awk 'NF != 2 || $1 !~ /^[0-9]+$/ { exit 1 }' "$D/chunk.list" || { echo "FAIL chunk.list format"; exit 0; }
while read -r k p; do [ -s "$p" ] || { echo "FAIL input $(basename "$p") empty or missing"; exit 0; }; done < "$D/chunk.list"
NAME=NC_$(echo "${POOL}_${IID}" | tr -c 'A-Za-z0-9_\n' '_')
W=$NSCRATCH/$NAME; mkdir -p $W $NSTORE
{ echo module
  for m in $CHECKMODS; do echo "public meta import $m"; done
  for m in $DATAMODS; do echo "meta import $m"; done
  echo "meta import R22N.Drv"
  echo "#nchunk $NAME.thm $BATCHFN $SOUND \"$D/chunk.list\""; } > $W/$NAME.lean
# template check: nothing but the generated lines (no set_option / axiom / extra commands can enter)
n=$(/usr/bin/grep -cvE '^(module|public meta import [A-Za-z0-9_.]+|meta import [A-Za-z0-9_.]+|#nchunk [A-Za-z0-9_.]+ [A-Za-z0-9_.]+ [A-Za-z0-9_.]+ "[^"]+")$' $W/$NAME.lean)
[ "$n" = 0 ] || { echo "FAIL template"; exit 0; }
NI=$((10-$(nice))); [ $NI -lt 0 ] && NI=0
if ! LEAN_PATH=$LIBD:$T/../lib/lean nice -n $NI $T/lean $DYNARG -R $W -o $W/$NAME.olean $W/$NAME.lean > $W/lean.log 2>&1; then
  echo "FAIL lean $(tail -c 300 $W/lean.log | tr '\n' ' ')"; exit 0; fi
librecheck || { echo "FAIL $LIBWHY-after"; rm -rf $W; exit 0; }
rm -f $W/$NAME.olean.private $W/$NAME.olean.server
sha=$(sha256sum $W/$NAME.olean | cut -c1-64); irsha=-; [ -f $W/$NAME.ir ] && irsha=$(sha256sum $W/$NAME.ir | cut -c1-64)
[ ${#sha} = 64 ] || { echo "FAIL olean"; rm -rf $W; exit 0; }
cp $W/$NAME.olean $NSTORE/ && cp $W/$NAME.lean $NSTORE/ || { echo "FAIL copy"; rm -rf $W; exit 0; }
[ "$irsha" = - ] || cp $W/$NAME.ir $NSTORE/ || { echo "FAIL copy"; rm -rf $W; exit 0; }
cp $W/lean.log $NSTORE/$NAME.log 2>/dev/null   # per-chunk log name: parallel runs share NSTORE (E1 agent's report)
# the glue generator needs only (key, module, position, theorem, checker modules): one line per item, in chunk order
ssha=$(sha256sum $NSTORE/$NAME.lean | cut -c1-64)
awk -v m=$NAME -v c="$CHECKMODS" -v x="lib=$LIBFP fp=$CFP so=$SOSHA olean=$sha ir=$irsha dyn=$DYN fn=$BATCHFN sound=$SOUND src=$ssha" '{print $1, m, NR-1, m".thm", c, x}' $D/chunk.list > $NSTORE/$NAME.keys   # KEY MODULE POS THM CHECKMODS lib= fp= so= olean= ir= dyn= fn= sound= src=
[ "$(/usr/bin/grep -c . $NSTORE/$NAME.keys)" = "$(/usr/bin/grep -c . $D/chunk.list)" ] || { echo "FAIL keys"; rm -f $NSTORE/$NAME.keys $NSTORE/$NAME.olean; rm -rf $W; exit 0; }
rm -rf $W
echo "OK ndecl=$(/usr/bin/grep -c . $D/chunk.list) thm=$sha lib=$LIBFP fp=$CFP so=$SOSHA dyn=$DYN"
