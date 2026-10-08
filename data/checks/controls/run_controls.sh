#!/bin/sh
# Positive controls for the completion search (Section 7): it must find a completion for the first factors of a known
# 23-term decomposition (lader.a, from lader_sat.txt, target T) and for each of its 12 quotients pos<i> (pos_list.txt gives
# the subspace E of each; pos<i>.t is the quotient target, pos<i>.a its first factors). Run from the repository root after
# cpp/build.sh. Writes data/checks/controls/out/ and prints one line per control.
set -e
D=data/checks/controls; mkdir -p $D/out
cpp/bin/tsolve4 --maxnodes 2000000000 $D/lader.a > $D/out/tsolve4_lader.txt 2>&1 || true
echo "lader: $(head -c 4 $D/out/tsolve4_lader.txt)"
for i in 0 1 2 3 4 5 6 7 8 9 10 11; do
  timeout 3600 cpp/bin/tsolve4 --maxnodes 2000000000 --target $D/pos$i.t $D/pos$i.a > $D/out/tsolve4_pos$i.txt 2>&1 || true
  echo "pos$i: $(head -c 4 $D/out/tsolve4_pos$i.txt)"
done
