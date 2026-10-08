module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB447 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB448 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 448 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB449 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 449 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB450 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 450 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB451 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 451 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB452 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 452 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB453 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 453 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB454 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 454 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG51 : glueChkR lits W 447 8 = true := by
  rw [← glueChkRN_eq lits W 7747 447 lenT]; decide +kernel
theorem okM51 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 1 = true := okB447
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 2 = true := blkChk_join _ _ _ _ _ 447 1 1 h0 okB448
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 3 = true := blkChk_join _ _ _ _ _ 447 2 1 h1 okB449
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 4 = true := blkChk_join _ _ _ _ _ 447 3 1 h2 okB450
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 5 = true := blkChk_join _ _ _ _ _ 447 4 1 h3 okB451
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 6 = true := blkChk_join _ _ _ _ _ 447 5 1 h4 okB452
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 7 = true := blkChk_join _ _ _ _ _ 447 6 1 h5 okB453
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 447 8 = true := blkChk_join _ _ _ _ _ 447 7 1 h6 okB454
  exact h7
end E1.C284X
