module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h420
public import HCap.SL_h420
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R420`: 903 jobs (frontier r22/lean/hcap/run/c420/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R420_HT "data/lean/08107e43cfb23882ba3e421954fb76ac/R420_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R420_OF "data/lean/2752cc89576dfe9c80bf1f87fc79b645/R420_OF.bin" 64 32
#rttablew E1G.R420_WT "data/lean/b3ef213a3f0825422f9ad5b5c5f1deca/R420_WT.bin" 64 32
noncomputable def E1G.R420_Wf (i j : ℕ) : ℕ := E1G.R420_WT.entry (E1G.R420_OF.entry i + j)
