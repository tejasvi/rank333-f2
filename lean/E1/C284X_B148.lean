module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1346 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1347 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1347 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1348 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1348 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1349 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1349 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1350 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1350 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1351 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1351 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1352 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1353 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1354 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1354 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG148 : glueChkR lits W 1346 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1346 lenT]; decide +kernel
theorem okM148 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 1 = true := okB1346
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 2 = true := blkChk_join _ _ _ _ _ 1346 1 1 h0 okB1347
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 3 = true := blkChk_join _ _ _ _ _ 1346 2 1 h1 okB1348
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 4 = true := blkChk_join _ _ _ _ _ 1346 3 1 h2 okB1349
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 5 = true := blkChk_join _ _ _ _ _ 1346 4 1 h3 okB1350
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 6 = true := blkChk_join _ _ _ _ _ 1346 5 1 h4 okB1351
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 7 = true := blkChk_join _ _ _ _ _ 1346 6 1 h5 okB1352
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 8 = true := blkChk_join _ _ _ _ _ 1346 7 1 h6 okB1353
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1346 9 = true := blkChk_join _ _ _ _ _ 1346 8 1 h7 okB1354
  exact h8
end E1.C284X
