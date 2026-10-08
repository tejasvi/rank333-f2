#!/bin/bash
# mkpayload.sh OUTDIR: the native checkers' worker payload (no Mathlib: chunks import only core-only modules).
#   Contents (absolute paths kept, as the queue's r3q payload does): the Lean v4.30.0 toolchain (bin/, lib/lean, lib/*.so),
#   native/infra/lib/{out (R22N/R22D oleans, IR, lib*.so, checker modules built by mklib.sh), nchk*.sh (batch CHECKER + wrappers),
#   bin/ (bin7enc), glue.py, py/, CHECK.native.conf, endcheck/}.  Writes OUTDIR/native_payload_<md5>.tar.zst and a manifest (md5 of every file).  The aggregation host additionally
#   needs the (B+)-ported static closure (Mathlib + semantics) for env N / the final module.
set -e
OUT=$(mkdir -p "$1" && cd "$1" && pwd)
TC=$LEAN_TOOLCHAIN
L=r22/lean/native/infra/lib
LIST=$OUT/payload.list
# NOTC=1: without the Lean toolchain (the queue's r3q payload snapshot already has it); only lib/out/ckr (the ONE combined build) of lib/out
# The library: the content-addressed directory named by lib/CKR_FP (lib/mkckr.sh; audit T-1), plus CKR_FP itself (the wrappers' default).
CKR=$L/out/ckr-$(cat $L/CKR_FP); python3 $L/py/libmeta.py verify $CKR > /dev/null || { echo "mkpayload: $CKR fails its MANIFEST"; exit 1; }
{ [ "${NOTC:-0}" = 1 ] || find $TC/bin $TC/lib -type f; find $CKR $L/py $L/endcheck $L/bin -type f
  ls $L/CKR_FP $L/out/ckr.md5 $L/nchk*.sh $L/irsample.sh $L/casemap.txt $L/glue.py $L/gabuild.py $L/CHECK.native.conf $L/mklib.sh $L/mkckr.sh $L/ckr.spec; } | sort > $LIST
xargs -a $LIST md5sum > $OUT/payload.md5
M=$(md5sum $OUT/payload.md5 | cut -c1-12)
NI=$((10-$(nice))); [ $NI -lt 0 ] && NI=0
nice -n $NI tar -cf - -P -T $LIST | nice -n $NI zstd -T8 -3 -q -o $OUT/native_payload_$M.tar.zst
ls -la $OUT/native_payload_$M.tar.zst; echo "files: $(wc -l < $LIST)"
