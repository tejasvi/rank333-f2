#!/bin/bash
# mkipcopy_hcap.sh C...: module-land copies + rfl bridges of hcap's coset IPs h<C> (kernel modules HCap.IP_h<C>, HCap.SL_h<C>;
# constants E1G.IP_h<C>.*, tables E1G.GP_h<C>, E1G.SL_h<C>), as for E1G_l479cw.  Per class:
#   py/mkipcopy.py E1G h<C> hcap/HCap HCap  ->  src/R22D/E1G_h<C>.lean (module), bridge/R22B/E1G_h<C>.lean (non-module);
#   builds out/R22D/E1G_h<C>.olean, then bridge/out/R22B/E1G_h<C>.olean against hcap's LEAN_PATH (hcap/mk.sh);
#   records the md5s of the 4 inputs (IP/SL sources, gp/sl data files) in ipcopy.md5.  Logs: out/log/ipcopy_h<C>.txt.
# Absolute nice 10, -j1 per process; waits while MemAvailable < 96 GB.  Prints one line per class: OK|FAIL, times, axioms.
set -u
cd r22/lean/native/infra/lib
L=r22/lean; HC=$L/hcap
T=$LEAN_TOOLCHAIN/bin
NI=$((10-$(nice))); [ $NI -lt 0 ] && NI=0
RRB=work/rrlean/src/lb22_zenodo/.lake/build/lib/lean
LPH=$(sed "s|$RRB|$L/hcls/rrb/out|" $L/sound5/lpath.txt):$L/branch/proj/.lake/build/lib/lean:$L/sound5/out:$L/sound6/out:$L/refine6/out:$L/canon/out:$L/leaf2/out:$L/hcls/out:$L/hcls/out/ext:$HC/out
mkdir -p out/R22D out/log bridge/out/R22B
for c in "$@"; do
  ip=h$c; lg=out/log/ipcopy_$ip.txt; : > $lg
  while [ "$(awk '/MemAvailable/{print int($2/1048576)}' /proc/meminfo)" -lt 96 ]; do sleep 30; done
  python3 py/mkipcopy.py E1G $ip $HC/HCap HCap >> $lg 2>&1 || { echo "$ip FAIL mkipcopy"; continue; }
  t0=$(date +%s.%N)
  LEAN_PATH=$PWD/out:$T/../lib/lean nice -n $NI $T/lean -j1 -R $PWD/src -o out/R22D/E1G_$ip.olean -i out/R22D/E1G_$ip.ilean \
    src/R22D/E1G_$ip.lean >> $lg 2>&1 || { echo "$ip FAIL R22D (see $lg)"; continue; }
  t1=$(date +%s.%N)
  (cd bridge; LEAN_PATH=$PWD/out:$PWD/../out:$LPH nice -n $NI $T/lean -j1 -R $PWD -o out/R22B/E1G_$ip.olean R22B/E1G_$ip.lean) >> $lg 2>&1 \
    || { echo "$ip FAIL bridge (see $lg)"; continue; }
  t2=$(date +%s.%N)
  /usr/bin/grep -q -i 'error' $lg && { echo "$ip FAIL (error in $lg)"; continue; }
  for f in $HC/HCap/IP_$ip.lean $HC/HCap/SL_$ip.lean $HC/data/${ip}_g_gp.bin $HC/data/${ip}_g_sl.bin; do
    echo "$(md5sum $f | cut -c1-32) $f $(date -u +%FT%TZ)"; done >> ipcopy.md5
  ax=$(/usr/bin/grep -A3 'depends on axioms' $lg | tr -s ' \n' ' ' | cut -c1-160)
  printf '%s OK R22D %.0f s bridge %.0f s; %s\n' $ip "$(echo "$t1 - $t0" | bc)" "$(echo "$t2 - $t1" | bc)" "$ax"
done
