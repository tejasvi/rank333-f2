module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1432 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1433 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1433 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1434 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1434 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1435 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1435 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1436 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1436 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1437 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1437 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1438 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1438 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1439 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1439 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1440 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1440 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG157 : glueChkR lits W 1432 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1432 lenT]; decide +kernel
theorem okM157 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 1 = true := okB1432
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 2 = true := blkChk_join _ _ _ _ _ 1432 1 1 h0 okB1433
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 3 = true := blkChk_join _ _ _ _ _ 1432 2 1 h1 okB1434
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 4 = true := blkChk_join _ _ _ _ _ 1432 3 1 h2 okB1435
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 5 = true := blkChk_join _ _ _ _ _ 1432 4 1 h3 okB1436
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 6 = true := blkChk_join _ _ _ _ _ 1432 5 1 h4 okB1437
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 7 = true := blkChk_join _ _ _ _ _ 1432 6 1 h5 okB1438
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 8 = true := blkChk_join _ _ _ _ _ 1432 7 1 h6 okB1439
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1432 9 = true := blkChk_join _ _ _ _ _ 1432 8 1 h7 okB1440
  exact h8
end E1.C284X
