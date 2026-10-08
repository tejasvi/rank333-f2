module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3609 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3610 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3610 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3611 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3611 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3612 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3612 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3613 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3613 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3614 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3614 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3615 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3615 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3616 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3616 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3617 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3617 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG382 : glueChkR lits W 3609 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3609 lenT]; decide +kernel
theorem okM382 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 1 = true := okB3609
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 2 = true := blkChk_join _ _ _ _ _ 3609 1 1 h0 okB3610
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 3 = true := blkChk_join _ _ _ _ _ 3609 2 1 h1 okB3611
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 4 = true := blkChk_join _ _ _ _ _ 3609 3 1 h2 okB3612
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 5 = true := blkChk_join _ _ _ _ _ 3609 4 1 h3 okB3613
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 6 = true := blkChk_join _ _ _ _ _ 3609 5 1 h4 okB3614
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 7 = true := blkChk_join _ _ _ _ _ 3609 6 1 h5 okB3615
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 8 = true := blkChk_join _ _ _ _ _ 3609 7 1 h6 okB3616
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3609 9 = true := blkChk_join _ _ _ _ _ 3609 8 1 h7 okB3617
  exact h8
end E1.C284X
