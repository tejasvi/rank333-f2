module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1342 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1343 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1343 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1344 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1344 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1345 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1345 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1346 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1346 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1347 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1347 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1348 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1348 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1349 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1349 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1350 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1350 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1351 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1351 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1352 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1353 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG124 : glueChkR lits W 1342 12 = true := by
  rw [← glueChkRN_eq lits W 8596 1342 lenT]; decide +kernel
theorem okM124 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 1 = true := okB1342
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 2 = true := blkChk_join _ _ _ _ _ 1342 1 1 h0 okB1343
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 3 = true := blkChk_join _ _ _ _ _ 1342 2 1 h1 okB1344
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 4 = true := blkChk_join _ _ _ _ _ 1342 3 1 h2 okB1345
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 5 = true := blkChk_join _ _ _ _ _ 1342 4 1 h3 okB1346
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 6 = true := blkChk_join _ _ _ _ _ 1342 5 1 h4 okB1347
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 7 = true := blkChk_join _ _ _ _ _ 1342 6 1 h5 okB1348
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 8 = true := blkChk_join _ _ _ _ _ 1342 7 1 h6 okB1349
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 9 = true := blkChk_join _ _ _ _ _ 1342 8 1 h7 okB1350
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 10 = true := blkChk_join _ _ _ _ _ 1342 9 1 h8 okB1351
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 11 = true := blkChk_join _ _ _ _ _ 1342 10 1 h9 okB1352
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1342 12 = true := blkChk_join _ _ _ _ _ 1342 11 1 h10 okB1353
  exact h11
end E1.C236X
