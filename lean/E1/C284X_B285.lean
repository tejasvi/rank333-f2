module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2630 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2631 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2631 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2632 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2632 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2633 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2633 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2634 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2634 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2635 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2635 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2636 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2636 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2637 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2637 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2638 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2638 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2639 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2639 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG285 : glueChkR lits W 2630 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2630 lenT]; decide +kernel
theorem okM285 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 1 = true := okB2630
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 2 = true := blkChk_join _ _ _ _ _ 2630 1 1 h0 okB2631
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 3 = true := blkChk_join _ _ _ _ _ 2630 2 1 h1 okB2632
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 4 = true := blkChk_join _ _ _ _ _ 2630 3 1 h2 okB2633
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 5 = true := blkChk_join _ _ _ _ _ 2630 4 1 h3 okB2634
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 6 = true := blkChk_join _ _ _ _ _ 2630 5 1 h4 okB2635
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 7 = true := blkChk_join _ _ _ _ _ 2630 6 1 h5 okB2636
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 8 = true := blkChk_join _ _ _ _ _ 2630 7 1 h6 okB2637
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 9 = true := blkChk_join _ _ _ _ _ 2630 8 1 h7 okB2638
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2630 10 = true := blkChk_join _ _ _ _ _ 2630 9 1 h8 okB2639
  exact h9
end E1.C284X
