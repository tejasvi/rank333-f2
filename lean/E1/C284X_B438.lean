module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4120 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4121 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4121 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4122 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4122 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4123 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4123 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4124 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4124 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4125 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4125 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4126 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4126 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4127 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4127 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4128 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4128 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG438 : glueChkR lits W 4120 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4120 lenT]; decide +kernel
theorem okM438 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 1 = true := okB4120
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 2 = true := blkChk_join _ _ _ _ _ 4120 1 1 h0 okB4121
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 3 = true := blkChk_join _ _ _ _ _ 4120 2 1 h1 okB4122
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 4 = true := blkChk_join _ _ _ _ _ 4120 3 1 h2 okB4123
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 5 = true := blkChk_join _ _ _ _ _ 4120 4 1 h3 okB4124
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 6 = true := blkChk_join _ _ _ _ _ 4120 5 1 h4 okB4125
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 7 = true := blkChk_join _ _ _ _ _ 4120 6 1 h5 okB4126
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 8 = true := blkChk_join _ _ _ _ _ 4120 7 1 h6 okB4127
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4120 9 = true := blkChk_join _ _ _ _ _ 4120 8 1 h7 okB4128
  exact h8
end E1.C284X
