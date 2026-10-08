module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1441 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1442 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1442 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1443 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1443 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1444 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1444 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1445 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1445 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1446 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1447 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1447 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1448 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1448 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1449 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1449 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG158 : glueChkR lits W 1441 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1441 lenT]; decide +kernel
theorem okM158 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 1 = true := okB1441
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 2 = true := blkChk_join _ _ _ _ _ 1441 1 1 h0 okB1442
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 3 = true := blkChk_join _ _ _ _ _ 1441 2 1 h1 okB1443
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 4 = true := blkChk_join _ _ _ _ _ 1441 3 1 h2 okB1444
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 5 = true := blkChk_join _ _ _ _ _ 1441 4 1 h3 okB1445
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 6 = true := blkChk_join _ _ _ _ _ 1441 5 1 h4 okB1446
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 7 = true := blkChk_join _ _ _ _ _ 1441 6 1 h5 okB1447
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 8 = true := blkChk_join _ _ _ _ _ 1441 7 1 h6 okB1448
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1441 9 = true := blkChk_join _ _ _ _ _ 1441 8 1 h7 okB1449
  exact h8
end E1.C284X
