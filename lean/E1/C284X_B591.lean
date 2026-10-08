module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5588 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5589 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5589 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5590 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5590 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5591 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5591 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5592 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5592 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5593 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5593 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5594 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5594 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5595 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5595 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5596 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5596 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG591 : glueChkR lits W 5588 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5588 lenT]; decide +kernel
theorem okM591 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 1 = true := okB5588
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 2 = true := blkChk_join _ _ _ _ _ 5588 1 1 h0 okB5589
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 3 = true := blkChk_join _ _ _ _ _ 5588 2 1 h1 okB5590
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 4 = true := blkChk_join _ _ _ _ _ 5588 3 1 h2 okB5591
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 5 = true := blkChk_join _ _ _ _ _ 5588 4 1 h3 okB5592
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 6 = true := blkChk_join _ _ _ _ _ 5588 5 1 h4 okB5593
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 7 = true := blkChk_join _ _ _ _ _ 5588 6 1 h5 okB5594
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 8 = true := blkChk_join _ _ _ _ _ 5588 7 1 h6 okB5595
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5588 9 = true := blkChk_join _ _ _ _ _ 5588 8 1 h7 okB5596
  exact h8
end E1.C284X
