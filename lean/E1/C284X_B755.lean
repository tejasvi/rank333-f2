module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7485 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7486 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7487 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7488 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7489 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7491 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7492 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7493 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7494 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7494 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7495 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7495 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7496 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7496 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG755 : glueChkR lits W 7485 12 = true := by
  rw [← glueChkRN_eq lits W 7747 7485 lenT]; decide +kernel
theorem okM755 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 1 = true := okB7485
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 2 = true := blkChk_join _ _ _ _ _ 7485 1 1 h0 okB7486
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 3 = true := blkChk_join _ _ _ _ _ 7485 2 1 h1 okB7487
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 4 = true := blkChk_join _ _ _ _ _ 7485 3 1 h2 okB7488
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 5 = true := blkChk_join _ _ _ _ _ 7485 4 1 h3 okB7489
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 6 = true := blkChk_join _ _ _ _ _ 7485 5 1 h4 okB7490
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 7 = true := blkChk_join _ _ _ _ _ 7485 6 1 h5 okB7491
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 8 = true := blkChk_join _ _ _ _ _ 7485 7 1 h6 okB7492
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 9 = true := blkChk_join _ _ _ _ _ 7485 8 1 h7 okB7493
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 10 = true := blkChk_join _ _ _ _ _ 7485 9 1 h8 okB7494
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 11 = true := blkChk_join _ _ _ _ _ 7485 10 1 h9 okB7495
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7485 12 = true := blkChk_join _ _ _ _ _ 7485 11 1 h10 okB7496
  exact h11
end E1.C284X
