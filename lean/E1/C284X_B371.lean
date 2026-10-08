module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3492 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3493 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3494 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3494 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3495 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3495 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3496 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3496 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3497 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3498 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3499 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3500 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3501 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3502 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG371 : glueChkR lits W 3492 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3492 lenT]; decide +kernel
theorem okM371 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 1 = true := okB3492
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 2 = true := blkChk_join _ _ _ _ _ 3492 1 1 h0 okB3493
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 3 = true := blkChk_join _ _ _ _ _ 3492 2 1 h1 okB3494
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 4 = true := blkChk_join _ _ _ _ _ 3492 3 1 h2 okB3495
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 5 = true := blkChk_join _ _ _ _ _ 3492 4 1 h3 okB3496
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 6 = true := blkChk_join _ _ _ _ _ 3492 5 1 h4 okB3497
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 7 = true := blkChk_join _ _ _ _ _ 3492 6 1 h5 okB3498
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 8 = true := blkChk_join _ _ _ _ _ 3492 7 1 h6 okB3499
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 9 = true := blkChk_join _ _ _ _ _ 3492 8 1 h7 okB3500
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 10 = true := blkChk_join _ _ _ _ _ 3492 9 1 h8 okB3501
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3492 11 = true := blkChk_join _ _ _ _ _ 3492 10 1 h9 okB3502
  exact h10
end E1.C284X
