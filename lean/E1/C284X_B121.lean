module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1119 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1120 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1120 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1121 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1121 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1122 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1122 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1123 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1123 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1124 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1124 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1125 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1125 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG121 : glueChkR lits W 1119 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1119 lenT]; decide +kernel
theorem okM121 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 1 = true := okB1119
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 2 = true := blkChk_join _ _ _ _ _ 1119 1 1 h0 okB1120
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 3 = true := blkChk_join _ _ _ _ _ 1119 2 1 h1 okB1121
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 4 = true := blkChk_join _ _ _ _ _ 1119 3 1 h2 okB1122
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 5 = true := blkChk_join _ _ _ _ _ 1119 4 1 h3 okB1123
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 6 = true := blkChk_join _ _ _ _ _ 1119 5 1 h4 okB1124
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1119 7 = true := blkChk_join _ _ _ _ _ 1119 6 1 h5 okB1125
  exact h6
end E1.C284X
