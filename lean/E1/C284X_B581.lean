module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5481 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5482 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5482 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5483 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5483 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5484 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5484 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5485 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5486 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5487 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5488 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5489 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5491 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5492 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5493 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG581 : glueChkR lits W 5481 13 = true := by
  rw [← glueChkRN_eq lits W 7747 5481 lenT]; decide +kernel
theorem okM581 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 1 = true := okB5481
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 2 = true := blkChk_join _ _ _ _ _ 5481 1 1 h0 okB5482
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 3 = true := blkChk_join _ _ _ _ _ 5481 2 1 h1 okB5483
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 4 = true := blkChk_join _ _ _ _ _ 5481 3 1 h2 okB5484
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 5 = true := blkChk_join _ _ _ _ _ 5481 4 1 h3 okB5485
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 6 = true := blkChk_join _ _ _ _ _ 5481 5 1 h4 okB5486
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 7 = true := blkChk_join _ _ _ _ _ 5481 6 1 h5 okB5487
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 8 = true := blkChk_join _ _ _ _ _ 5481 7 1 h6 okB5488
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 9 = true := blkChk_join _ _ _ _ _ 5481 8 1 h7 okB5489
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 10 = true := blkChk_join _ _ _ _ _ 5481 9 1 h8 okB5490
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 11 = true := blkChk_join _ _ _ _ _ 5481 10 1 h9 okB5491
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 12 = true := blkChk_join _ _ _ _ _ 5481 11 1 h10 okB5492
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5481 13 = true := blkChk_join _ _ _ _ _ 5481 12 1 h11 okB5493
  exact h12
end E1.C284X
