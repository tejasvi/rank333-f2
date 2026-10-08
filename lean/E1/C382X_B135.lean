module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1483 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 1 = true := by decide +kernel
theorem okB1484 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1484 1 = true := by decide +kernel
theorem okB1485 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1485 1 = true := by decide +kernel
theorem okB1486 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1486 1 = true := by decide +kernel
theorem okB1487 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1487 1 = true := by decide +kernel
theorem okB1488 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1488 1 = true := by decide +kernel
theorem okB1489 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1489 1 = true := by decide +kernel
theorem okB1490 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1490 1 = true := by decide +kernel
theorem okB1491 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1491 1 = true := by decide +kernel
theorem okB1492 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1492 1 = true := by decide +kernel
theorem okB1493 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1493 1 = true := by decide +kernel
theorem okB1494 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1494 1 = true := by decide +kernel
theorem okG135 : glueChkR lits W 1483 12 = true := by decide +kernel
theorem okM135 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 1 = true := okB1483
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 2 = true := blkChk_join _ _ _ _ _ 1483 1 1 h0 okB1484
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 3 = true := blkChk_join _ _ _ _ _ 1483 2 1 h1 okB1485
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 4 = true := blkChk_join _ _ _ _ _ 1483 3 1 h2 okB1486
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 5 = true := blkChk_join _ _ _ _ _ 1483 4 1 h3 okB1487
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 6 = true := blkChk_join _ _ _ _ _ 1483 5 1 h4 okB1488
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 7 = true := blkChk_join _ _ _ _ _ 1483 6 1 h5 okB1489
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 8 = true := blkChk_join _ _ _ _ _ 1483 7 1 h6 okB1490
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 9 = true := blkChk_join _ _ _ _ _ 1483 8 1 h7 okB1491
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 10 = true := blkChk_join _ _ _ _ _ 1483 9 1 h8 okB1492
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 11 = true := blkChk_join _ _ _ _ _ 1483 10 1 h9 okB1493
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1483 12 = true := blkChk_join _ _ _ _ _ 1483 11 1 h10 okB1494
  exact h11
end E1.C382X
