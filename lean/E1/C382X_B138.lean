module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1520 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 1 = true := by decide +kernel
theorem okB1521 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1521 1 = true := by decide +kernel
theorem okB1522 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1522 1 = true := by decide +kernel
theorem okB1523 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1523 1 = true := by decide +kernel
theorem okB1524 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1524 1 = true := by decide +kernel
theorem okB1525 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1525 1 = true := by decide +kernel
theorem okB1526 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1526 1 = true := by decide +kernel
theorem okB1527 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1527 1 = true := by decide +kernel
theorem okB1528 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1528 1 = true := by decide +kernel
theorem okG138 : glueChkR lits W 1520 9 = true := by decide +kernel
theorem okM138 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 1 = true := okB1520
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 2 = true := blkChk_join _ _ _ _ _ 1520 1 1 h0 okB1521
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 3 = true := blkChk_join _ _ _ _ _ 1520 2 1 h1 okB1522
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 4 = true := blkChk_join _ _ _ _ _ 1520 3 1 h2 okB1523
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 5 = true := blkChk_join _ _ _ _ _ 1520 4 1 h3 okB1524
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 6 = true := blkChk_join _ _ _ _ _ 1520 5 1 h4 okB1525
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 7 = true := blkChk_join _ _ _ _ _ 1520 6 1 h5 okB1526
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 8 = true := blkChk_join _ _ _ _ _ 1520 7 1 h6 okB1527
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1520 9 = true := blkChk_join _ _ _ _ _ 1520 8 1 h7 okB1528
  exact h8
end E1.C382X
