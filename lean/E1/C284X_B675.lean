module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6479 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6480 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6480 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6481 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6481 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6482 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6482 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6483 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6483 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6484 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6484 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6485 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6486 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6487 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6488 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6489 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG675 : glueChkR lits W 6479 11 = true := by
  rw [← glueChkRN_eq lits W 7747 6479 lenT]; decide +kernel
theorem okM675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 1 = true := okB6479
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 2 = true := blkChk_join _ _ _ _ _ 6479 1 1 h0 okB6480
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 3 = true := blkChk_join _ _ _ _ _ 6479 2 1 h1 okB6481
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 4 = true := blkChk_join _ _ _ _ _ 6479 3 1 h2 okB6482
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 5 = true := blkChk_join _ _ _ _ _ 6479 4 1 h3 okB6483
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 6 = true := blkChk_join _ _ _ _ _ 6479 5 1 h4 okB6484
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 7 = true := blkChk_join _ _ _ _ _ 6479 6 1 h5 okB6485
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 8 = true := blkChk_join _ _ _ _ _ 6479 7 1 h6 okB6486
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 9 = true := blkChk_join _ _ _ _ _ 6479 8 1 h7 okB6487
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 10 = true := blkChk_join _ _ _ _ _ 6479 9 1 h8 okB6488
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6479 11 = true := blkChk_join _ _ _ _ _ 6479 10 1 h9 okB6489
  exact h10
end E1.C284X
