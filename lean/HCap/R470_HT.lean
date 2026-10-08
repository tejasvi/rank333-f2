module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h470
public import HCap.SL_h470
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R470`: 6305 jobs (frontier r22/lean/hcap/run/c470/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R470_HT "data/lean/185530ebb995a041be5387a01cae8bc6/R470_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R470_OF "data/lean/f1e045ae39f4cd3e8a9238c5ac2f2ce5/R470_OF.bin" 64 32
#rttablew E1G.R470_WT "data/lean/5994d0995ec652c69b8835aeca134849/R470_WT.bin" 64 32
noncomputable def E1G.R470_Wf (i j : ℕ) : ℕ := E1G.R470_WT.entry (E1G.R470_OF.entry i + j)
