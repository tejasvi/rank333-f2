module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2481 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2482 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2482 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2483 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2483 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2484 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2484 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2485 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2485 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2486 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2486 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2487 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2487 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2488 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2488 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2489 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2491 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2492 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2493 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2494 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2494 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2495 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2495 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2496 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2496 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG271 : glueChkR lits W 2481 16 = true := by
  rw [← glueChkRN_eq lits W 7747 2481 lenT]; decide +kernel
theorem okM271 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 1 = true := okB2481
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 2 = true := blkChk_join _ _ _ _ _ 2481 1 1 h0 okB2482
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 3 = true := blkChk_join _ _ _ _ _ 2481 2 1 h1 okB2483
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 4 = true := blkChk_join _ _ _ _ _ 2481 3 1 h2 okB2484
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 5 = true := blkChk_join _ _ _ _ _ 2481 4 1 h3 okB2485
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 6 = true := blkChk_join _ _ _ _ _ 2481 5 1 h4 okB2486
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 7 = true := blkChk_join _ _ _ _ _ 2481 6 1 h5 okB2487
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 8 = true := blkChk_join _ _ _ _ _ 2481 7 1 h6 okB2488
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 9 = true := blkChk_join _ _ _ _ _ 2481 8 1 h7 okB2489
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 10 = true := blkChk_join _ _ _ _ _ 2481 9 1 h8 okB2490
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 11 = true := blkChk_join _ _ _ _ _ 2481 10 1 h9 okB2491
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 12 = true := blkChk_join _ _ _ _ _ 2481 11 1 h10 okB2492
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 13 = true := blkChk_join _ _ _ _ _ 2481 12 1 h11 okB2493
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 14 = true := blkChk_join _ _ _ _ _ 2481 13 1 h12 okB2494
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 15 = true := blkChk_join _ _ _ _ _ 2481 14 1 h13 okB2495
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2481 16 = true := blkChk_join _ _ _ _ _ 2481 15 1 h14 okB2496
  exact h15
end E1.C284X
