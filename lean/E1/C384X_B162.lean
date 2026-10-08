module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1735 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 1 = true := by decide +kernel
theorem okB1736 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1736 1 = true := by decide +kernel
theorem okB1737 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1737 1 = true := by decide +kernel
theorem okB1738 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1738 1 = true := by decide +kernel
theorem okB1739 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1739 1 = true := by decide +kernel
theorem okB1740 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1740 1 = true := by decide +kernel
theorem okB1741 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1741 1 = true := by decide +kernel
theorem okB1742 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1742 1 = true := by decide +kernel
theorem okB1743 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1743 1 = true := by decide +kernel
theorem okG162 : glueChkR lits W 1735 9 = true := by decide +kernel
theorem okM162 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 1 = true := okB1735
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 2 = true := blkChk_join _ _ _ _ _ 1735 1 1 h0 okB1736
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 3 = true := blkChk_join _ _ _ _ _ 1735 2 1 h1 okB1737
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 4 = true := blkChk_join _ _ _ _ _ 1735 3 1 h2 okB1738
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 5 = true := blkChk_join _ _ _ _ _ 1735 4 1 h3 okB1739
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 6 = true := blkChk_join _ _ _ _ _ 1735 5 1 h4 okB1740
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 7 = true := blkChk_join _ _ _ _ _ 1735 6 1 h5 okB1741
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 8 = true := blkChk_join _ _ _ _ _ 1735 7 1 h6 okB1742
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1735 9 = true := blkChk_join _ _ _ _ _ 1735 8 1 h7 okB1743
  exact h8
end E1.C384X
