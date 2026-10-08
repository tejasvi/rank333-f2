module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1587 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 1 = true := by decide +kernel
theorem okB1588 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1588 1 = true := by decide +kernel
theorem okB1589 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1589 1 = true := by decide +kernel
theorem okB1590 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1590 1 = true := by decide +kernel
theorem okB1591 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1591 1 = true := by decide +kernel
theorem okB1592 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1592 1 = true := by decide +kernel
theorem okB1593 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1593 1 = true := by decide +kernel
theorem okB1594 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1594 1 = true := by decide +kernel
theorem okB1595 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1595 1 = true := by decide +kernel
theorem okB1596 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1596 1 = true := by decide +kernel
theorem okG147 : glueChkR lits W 1587 10 = true := by decide +kernel
theorem okM147 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 1 = true := okB1587
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 2 = true := blkChk_join _ _ _ _ _ 1587 1 1 h0 okB1588
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 3 = true := blkChk_join _ _ _ _ _ 1587 2 1 h1 okB1589
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 4 = true := blkChk_join _ _ _ _ _ 1587 3 1 h2 okB1590
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 5 = true := blkChk_join _ _ _ _ _ 1587 4 1 h3 okB1591
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 6 = true := blkChk_join _ _ _ _ _ 1587 5 1 h4 okB1592
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 7 = true := blkChk_join _ _ _ _ _ 1587 6 1 h5 okB1593
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 8 = true := blkChk_join _ _ _ _ _ 1587 7 1 h6 okB1594
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 9 = true := blkChk_join _ _ _ _ _ 1587 8 1 h7 okB1595
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1587 10 = true := blkChk_join _ _ _ _ _ 1587 9 1 h8 okB1596
  exact h9
end E1.C384X
