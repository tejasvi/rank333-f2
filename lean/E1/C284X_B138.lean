module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1253 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1254 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1254 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1255 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1255 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1256 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1256 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1257 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1257 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1258 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1258 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1259 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1259 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1260 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1260 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG138 : glueChkR lits W 1253 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1253 lenT]; decide +kernel
theorem okM138 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 1 = true := okB1253
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 2 = true := blkChk_join _ _ _ _ _ 1253 1 1 h0 okB1254
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 3 = true := blkChk_join _ _ _ _ _ 1253 2 1 h1 okB1255
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 4 = true := blkChk_join _ _ _ _ _ 1253 3 1 h2 okB1256
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 5 = true := blkChk_join _ _ _ _ _ 1253 4 1 h3 okB1257
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 6 = true := blkChk_join _ _ _ _ _ 1253 5 1 h4 okB1258
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 7 = true := blkChk_join _ _ _ _ _ 1253 6 1 h5 okB1259
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1253 8 = true := blkChk_join _ _ _ _ _ 1253 7 1 h6 okB1260
  exact h7
end E1.C284X
