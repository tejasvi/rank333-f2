#!/bin/bash
# nchk_ii.sh LIST WORKDIR: CHECK.native.conf's CHECKER for case II (batch mode): the node agent's checker settings + nchk_batch.sh.
# Names agreed with the node agent (2026-10-07): `NN.batchII ks ss : Bool`, `NN.batchII_sound : batchII ks ss = true →
# R22N.KeysOK NN.CheckedII ks` in the core module NN.Case (not linked: it binds the R22D statics and calls the linked checker).
L=$(cd "$(dirname "$0")"; pwd); N=r22/lean/native
# the library: ONE content-addressed build lib/out/ckr-<FP> (lib/mkckr.sh; FP pinned in lib/CKR_FP); NLIB is always its
# libnative.so (nchk_batch.sh verifies both against MANIFEST.sha256 per chunk: audit T-1)
export NLEANPATH=${NLEANPATH:-$L/out/ckr-$(cat $L/CKR_FP)}
export NLIB=$NLEANPATH/libnative.so; readonly NLIB NLEANPATH
export NBATCHFN=${NBATCHFN:-NN.batchII} NSOUND=${NSOUND:-NN.batchII_sound}
export NCHECKMODS=${NCHECKMODS:-"NN.Case"} NDATAMODS=${NDATAMODS:-"R22D.L1Tab R22D.L1Hyp R22D.NStat R22D.K3eD479L"}
export NKEYCMD=${NKEYCMD:-}                                     # r3qglue --itemkey wrapper, once available
exec $L/nchk_batch.sh "$@"
