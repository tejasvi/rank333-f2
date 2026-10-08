#!/bin/sh
# Download data/lean, the data files that the Lean loaders read at elaboration time, from the Zenodo record, unpack it and
# check every file against data/lean/INDEX.tsv.  Needs curl, zstd, tar and sha256sum.
set -e
cd "$(dirname "$0")/.."
A=rank333-f2-v1.0-data-lean.tar.zst
[ -f "$A" ] || curl -L --fail -o "$A" "https://zenodo.org/records/23236154/files/$A?download=1"
echo "7d947e095974b2e66d77f1d37814fc106caa5f7a984579b3919880856f036ba1  $A" | sha256sum -c -
tar -I zstd -xf "$A"
tail -n +2 data/lean/INDEX.tsv | awk -F'\t' '{print $3"  "$1}' | sha256sum -c --quiet -
echo "data/lean: all files present and correct"
