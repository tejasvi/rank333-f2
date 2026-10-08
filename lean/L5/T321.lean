module
public import R22Port.U_d41d8cd98f00
public import L5.T321Load
/-! # L1's static tables for `--rord 321` (G5): namespace `L1.T321`

* `L1.T321.c2t_<l>`, `L1.T321.CONF1T`: the cap-2 exclusion tables and the cap-1 conflict table of the kept rows of table C3eD
  in 321 labels, from `data/tables/C3eD_321.c2t` (md5 d1b228243969408fd0dfabc8e775f9d6, sha256 ce58f10147b5bbb3…;
  exact relabeling of `rt/C3eD.c2t`).  Their meaning (`C2OK`, `Conf1OK`) comes from `bindQ` at `L5O.rowE321`
  (`L5O.bindQ_spec`).
* `L1.T321.h_<l>`, `L1.T321.suf_<l>`: hyperplane hit vectors and suffix counts, from `rt321/hyp7_321.bin`
  (md5 057c18088377951db54aaf82089d3d6e; `mkhyp321.py`, cross-checked in leaf2 against `rt/lab321vec.json`).  `HOK` for the
  hit vectors: `L5/T321H.lean`. -/
@[expose] public section
#l1tablesNS L1.T321 "data/lean/d1b228243969408fd0dfabc8e775f9d6/C3eD_321.c2t"
#l1hypNS L1.T321 "data/lean/057c18088377951db54aaf82089d3d6e/hyp7_321.bin"
