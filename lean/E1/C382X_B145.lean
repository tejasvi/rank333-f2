module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1607 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 1 = true := by decide +kernel
theorem okB1608 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1608 1 = true := by decide +kernel
theorem okB1609 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1609 1 = true := by decide +kernel
theorem okB1610 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1610 1 = true := by decide +kernel
theorem okB1611 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1611 1 = true := by decide +kernel
theorem okB1612 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1612 1 = true := by decide +kernel
theorem okB1613 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1613 1 = true := by decide +kernel
theorem okB1614 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1614 1 = true := by decide +kernel
theorem okB1615 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1615 1 = true := by decide +kernel
theorem okB1616 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1616 1 = true := by decide +kernel
theorem okG145 : glueChkR lits W 1607 10 = true := by decide +kernel
theorem okM145 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 1 = true := okB1607
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 2 = true := blkChk_join _ _ _ _ _ 1607 1 1 h0 okB1608
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 3 = true := blkChk_join _ _ _ _ _ 1607 2 1 h1 okB1609
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 4 = true := blkChk_join _ _ _ _ _ 1607 3 1 h2 okB1610
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 5 = true := blkChk_join _ _ _ _ _ 1607 4 1 h3 okB1611
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 6 = true := blkChk_join _ _ _ _ _ 1607 5 1 h4 okB1612
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 7 = true := blkChk_join _ _ _ _ _ 1607 6 1 h5 okB1613
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 8 = true := blkChk_join _ _ _ _ _ 1607 7 1 h6 okB1614
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 9 = true := blkChk_join _ _ _ _ _ 1607 8 1 h7 okB1615
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1607 10 = true := blkChk_join _ _ _ _ _ 1607 9 1 h8 okB1616
  exact h9
end E1.C382X
