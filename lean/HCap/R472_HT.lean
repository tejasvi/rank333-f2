module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h472
public import HCap.SL_h472
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R472`: 5688 jobs (frontier r22/lean/hcap/run/c472/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R472_HT "data/lean/445b8d919791c434be9a471c132f478c/R472_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R472_OF "data/lean/4556f7e3cfe934f3f9c9bc6c06fe14fb/R472_OF.bin" 64 32
#rttablew E1G.R472_WT "data/lean/872aa32a7e2fdc4a4ca9f924317be13c/R472_WT.bin" 64 32
noncomputable def E1G.R472_Wf (i j : ℕ) : ℕ := E1G.R472_WT.entry (E1G.R472_OF.entry i + j)
