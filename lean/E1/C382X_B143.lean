module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1579 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 1 = true := by decide +kernel
theorem okB1580 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1580 1 = true := by decide +kernel
theorem okB1581 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1581 1 = true := by decide +kernel
theorem okB1582 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1582 1 = true := by decide +kernel
theorem okB1583 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1583 1 = true := by decide +kernel
theorem okB1584 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1584 1 = true := by decide +kernel
theorem okB1585 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1585 1 = true := by decide +kernel
theorem okB1586 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1586 1 = true := by decide +kernel
theorem okB1587 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1587 1 = true := by decide +kernel
theorem okB1588 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1588 1 = true := by decide +kernel
theorem okB1589 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1589 1 = true := by decide +kernel
theorem okB1590 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1590 1 = true := by decide +kernel
theorem okG143 : glueChkR lits W 1579 12 = true := by decide +kernel
theorem okM143 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 1 = true := okB1579
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 2 = true := blkChk_join _ _ _ _ _ 1579 1 1 h0 okB1580
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 3 = true := blkChk_join _ _ _ _ _ 1579 2 1 h1 okB1581
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 4 = true := blkChk_join _ _ _ _ _ 1579 3 1 h2 okB1582
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 5 = true := blkChk_join _ _ _ _ _ 1579 4 1 h3 okB1583
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 6 = true := blkChk_join _ _ _ _ _ 1579 5 1 h4 okB1584
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 7 = true := blkChk_join _ _ _ _ _ 1579 6 1 h5 okB1585
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 8 = true := blkChk_join _ _ _ _ _ 1579 7 1 h6 okB1586
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 9 = true := blkChk_join _ _ _ _ _ 1579 8 1 h7 okB1587
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 10 = true := blkChk_join _ _ _ _ _ 1579 9 1 h8 okB1588
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 11 = true := blkChk_join _ _ _ _ _ 1579 10 1 h9 okB1589
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1579 12 = true := blkChk_join _ _ _ _ _ 1579 11 1 h10 okB1590
  exact h11
end E1.C382X
