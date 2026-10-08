module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2605 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2606 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2606 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2607 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2607 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2608 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2608 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2609 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2609 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2610 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2610 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG282 : glueChkR lits W 2605 6 = true := by
  rw [← glueChkRN_eq lits W 7747 2605 lenT]; decide +kernel
theorem okM282 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 1 = true := okB2605
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 2 = true := blkChk_join _ _ _ _ _ 2605 1 1 h0 okB2606
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 3 = true := blkChk_join _ _ _ _ _ 2605 2 1 h1 okB2607
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 4 = true := blkChk_join _ _ _ _ _ 2605 3 1 h2 okB2608
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 5 = true := blkChk_join _ _ _ _ _ 2605 4 1 h3 okB2609
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2605 6 = true := blkChk_join _ _ _ _ _ 2605 5 1 h4 okB2610
  exact h5
end E1.C284X
