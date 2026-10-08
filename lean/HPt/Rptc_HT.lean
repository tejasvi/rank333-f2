module
public import R22Port.U_d41d8cd98f00
public import RT.Load
public import E1P.Hdr
public import HPt.IP_ptc
public import HPt.SL_ptc
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
/-! # The job header table of `Rptc`: 2352 jobs (frontier r22/lean/hpt/run/r4d/fr.txt), entry k = the header of job k's first block -/
#rttablew E1P.Rptc_HT "data/lean/f86063afdc79f6fbccbb49cc98e2bd2a/Rptc_HT.bin" 64 48
-- the glue witnesses: record `j` of top block `i` is glued to `Wf i j` (a later top block, or `|top| + k` for job `k`)
#rttablew E1P.Rptc_OF "data/lean/075ddcc91561beacdacdf0e3a8bf6c34/Rptc_OF.bin" 64 32
#rttablew E1P.Rptc_WT "data/lean/bb990b36c7254a4f62a648e0d504ad81/Rptc_WT.bin" 64 32
noncomputable def E1P.Rptc_Wf (i j : ℕ) : ℕ := E1P.Rptc_WT.entry (E1P.Rptc_OF.entry i + j)
