module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1716 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 1 = true := by decide +kernel
theorem okB1717 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1717 1 = true := by decide +kernel
theorem okB1718 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1718 1 = true := by decide +kernel
theorem okB1719 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1719 1 = true := by decide +kernel
theorem okB1720 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1720 1 = true := by decide +kernel
theorem okB1721 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1721 1 = true := by decide +kernel
theorem okB1722 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1722 1 = true := by decide +kernel
theorem okB1723 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1723 1 = true := by decide +kernel
theorem okB1724 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1724 1 = true := by decide +kernel
theorem okG160 : glueChkR lits W 1716 9 = true := by decide +kernel
theorem okM160 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 1 = true := okB1716
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 2 = true := blkChk_join _ _ _ _ _ 1716 1 1 h0 okB1717
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 3 = true := blkChk_join _ _ _ _ _ 1716 2 1 h1 okB1718
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 4 = true := blkChk_join _ _ _ _ _ 1716 3 1 h2 okB1719
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 5 = true := blkChk_join _ _ _ _ _ 1716 4 1 h3 okB1720
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 6 = true := blkChk_join _ _ _ _ _ 1716 5 1 h4 okB1721
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 7 = true := blkChk_join _ _ _ _ _ 1716 6 1 h5 okB1722
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 8 = true := blkChk_join _ _ _ _ _ 1716 7 1 h6 okB1723
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1716 9 = true := blkChk_join _ _ _ _ _ 1716 8 1 h7 okB1724
  exact h8
end E1.C384X
