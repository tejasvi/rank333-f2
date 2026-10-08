module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1212 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1213 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1213 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1214 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1214 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1215 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1216 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1217 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1218 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1219 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG133 : glueChkR lits W 1212 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1212 lenT]; decide +kernel
theorem okM133 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 1 = true := okB1212
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 2 = true := blkChk_join _ _ _ _ _ 1212 1 1 h0 okB1213
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 3 = true := blkChk_join _ _ _ _ _ 1212 2 1 h1 okB1214
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 4 = true := blkChk_join _ _ _ _ _ 1212 3 1 h2 okB1215
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 5 = true := blkChk_join _ _ _ _ _ 1212 4 1 h3 okB1216
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 6 = true := blkChk_join _ _ _ _ _ 1212 5 1 h4 okB1217
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 7 = true := blkChk_join _ _ _ _ _ 1212 6 1 h5 okB1218
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1212 8 = true := blkChk_join _ _ _ _ _ 1212 7 1 h6 okB1219
  exact h7
end E1.C284X
