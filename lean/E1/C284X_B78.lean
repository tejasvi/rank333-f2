module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB712 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB713 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB714 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB715 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB716 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 716 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB717 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 717 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB718 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 718 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB719 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 719 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB720 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 720 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG78 : glueChkR lits W 712 9 = true := by
  rw [← glueChkRN_eq lits W 7747 712 lenT]; decide +kernel
theorem okM78 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 1 = true := okB712
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 2 = true := blkChk_join _ _ _ _ _ 712 1 1 h0 okB713
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 3 = true := blkChk_join _ _ _ _ _ 712 2 1 h1 okB714
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 4 = true := blkChk_join _ _ _ _ _ 712 3 1 h2 okB715
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 5 = true := blkChk_join _ _ _ _ _ 712 4 1 h3 okB716
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 6 = true := blkChk_join _ _ _ _ _ 712 5 1 h4 okB717
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 7 = true := blkChk_join _ _ _ _ _ 712 6 1 h5 okB718
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 8 = true := blkChk_join _ _ _ _ _ 712 7 1 h6 okB719
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 712 9 = true := blkChk_join _ _ _ _ _ 712 8 1 h7 okB720
  exact h8
end E1.C284X
