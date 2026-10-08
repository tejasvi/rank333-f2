module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1282 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1283 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1283 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1284 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1284 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1285 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1286 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1287 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1287 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1288 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1288 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1289 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1290 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1291 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG141 : glueChkR lits W 1282 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1282 lenT]; decide +kernel
theorem okM141 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 1 = true := okB1282
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 2 = true := blkChk_join _ _ _ _ _ 1282 1 1 h0 okB1283
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 3 = true := blkChk_join _ _ _ _ _ 1282 2 1 h1 okB1284
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 4 = true := blkChk_join _ _ _ _ _ 1282 3 1 h2 okB1285
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 5 = true := blkChk_join _ _ _ _ _ 1282 4 1 h3 okB1286
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 6 = true := blkChk_join _ _ _ _ _ 1282 5 1 h4 okB1287
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 7 = true := blkChk_join _ _ _ _ _ 1282 6 1 h5 okB1288
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 8 = true := blkChk_join _ _ _ _ _ 1282 7 1 h6 okB1289
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 9 = true := blkChk_join _ _ _ _ _ 1282 8 1 h7 okB1290
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1282 10 = true := blkChk_join _ _ _ _ _ 1282 9 1 h8 okB1291
  exact h9
end E1.C284X
