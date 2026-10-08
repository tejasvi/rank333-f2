module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB515 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB516 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB517 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 517 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB519 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB520 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB521 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG59 : glueChkR lits W 515 7 = true := by
  rw [← glueChkRN_eq lits W 7747 515 lenT]; decide +kernel
theorem okM59 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 1 = true := okB515
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 2 = true := blkChk_join _ _ _ _ _ 515 1 1 h0 okB516
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 3 = true := blkChk_join _ _ _ _ _ 515 2 1 h1 okB517
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 4 = true := blkChk_join _ _ _ _ _ 515 3 1 h2 okB518
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 5 = true := blkChk_join _ _ _ _ _ 515 4 1 h3 okB519
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 6 = true := blkChk_join _ _ _ _ _ 515 5 1 h4 okB520
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 515 7 = true := blkChk_join _ _ _ _ _ 515 6 1 h5 okB521
  exact h6
end E1.C284X
