module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3832 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3833 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3833 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3834 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3834 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3835 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3835 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3836 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3836 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3837 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3837 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3838 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3838 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3839 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3839 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3840 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3840 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG402 : glueChkR lits W 3832 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3832 lenT]; decide +kernel
theorem okM402 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 1 = true := okB3832
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 2 = true := blkChk_join _ _ _ _ _ 3832 1 1 h0 okB3833
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 3 = true := blkChk_join _ _ _ _ _ 3832 2 1 h1 okB3834
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 4 = true := blkChk_join _ _ _ _ _ 3832 3 1 h2 okB3835
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 5 = true := blkChk_join _ _ _ _ _ 3832 4 1 h3 okB3836
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 6 = true := blkChk_join _ _ _ _ _ 3832 5 1 h4 okB3837
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 7 = true := blkChk_join _ _ _ _ _ 3832 6 1 h5 okB3838
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 8 = true := blkChk_join _ _ _ _ _ 3832 7 1 h6 okB3839
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3832 9 = true := blkChk_join _ _ _ _ _ 3832 8 1 h7 okB3840
  exact h8
end E1.C284X
