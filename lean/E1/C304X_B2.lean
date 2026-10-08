module
public import R22Port.U_d41d8cd98f00
public import E1.C304X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C304X
open E1S
theorem okB23 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 1 = true := by decide +kernel
theorem okB24 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 24 1 = true := by decide +kernel
theorem okB25 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 25 1 = true := by decide +kernel
theorem okB26 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 26 1 = true := by decide +kernel
theorem okB27 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 27 1 = true := by decide +kernel
theorem okB28 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 28 1 = true := by decide +kernel
theorem okB29 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 29 1 = true := by decide +kernel
theorem okB30 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 30 1 = true := by decide +kernel
theorem okG2 : glueChkR lits W 23 8 = true := by decide +kernel
theorem okM2 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 8 = true := by
  have h0 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 1 = true := okB23
  have h1 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 2 = true := blkChk_join _ _ _ _ _ 23 1 1 h0 okB24
  have h2 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 3 = true := blkChk_join _ _ _ _ _ 23 2 1 h1 okB25
  have h3 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 4 = true := blkChk_join _ _ _ _ _ 23 3 1 h2 okB26
  have h4 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 5 = true := blkChk_join _ _ _ _ _ 23 4 1 h3 okB27
  have h5 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 6 = true := blkChk_join _ _ _ _ _ 23 5 1 h4 okB28
  have h6 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 7 = true := blkChk_join _ _ _ _ _ 23 6 1 h5 okB29
  have h7 : blkChk E1.IP_e304.C E1.SL_e304.entry E1.IP_e304.UB E1.IP_e304.UBR lits 23 8 = true := blkChk_join _ _ _ _ _ 23 7 1 h6 okB30
  exact h7
end E1.C304X
