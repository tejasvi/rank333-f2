module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4519 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4520 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4521 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4522 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4523 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4524 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4525 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4526 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG479 : glueChkR lits W 4518 12 = true := by
  rw [← glueChkRN_eq lits W 7747 4518 lenT]; decide +kernel
theorem okM479 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 1 = true := okB4518
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 2 = true := blkChk_join _ _ _ _ _ 4518 1 1 h0 okB4519
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 3 = true := blkChk_join _ _ _ _ _ 4518 2 1 h1 okB4520
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 4 = true := blkChk_join _ _ _ _ _ 4518 3 1 h2 okB4521
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 5 = true := blkChk_join _ _ _ _ _ 4518 4 1 h3 okB4522
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 6 = true := blkChk_join _ _ _ _ _ 4518 5 1 h4 okB4523
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 7 = true := blkChk_join _ _ _ _ _ 4518 6 1 h5 okB4524
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 8 = true := blkChk_join _ _ _ _ _ 4518 7 1 h6 okB4525
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 9 = true := blkChk_join _ _ _ _ _ 4518 8 1 h7 okB4526
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 10 = true := blkChk_join _ _ _ _ _ 4518 9 1 h8 okB4527
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 11 = true := blkChk_join _ _ _ _ _ 4518 10 1 h9 okB4528
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4518 12 = true := blkChk_join _ _ _ _ _ 4518 11 1 h10 okB4529
  exact h11
end E1.C284X
