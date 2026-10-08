module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3913 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3914 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3915 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3916 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3917 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3918 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3919 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG412 : glueChkR lits W 3913 7 = true := by
  rw [← glueChkRN_eq lits W 7747 3913 lenT]; decide +kernel
theorem okM412 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 1 = true := okB3913
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 2 = true := blkChk_join _ _ _ _ _ 3913 1 1 h0 okB3914
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 3 = true := blkChk_join _ _ _ _ _ 3913 2 1 h1 okB3915
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 4 = true := blkChk_join _ _ _ _ _ 3913 3 1 h2 okB3916
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 5 = true := blkChk_join _ _ _ _ _ 3913 4 1 h3 okB3917
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 6 = true := blkChk_join _ _ _ _ _ 3913 5 1 h4 okB3918
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3913 7 = true := blkChk_join _ _ _ _ _ 3913 6 1 h5 okB3919
  exact h6
end E1.C284X
