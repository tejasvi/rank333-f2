module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5522 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5523 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5524 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5525 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5526 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG585 : glueChkR lits W 5522 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5522 lenT]; decide +kernel
theorem okM585 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 1 = true := okB5522
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 2 = true := blkChk_join _ _ _ _ _ 5522 1 1 h0 okB5523
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 3 = true := blkChk_join _ _ _ _ _ 5522 2 1 h1 okB5524
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 4 = true := blkChk_join _ _ _ _ _ 5522 3 1 h2 okB5525
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 5 = true := blkChk_join _ _ _ _ _ 5522 4 1 h3 okB5526
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 6 = true := blkChk_join _ _ _ _ _ 5522 5 1 h4 okB5527
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 7 = true := blkChk_join _ _ _ _ _ 5522 6 1 h5 okB5528
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 8 = true := blkChk_join _ _ _ _ _ 5522 7 1 h6 okB5529
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 9 = true := blkChk_join _ _ _ _ _ 5522 8 1 h7 okB5530
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 10 = true := blkChk_join _ _ _ _ _ 5522 9 1 h8 okB5531
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5522 11 = true := blkChk_join _ _ _ _ _ 5522 10 1 h9 okB5532
  exact h10
end E1.C284X
