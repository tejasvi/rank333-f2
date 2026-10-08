#!/bin/bash
# nchk_batch.sh LIST WORKDIR: the native CHECKER for checkd.py's batch mode (CHECK.conf BATCHMB; r22/lean/rerun/r3/QUEUE.md 02:55 UTC).
#   LIST lines: "id kind pool ix ITEMBIN sha256" (ITEMBIN = r3qglue --itembin output).  Per item: key = py/itemkey.py ITEMBIN [REFS]
#   (REFS from $NKEYCMD ITEMBIN, i.e. `r3qglue --itemkey`, when available), data = bin/bin7enc < ITEMBIN.  ONE chunk module over
#   the whole batch (one native evaluation).  Prints "ITEM id OK|FAIL ndecl=1 thm=<sha256 of the exported olean> chunk=<NAME>
#   olean=<path> lib=<FP> fp=<closure fp> so=<sha256 of libnative.so> dyn=1|0" per item; checkd uploads the olean (and, requested,
#   the <chunk>.keys sidecar) to OLEANDEST.  If the batch chunk fails, it is bisected (halves, recursively) down to the failing items.
#   ITEMBIN.k (optional): a precomputed decimal key, used instead of itemkey.py (pcert-segment items, keys from the decoder; keys are
#   untrusted hints either way).
#   Library (audit T-1, 2026-10-07): NLEANPATH must be ONE content-addressed library directory (lib/mkckr.sh: FP, MANIFEST.md5,
#   MANIFEST.sha256, CLOSURE.tsv) and NLIB its libnative.so.  Before the first chunk and after every chunk compile, the sha256 of
#   libnative.so and of the four olean parts of every module the chunk loads (CLOSURE.tsv) are checked against MANIFEST.sha256; a
#   mismatch fails the chunk (reason=lib-...).  .keys lines: "KEY MODULE POS THM CHECKMODS lib= fp= so= olean=<sha256> dyn= fn= sound=
#   src=" (fn/sound: the template's checker pair, so the chunk's native axiom is `fn ks ss = true`; src: sha256 of the checked source);
#   glue.py admits a chunk only if its fp/so are allow-listed and its olean still has that sha256 (T-3).
#   NNODYNLIB=1: no --load-dynlib, so native_decide evaluates in Lean's IR interpreter from the oleans' own .ir (the independent
#   cross-check of a sample, lib/irsample.sh); recorded as dyn=0.
#   Env: NLIB, NLEANPATH, NSCRATCH (tmpfs; default /dev/shm/r22native), NBATCHFN, NSOUND, NCHECKMODS, NDATAMODS, NKEYCMD (optional).
LIST=$1; W=$2; L=$(cd "$(dirname "$0")"; pwd)
T=$LEAN_TOOLCHAIN/bin
: "${NLIB:?}" "${NLEANPATH:?}" "${NBATCHFN:?}" "${NSOUND:?}" "${NCHECKMODS:?}"; NSCRATCH=${NSCRATCH:-/dev/shm/r22native}
NI=$((10-$(nice))); [ $NI -lt 0 ] && NI=0
# a private work directory per invocation: a checker left running from an earlier attempt (e.g. after checkd killed the batch's shell,
# or across a checkd restart that reuses the batch's work dir name) must never append to this run's lists (15:18 UTC, r3qc04: 102
# false io-batchlist FAILs); the chunk files named in the ITEM lines (olean=…) live here too
W=$W/run.$$; rm -rf $W; mkdir -p $W
DYN=1; DYNARG=--load-dynlib=$NLIB; [ "${NNODYNLIB:-0}" = 1 ] && { DYN=0; DYNARG=; }
NAMERE='^[A-Za-z0-9_. ]*$'
for v in NBATCHFN NSOUND NCHECKMODS NDATAMODS; do [[ ${!v} =~ $NAMERE ]] || { echo "nchk_batch: bad $v" >&2; exit 2; }; done
# ---- the library (audit T-1): libverify MOD... sets LIBFP CFP SOSHA (or LIBWHY, returns 1); librecheck re-hashes the same files
LIBD=; LIBWHY=lib-path
case "$NLEANPATH" in *:*) ;; *) d=$(realpath -e "$NLEANPATH" 2>/dev/null) && [ "$(realpath -e "$NLIB" 2>/dev/null)" = "$d/libnative.so" ] && LIBD=$d;; esac
readonly NLIB NLEANPATH LIBD NBATCHFN NSOUND NCHECKMODS NDATAMODS DYN DYNARG
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
# chunk NAME CLIST -> prints the exported olean's sha256 (and leaves NAME.olean, NAME.keys in $W) or "FAIL <reason>"
chunk() {
  local NAME=$1 CL=$2 S=$NSCRATCH/$1.$$ osha; rm -rf $S; mkdir -p $S   # private scratch, like W
  { echo module; for m in $NCHECKMODS; do echo "public meta import $m"; done
    for m in $NDATAMODS; do echo "meta import $m"; done; echo "meta import R22N.Drv"
    echo "#nchunk $NAME.thm $NBATCHFN $NSOUND \"$CL\""; } > $S/$NAME.lean
  if [ "$(/usr/bin/grep -cvE '^(module|public meta import [A-Za-z0-9_.]+|meta import [A-Za-z0-9_.]+|#nchunk [A-Za-z0-9_.]+ [A-Za-z0-9_.]+ [A-Za-z0-9_.]+ "[^"]+")$' $S/$NAME.lean)" != 0 ]; then
    echo "FAIL template"; return; fi
  if ! LEAN_PATH=$LIBD:$T/../lib/lean nice -n $NI $T/lean $DYNARG -R $S -o $S/$NAME.olean $S/$NAME.lean > $S/lean.log 2>&1; then
    echo "FAIL lean"; cp $S/lean.log $W/$NAME.log; rm -rf $S; return; fi
  librecheck || { echo "FAIL $LIBWHY-after"; rm -rf $S; return; }
  rm -f $S/$NAME.olean.private $S/$NAME.olean.server
  cp $S/$NAME.olean $S/$NAME.lean $W/ || { echo "FAIL copy"; rm -rf $S; return; }; cp $S/lean.log $W/$NAME.log
  osha=$(sha256sum $W/$NAME.olean | cut -c1-64); ssha=$(sha256sum $W/$NAME.lean | cut -c1-64)
  [ ${#osha} = 64 ] && [ ${#ssha} = 64 ] || { echo "FAIL copy"; rm -rf $S; return; }
  # fn/sound: the template's checker pair (the native axiom's type is `fn ks ss = true`); src: sha256 of the template-checked source
  awk -v m=$NAME -v c="$NCHECKMODS" -v x="lib=$LIBFP fp=$CFP so=$SOSHA olean=$osha dyn=$DYN fn=$NBATCHFN sound=$NSOUND src=$ssha" '{print $1, m, NR-1, m".thm", c, x}' $CL > $W/$NAME.keys
  # the chunk covers exactly its list: as many .keys lines as list lines, the same keys in the same order, and at least one
  [ -s $W/$NAME.keys ] && [ "$(/usr/bin/grep -c . $W/$NAME.keys)" = "$(/usr/bin/grep -c . $CL)" ] && cmp -s <(awk '{print $1}' $W/$NAME.keys) <(awk '{print $1}' $CL) \
    || { echo "FAIL keys"; rm -rf $S; return; }
  echo $osha; rm -rf $S
}
: > $W/batch.list; ids=(); keys=()
while read -r id kind pool ix ib sha; do
  [ -n "$id" ] || continue
  # the input must be a complete item block with the queue's sha256 (a file written empty or truncated, e.g. on a full disk, must
  # not reach the chunk: coordinator 2026-10-07, empty chunks reported OK on r3qc01/03)
  python3 $L/py/itemcheck.py "$ib" "${sha:--}" 2> $W/$id.ichk || { echo "ITEM $id FAIL ndecl=0 thm=- chunk=- olean=- reason=input:$(tr ' ' '_' < $W/$id.ichk | cut -c1-80)"; continue; }
  if [ -s "$ib.k" ]; then k=$(cat "$ib.k")                    # a precomputed decimal key (pcert-segment items, reh/mkitems)
  else
  refs=""; if [ -f "$ib.key" ]; then refs="$ib.key"          # checkd: ITEMBIN.key = r3qglue --itemkey of the item
  elif [ -n "$NKEYCMD" ]; then $NKEYCMD "$ib" > $W/$id.refs 2>/dev/null && refs=$W/$id.refs; fi
  k=$(python3 $L/py/itemkey.py "$ib" $refs) || { echo "ITEM $id FAIL ndecl=0 thm=- chunk=- olean=- reason=key"; continue; }
  fi
  [[ $k =~ ^[0-9]+$ ]] || { echo "ITEM $id FAIL ndecl=0 thm=- chunk=- olean=- reason=key"; continue; }
  $L/bin/bin7enc < "$ib" > $W/$id.b7 && [ -s $W/$id.b7 ] || { echo "ITEM $id FAIL ndecl=0 thm=- chunk=- olean=- reason=bin7enc"; continue; }
  echo "$k $W/$id.b7" >> $W/batch.list || { echo "ITEM $id FAIL ndecl=0 thm=- chunk=- olean=- reason=io"; continue; }
  ids+=("$id:$pool"); keys+=("$k")
done < "$LIST"
[ ${#ids[@]} -gt 0 ] || exit 0
# the batch list must hold exactly the accepted items (a short write would make the chunk cover fewer items than reported)
if [ "$(/usr/bin/grep -c . $W/batch.list)" != "${#ids[@]}" ]; then
  for x in "${ids[@]}"; do echo "ITEM ${x%%:*} FAIL ndecl=0 thm=- chunk=- olean=- reason=io-batchlist"; done; exit 0; fi
if ! libverify $NCHECKMODS $NDATAMODS R22N.Drv; then
  for x in "${ids[@]}"; do echo "ITEM ${x%%:*} FAIL ndecl=0 thm=- chunk=- olean=- reason=$LIBWHY"; done; exit 0; fi
LIBTAG="lib=$LIBFP fp=$CFP so=$SOSHA dyn=$DYN"
# try LO HI: one chunk over items [LO, HI) of batch.list; on failure, bisect (2 log2 n extra chunks per failing item, instead of n)
try() {
  local lo=$1 hi=$2 n=$(( $2 - $1 )) first=${ids[$1]%%:*} pool=${ids[$1]#*:}
  local NAME=NC_$(echo "${pool}_${first}_${n}" | tr -c 'A-Za-z0-9_\n' '_') CL=$W/sub_${lo}_${hi}.list
  sed -n "$((lo + 1)),${hi}p" $W/batch.list > $CL
  if [ "$(/usr/bin/grep -c . $CL)" != "$n" ]; then
    for ((i = lo; i < hi; i++)); do echo "ITEM ${ids[$i]%%:*} FAIL ndecl=0 thm=- chunk=$NAME olean=- reason=io-sublist"; done; return; fi
  local r=$(chunk $NAME $CL)
  if [ "${r:0:4}" != FAIL ]; then
    # OK only for an item whose own key is the .keys line at its position (chunk() checked count and order)
    mapfile -t got < <(awk '{print $1}' $W/$NAME.keys)
    for ((i = lo; i < hi; i++)); do
      if [ "${got[$((i - lo))]:-}" = "${keys[$i]}" ]; then echo "ITEM ${ids[$i]%%:*} OK ndecl=1 thm=$r chunk=$NAME olean=$W/$NAME.olean $LIBTAG"
      else echo "ITEM ${ids[$i]%%:*} FAIL ndecl=0 thm=- chunk=$NAME olean=- reason=key-not-in-chunk $LIBTAG"; fi
    done
  elif [ "${r:0:8}" = "FAIL lib" ] || [ "${r:0:9}" = "FAIL keys" ]; then   # library changed / chunk keys wrong: fail the rest, no bisection
    for ((i = lo; i < hi; i++)); do echo "ITEM ${ids[$i]%%:*} FAIL ndecl=0 thm=- chunk=$NAME olean=- reason=${r#FAIL } $LIBTAG"; done
  elif [ $n -eq 1 ]; then echo "ITEM $first FAIL ndecl=0 thm=- chunk=$NAME olean=- reason=${r#FAIL } $LIBTAG"
  else local mid=$(( lo + n / 2 )); try $lo $mid; try $mid $hi; fi
}
try 0 ${#ids[@]}
