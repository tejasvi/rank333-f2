module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1318 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1319 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1319 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1320 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1320 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1321 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1321 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1322 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1322 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1323 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1323 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1324 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1324 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1325 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1325 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG145 : glueChkR lits W 1318 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1318 lenT]; decide +kernel
theorem okM145 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 1 = true := okB1318
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 2 = true := blkChk_join _ _ _ _ _ 1318 1 1 h0 okB1319
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 3 = true := blkChk_join _ _ _ _ _ 1318 2 1 h1 okB1320
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 4 = true := blkChk_join _ _ _ _ _ 1318 3 1 h2 okB1321
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 5 = true := blkChk_join _ _ _ _ _ 1318 4 1 h3 okB1322
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 6 = true := blkChk_join _ _ _ _ _ 1318 5 1 h4 okB1323
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 7 = true := blkChk_join _ _ _ _ _ 1318 6 1 h5 okB1324
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1318 8 = true := blkChk_join _ _ _ _ _ 1318 7 1 h6 okB1325
  exact h7
end E1.C284X
