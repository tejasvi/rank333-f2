module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3481 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3482 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3482 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3483 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3483 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3484 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3484 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3485 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3486 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3487 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3488 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3489 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3491 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG370 : glueChkR lits W 3481 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3481 lenT]; decide +kernel
theorem okM370 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 1 = true := okB3481
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 2 = true := blkChk_join _ _ _ _ _ 3481 1 1 h0 okB3482
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 3 = true := blkChk_join _ _ _ _ _ 3481 2 1 h1 okB3483
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 4 = true := blkChk_join _ _ _ _ _ 3481 3 1 h2 okB3484
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 5 = true := blkChk_join _ _ _ _ _ 3481 4 1 h3 okB3485
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 6 = true := blkChk_join _ _ _ _ _ 3481 5 1 h4 okB3486
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 7 = true := blkChk_join _ _ _ _ _ 3481 6 1 h5 okB3487
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 8 = true := blkChk_join _ _ _ _ _ 3481 7 1 h6 okB3488
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 9 = true := blkChk_join _ _ _ _ _ 3481 8 1 h7 okB3489
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 10 = true := blkChk_join _ _ _ _ _ 3481 9 1 h8 okB3490
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3481 11 = true := blkChk_join _ _ _ _ _ 3481 10 1 h9 okB3491
  exact h10
end E1.C284X
