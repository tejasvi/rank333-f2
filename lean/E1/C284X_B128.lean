module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1178 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1179 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1179 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1180 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1180 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1181 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1181 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1182 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1182 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1183 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1183 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG128 : glueChkR lits W 1178 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1178 lenT]; decide +kernel
theorem okM128 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 1 = true := okB1178
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 2 = true := blkChk_join _ _ _ _ _ 1178 1 1 h0 okB1179
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 3 = true := blkChk_join _ _ _ _ _ 1178 2 1 h1 okB1180
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 4 = true := blkChk_join _ _ _ _ _ 1178 3 1 h2 okB1181
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 5 = true := blkChk_join _ _ _ _ _ 1178 4 1 h3 okB1182
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1178 6 = true := blkChk_join _ _ _ _ _ 1178 5 1 h4 okB1183
  exact h5
end E1.C284X
