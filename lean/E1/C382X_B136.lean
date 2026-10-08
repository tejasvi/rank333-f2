module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1495 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 1 = true := by decide +kernel
theorem okB1496 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1496 1 = true := by decide +kernel
theorem okB1497 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1497 1 = true := by decide +kernel
theorem okB1498 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1498 1 = true := by decide +kernel
theorem okB1499 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1499 1 = true := by decide +kernel
theorem okB1500 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1500 1 = true := by decide +kernel
theorem okB1501 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1501 1 = true := by decide +kernel
theorem okB1502 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1502 1 = true := by decide +kernel
theorem okB1503 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1503 1 = true := by decide +kernel
theorem okB1504 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1504 1 = true := by decide +kernel
theorem okB1505 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1505 1 = true := by decide +kernel
theorem okB1506 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1506 1 = true := by decide +kernel
theorem okB1507 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1507 1 = true := by decide +kernel
theorem okG136 : glueChkR lits W 1495 13 = true := by decide +kernel
theorem okM136 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 13 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 1 = true := okB1495
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 2 = true := blkChk_join _ _ _ _ _ 1495 1 1 h0 okB1496
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 3 = true := blkChk_join _ _ _ _ _ 1495 2 1 h1 okB1497
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 4 = true := blkChk_join _ _ _ _ _ 1495 3 1 h2 okB1498
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 5 = true := blkChk_join _ _ _ _ _ 1495 4 1 h3 okB1499
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 6 = true := blkChk_join _ _ _ _ _ 1495 5 1 h4 okB1500
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 7 = true := blkChk_join _ _ _ _ _ 1495 6 1 h5 okB1501
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 8 = true := blkChk_join _ _ _ _ _ 1495 7 1 h6 okB1502
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 9 = true := blkChk_join _ _ _ _ _ 1495 8 1 h7 okB1503
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 10 = true := blkChk_join _ _ _ _ _ 1495 9 1 h8 okB1504
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 11 = true := blkChk_join _ _ _ _ _ 1495 10 1 h9 okB1505
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 12 = true := blkChk_join _ _ _ _ _ 1495 11 1 h10 okB1506
  have h12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1495 13 = true := blkChk_join _ _ _ _ _ 1495 12 1 h11 okB1507
  exact h12
end E1.C382X
