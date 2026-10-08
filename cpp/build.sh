#!/bin/sh
# Build the certificate generators and the completion search into cpp/bin.  Needs g++ with C++17, OpenSSL (r3cat uses its
# MD5) and the HiGHS library (for example `pip install highspy`; set HIGHS_LIB to the directory holding libhighs.so.1).
# The run used -march=native on each machine type; data/RECIPE.txt records the binaries and their md5 sums.
set -e
cd "$(dirname "$0")"
HIGHS_LIB=${HIGHS_LIB:-$(python3 -c 'import highspy, os; print(os.path.dirname(highspy.__file__))')}
CXX=${CXX:-g++}
OPT="-O3 -march=native -std=c++17 -pthread"
HL="-L$HIGHS_LIB -l:libhighs.so.1 -Wl,-rpath,$HIGHS_LIB"
mkdir -p bin
$CXX $OPT -Iinclude -Isearch -Isearch/xp2 search/prof7R3.cc search/xp2/xpeel.cc search/xp2/xpeel2.cc -o bin/prof7R3 $HL
$CXX -O2 -std=c++17 search/r3cat.cc -o bin/r3cat -lcrypto
$CXX $OPT -Iinclude enum/lineenum9qe.cc -o bin/lineenum9qe $HL
$CXX $OPT enum/e1pconv.cc -o bin/e1pconv
$CXX $OPT enum/gen7c.cc -o bin/gen7c
$CXX $OPT tsolve/tsolve4.cc -o bin/tsolve4
$CXX $OPT tsolve/quotinstc.cc -o bin/quotinstc
