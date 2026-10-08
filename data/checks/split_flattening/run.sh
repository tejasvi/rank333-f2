#!/bin/sh
# The excess system (4.2) of Section 4 and its analogues for the second and third factors, on the six known decompositions of
# length 23 in data/checks/decompositions23.txt: test_gst.py checks the 13 sides with Delta = 1, test_gst2.py all 18 sides
# (Delta = 1, 2 or 3). Needs Python 3 with numpy. Outputs of the run for the paper: out/.
set -e
cd "$(dirname "$0")/../../.."
PYTHONPATH=data/checks/split_flattening python3 data/checks/split_flattening/test_gst.py
PYTHONPATH=data/checks/split_flattening python3 data/checks/split_flattening/test_gst2.py
