module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1G.Hdr
public import HCap.IP_h455
public import HCap.SL_h455
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `R455`: 17254 jobs (frontier r22/lean/hcap/run/c455/root5/fr.txt), entry k = the header of job k's first block -/
#rttablew E1G.R455_HT "data/lean/66ecfa330a818898096babe92c4d2298/R455_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1G.R455_OF "data/lean/b0f37249052570812d802389c6b1f667/R455_OF.bin" 64 32
#rttablew E1G.R455_WT "data/lean/986f78f41d2e666e2771088a65dce156/R455_WT.bin" 64 32
noncomputable def E1G.R455_Wf (i j : ℕ) : ℕ := E1G.R455_WT.entry (E1G.R455_OF.entry i + j)
