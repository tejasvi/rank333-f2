module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3580 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3581 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3581 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3582 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3582 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3583 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3583 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3584 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3584 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3585 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3585 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3586 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3586 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3587 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3587 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3588 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3588 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3589 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3589 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3590 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3590 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG379 : glueChkR lits W 3580 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3580 lenT]; decide +kernel
theorem okM379 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 1 = true := okB3580
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 2 = true := blkChk_join _ _ _ _ _ 3580 1 1 h0 okB3581
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 3 = true := blkChk_join _ _ _ _ _ 3580 2 1 h1 okB3582
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 4 = true := blkChk_join _ _ _ _ _ 3580 3 1 h2 okB3583
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 5 = true := blkChk_join _ _ _ _ _ 3580 4 1 h3 okB3584
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 6 = true := blkChk_join _ _ _ _ _ 3580 5 1 h4 okB3585
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 7 = true := blkChk_join _ _ _ _ _ 3580 6 1 h5 okB3586
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 8 = true := blkChk_join _ _ _ _ _ 3580 7 1 h6 okB3587
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 9 = true := blkChk_join _ _ _ _ _ 3580 8 1 h7 okB3588
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 10 = true := blkChk_join _ _ _ _ _ 3580 9 1 h8 okB3589
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3580 11 = true := blkChk_join _ _ _ _ _ 3580 10 1 h9 okB3590
  exact h10
end E1.C284X
