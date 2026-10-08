module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2521 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2522 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2523 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2524 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2525 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2526 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG274 : glueChkR lits W 2521 12 = true := by
  rw [← glueChkRN_eq lits W 7747 2521 lenT]; decide +kernel
theorem okM274 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 1 = true := okB2521
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 2 = true := blkChk_join _ _ _ _ _ 2521 1 1 h0 okB2522
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 3 = true := blkChk_join _ _ _ _ _ 2521 2 1 h1 okB2523
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 4 = true := blkChk_join _ _ _ _ _ 2521 3 1 h2 okB2524
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 5 = true := blkChk_join _ _ _ _ _ 2521 4 1 h3 okB2525
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 6 = true := blkChk_join _ _ _ _ _ 2521 5 1 h4 okB2526
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 7 = true := blkChk_join _ _ _ _ _ 2521 6 1 h5 okB2527
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 8 = true := blkChk_join _ _ _ _ _ 2521 7 1 h6 okB2528
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 9 = true := blkChk_join _ _ _ _ _ 2521 8 1 h7 okB2529
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 10 = true := blkChk_join _ _ _ _ _ 2521 9 1 h8 okB2530
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 11 = true := blkChk_join _ _ _ _ _ 2521 10 1 h9 okB2531
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2521 12 = true := blkChk_join _ _ _ _ _ 2521 11 1 h10 okB2532
  exact h11
end E1.C284X
