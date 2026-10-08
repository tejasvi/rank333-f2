module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1616 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 1 = true := by decide +kernel
theorem okB1617 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1617 1 = true := by decide +kernel
theorem okB1618 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1618 1 = true := by decide +kernel
theorem okB1619 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1619 1 = true := by decide +kernel
theorem okB1620 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1620 1 = true := by decide +kernel
theorem okB1621 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1621 1 = true := by decide +kernel
theorem okB1622 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1622 1 = true := by decide +kernel
theorem okB1623 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1623 1 = true := by decide +kernel
theorem okB1624 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1624 1 = true := by decide +kernel
theorem okB1625 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1625 1 = true := by decide +kernel
theorem okB1626 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1626 1 = true := by decide +kernel
theorem okG150 : glueChkR lits W 1616 11 = true := by decide +kernel
theorem okM150 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 1 = true := okB1616
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 2 = true := blkChk_join _ _ _ _ _ 1616 1 1 h0 okB1617
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 3 = true := blkChk_join _ _ _ _ _ 1616 2 1 h1 okB1618
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 4 = true := blkChk_join _ _ _ _ _ 1616 3 1 h2 okB1619
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 5 = true := blkChk_join _ _ _ _ _ 1616 4 1 h3 okB1620
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 6 = true := blkChk_join _ _ _ _ _ 1616 5 1 h4 okB1621
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 7 = true := blkChk_join _ _ _ _ _ 1616 6 1 h5 okB1622
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 8 = true := blkChk_join _ _ _ _ _ 1616 7 1 h6 okB1623
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 9 = true := blkChk_join _ _ _ _ _ 1616 8 1 h7 okB1624
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 10 = true := blkChk_join _ _ _ _ _ 1616 9 1 h8 okB1625
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1616 11 = true := blkChk_join _ _ _ _ _ 1616 10 1 h9 okB1626
  exact h10
end E1.C384X
