module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2505 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2506 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2506 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2507 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2507 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2508 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2508 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2509 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2509 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2510 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2510 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2511 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2511 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2512 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2512 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2513 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2513 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2514 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2514 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2515 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2516 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2517 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2517 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2518 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2519 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2520 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG273 : glueChkR lits W 2505 16 = true := by
  rw [← glueChkRN_eq lits W 7747 2505 lenT]; decide +kernel
theorem okM273 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 1 = true := okB2505
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 2 = true := blkChk_join _ _ _ _ _ 2505 1 1 h0 okB2506
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 3 = true := blkChk_join _ _ _ _ _ 2505 2 1 h1 okB2507
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 4 = true := blkChk_join _ _ _ _ _ 2505 3 1 h2 okB2508
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 5 = true := blkChk_join _ _ _ _ _ 2505 4 1 h3 okB2509
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 6 = true := blkChk_join _ _ _ _ _ 2505 5 1 h4 okB2510
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 7 = true := blkChk_join _ _ _ _ _ 2505 6 1 h5 okB2511
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 8 = true := blkChk_join _ _ _ _ _ 2505 7 1 h6 okB2512
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 9 = true := blkChk_join _ _ _ _ _ 2505 8 1 h7 okB2513
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 10 = true := blkChk_join _ _ _ _ _ 2505 9 1 h8 okB2514
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 11 = true := blkChk_join _ _ _ _ _ 2505 10 1 h9 okB2515
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 12 = true := blkChk_join _ _ _ _ _ 2505 11 1 h10 okB2516
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 13 = true := blkChk_join _ _ _ _ _ 2505 12 1 h11 okB2517
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 14 = true := blkChk_join _ _ _ _ _ 2505 13 1 h12 okB2518
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 15 = true := blkChk_join _ _ _ _ _ 2505 14 1 h13 okB2519
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2505 16 = true := blkChk_join _ _ _ _ _ 2505 15 1 h14 okB2520
  exact h15
end E1.C284X
