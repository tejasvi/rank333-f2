module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB490 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB491 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB492 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB493 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB494 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 494 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB495 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 495 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB496 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 496 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB497 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB498 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG56 : glueChkR lits W 490 9 = true := by
  rw [← glueChkRN_eq lits W 7747 490 lenT]; decide +kernel
theorem okM56 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 1 = true := okB490
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 2 = true := blkChk_join _ _ _ _ _ 490 1 1 h0 okB491
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 3 = true := blkChk_join _ _ _ _ _ 490 2 1 h1 okB492
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 4 = true := blkChk_join _ _ _ _ _ 490 3 1 h2 okB493
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 5 = true := blkChk_join _ _ _ _ _ 490 4 1 h3 okB494
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 6 = true := blkChk_join _ _ _ _ _ 490 5 1 h4 okB495
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 7 = true := blkChk_join _ _ _ _ _ 490 6 1 h5 okB496
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 8 = true := blkChk_join _ _ _ _ _ 490 7 1 h6 okB497
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 490 9 = true := blkChk_join _ _ _ _ _ 490 8 1 h7 okB498
  exact h8
end E1.C284X
