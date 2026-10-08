#!/bin/bash
# endcheck.sh M.txt N.txt LEANPATH: the one external step of form (B): the statement and its direct constants' modules agree, and
# each such module resolves to the same olean file (sha256) on LEANPATH.
set -e
cmp "$1" "$2" || { echo "MISMATCH"; exit 1; }
for m in $(tail -n +2 "$1" | awk '{print $2}' | sort -u); do
  rel=$(echo $m | tr . /).olean; f=""
  for d in $(echo "$3" | tr ':' ' '); do [ -f "$d/$rel" ] && { f=$d/$rel; break; }; done
  echo "$m $(sha256sum "$f" | cut -c1-16) $f"
done
echo "END CHECK OK"
