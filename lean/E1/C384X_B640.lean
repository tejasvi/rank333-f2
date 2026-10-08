module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6608 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 1 = true := by decide +kernel
theorem okB6609 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6609 1 = true := by decide +kernel
theorem okB6610 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6610 1 = true := by decide +kernel
theorem okB6611 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6611 1 = true := by decide +kernel
theorem okB6612 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6612 1 = true := by decide +kernel
theorem okB6613 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6613 1 = true := by decide +kernel
theorem okB6614 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6614 1 = true := by decide +kernel
theorem okB6615 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6615 1 = true := by decide +kernel
theorem okG640 : glueChkR lits W 6608 8 = true := by decide +kernel
theorem okM640 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 1 = true := okB6608
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 2 = true := blkChk_join _ _ _ _ _ 6608 1 1 h0 okB6609
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 3 = true := blkChk_join _ _ _ _ _ 6608 2 1 h1 okB6610
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 4 = true := blkChk_join _ _ _ _ _ 6608 3 1 h2 okB6611
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 5 = true := blkChk_join _ _ _ _ _ 6608 4 1 h3 okB6612
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 6 = true := blkChk_join _ _ _ _ _ 6608 5 1 h4 okB6613
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 7 = true := blkChk_join _ _ _ _ _ 6608 6 1 h5 okB6614
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6608 8 = true := blkChk_join _ _ _ _ _ 6608 7 1 h6 okB6615
  exact h7
end E1.C384X
