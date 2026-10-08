#!/bin/bash
# nchk_i.sh LIST WORKDIR: CHECK.native.conf's CHECKER for case I (--rord 321) (batch mode): the node agent's checker settings + nchk_batch.sh.
# Names agreed with the node agent (2026-10-07): `NN.batchI ks ss : Bool`, `NN.batchI_sound : batchI ks ss = true →
# R22N.KeysOK NN.CheckedI ks` in the core module NN.Case (not linked: it binds the R22D statics and calls the linked checker).
L=$(cd "$(dirname "$0")"; pwd); N=r22/lean/native
# the library: ONE content-addressed build lib/out/ckr-<FP> (lib/mkckr.sh; FP pinned in lib/CKR_FP); NLIB is always its
# libnative.so (nchk_batch.sh verifies both against MANIFEST.sha256 per chunk: audit T-1)
export NLEANPATH=${NLEANPATH:-$L/out/ckr-$(cat $L/CKR_FP)}
export NLIB=$NLEANPATH/libnative.so; readonly NLIB NLEANPATH
export NBATCHFN=${NBATCHFN:-NN.batchI} NSOUND=${NSOUND:-NN.batchI_sound}
export NCHECKMODS=${NCHECKMODS:-"NN.Case"} NDATAMODS=${NDATAMODS:-"R22D.T321 R22D.NStat R22D.K3eDL321"}
export NKEYCMD=${NKEYCMD:-}                                     # r3qglue --itemkey wrapper, once available
exec $L/nchk_batch.sh "$@"
