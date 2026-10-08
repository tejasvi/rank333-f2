module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6517 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6519 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6520 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6521 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6522 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6523 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6524 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6525 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6526 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG679 : glueChkR lits W 6517 11 = true := by
  rw [← glueChkRN_eq lits W 7747 6517 lenT]; decide +kernel
theorem okM679 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 1 = true := okB6517
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 2 = true := blkChk_join _ _ _ _ _ 6517 1 1 h0 okB6518
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 3 = true := blkChk_join _ _ _ _ _ 6517 2 1 h1 okB6519
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 4 = true := blkChk_join _ _ _ _ _ 6517 3 1 h2 okB6520
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 5 = true := blkChk_join _ _ _ _ _ 6517 4 1 h3 okB6521
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 6 = true := blkChk_join _ _ _ _ _ 6517 5 1 h4 okB6522
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 7 = true := blkChk_join _ _ _ _ _ 6517 6 1 h5 okB6523
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 8 = true := blkChk_join _ _ _ _ _ 6517 7 1 h6 okB6524
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 9 = true := blkChk_join _ _ _ _ _ 6517 8 1 h7 okB6525
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 10 = true := blkChk_join _ _ _ _ _ 6517 9 1 h8 okB6526
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6517 11 = true := blkChk_join _ _ _ _ _ 6517 10 1 h9 okB6527
  exact h10
end E1.C284X
