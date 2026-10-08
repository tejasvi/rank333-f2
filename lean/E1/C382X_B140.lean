module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1542 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 1 = true := by decide +kernel
theorem okB1543 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1543 1 = true := by decide +kernel
theorem okB1544 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1544 1 = true := by decide +kernel
theorem okB1545 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1545 1 = true := by decide +kernel
theorem okB1546 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1546 1 = true := by decide +kernel
theorem okB1547 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1547 1 = true := by decide +kernel
theorem okB1548 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1548 1 = true := by decide +kernel
theorem okB1549 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1549 1 = true := by decide +kernel
theorem okB1550 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1550 1 = true := by decide +kernel
theorem okG140 : glueChkR lits W 1542 9 = true := by decide +kernel
theorem okM140 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 1 = true := okB1542
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 2 = true := blkChk_join _ _ _ _ _ 1542 1 1 h0 okB1543
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 3 = true := blkChk_join _ _ _ _ _ 1542 2 1 h1 okB1544
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 4 = true := blkChk_join _ _ _ _ _ 1542 3 1 h2 okB1545
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 5 = true := blkChk_join _ _ _ _ _ 1542 4 1 h3 okB1546
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 6 = true := blkChk_join _ _ _ _ _ 1542 5 1 h4 okB1547
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 7 = true := blkChk_join _ _ _ _ _ 1542 6 1 h5 okB1548
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 8 = true := blkChk_join _ _ _ _ _ 1542 7 1 h6 okB1549
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1542 9 = true := blkChk_join _ _ _ _ _ 1542 8 1 h7 okB1550
  exact h8
end E1.C382X
