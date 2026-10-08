module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h487
public import HCap.SL_h487
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R487`: 37363 jobs (frontier r22/lean/hcap/run/c487/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R487_HT "data/lean/f5796e6c569245ec240845eafe7f4f2f/R487_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R487_OF "data/lean/eb761e9a9f2bf07acafe71f0c4e6cb4e/R487_OF.bin" 64 32
#rttablew E1G.R487_WT "data/lean/4b310cbc44bd295b8dff9d5831c96a6f/R487_WT.bin" 64 32
noncomputable def E1G.R487_Wf (i j : ℕ) : ℕ := E1G.R487_WT.entry (E1G.R487_OF.entry i + j)
