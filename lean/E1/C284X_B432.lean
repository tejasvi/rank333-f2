module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4073 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4074 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4074 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4075 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4075 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4076 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4077 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4078 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4079 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4080 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4081 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG432 : glueChkR lits W 4073 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4073 lenT]; decide +kernel
theorem okM432 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 1 = true := okB4073
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 2 = true := blkChk_join _ _ _ _ _ 4073 1 1 h0 okB4074
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 3 = true := blkChk_join _ _ _ _ _ 4073 2 1 h1 okB4075
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 4 = true := blkChk_join _ _ _ _ _ 4073 3 1 h2 okB4076
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 5 = true := blkChk_join _ _ _ _ _ 4073 4 1 h3 okB4077
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 6 = true := blkChk_join _ _ _ _ _ 4073 5 1 h4 okB4078
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 7 = true := blkChk_join _ _ _ _ _ 4073 6 1 h5 okB4079
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 8 = true := blkChk_join _ _ _ _ _ 4073 7 1 h6 okB4080
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4073 9 = true := blkChk_join _ _ _ _ _ 4073 8 1 h7 okB4081
  exact h8
end E1.C284X
