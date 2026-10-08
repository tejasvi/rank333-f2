module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB626 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB627 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 627 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB628 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 628 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB629 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 629 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB630 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 630 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB631 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 631 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB632 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 632 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB633 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 633 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB634 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 634 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG70 : glueChkR lits W 626 9 = true := by
  rw [← glueChkRN_eq lits W 7747 626 lenT]; decide +kernel
theorem okM70 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 1 = true := okB626
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 2 = true := blkChk_join _ _ _ _ _ 626 1 1 h0 okB627
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 3 = true := blkChk_join _ _ _ _ _ 626 2 1 h1 okB628
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 4 = true := blkChk_join _ _ _ _ _ 626 3 1 h2 okB629
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 5 = true := blkChk_join _ _ _ _ _ 626 4 1 h3 okB630
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 6 = true := blkChk_join _ _ _ _ _ 626 5 1 h4 okB631
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 7 = true := blkChk_join _ _ _ _ _ 626 6 1 h5 okB632
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 8 = true := blkChk_join _ _ _ _ _ 626 7 1 h6 okB633
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 626 9 = true := blkChk_join _ _ _ _ _ 626 8 1 h7 okB634
  exact h8
end E1.C284X
