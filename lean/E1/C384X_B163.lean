module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1744 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 1 = true := by decide +kernel
theorem okB1745 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1745 1 = true := by decide +kernel
theorem okB1746 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1746 1 = true := by decide +kernel
theorem okB1747 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1747 1 = true := by decide +kernel
theorem okB1748 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1748 1 = true := by decide +kernel
theorem okB1749 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1749 1 = true := by decide +kernel
theorem okB1750 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1750 1 = true := by decide +kernel
theorem okB1751 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1751 1 = true := by decide +kernel
theorem okB1752 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1752 1 = true := by decide +kernel
theorem okG163 : glueChkR lits W 1744 9 = true := by decide +kernel
theorem okM163 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 1 = true := okB1744
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 2 = true := blkChk_join _ _ _ _ _ 1744 1 1 h0 okB1745
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 3 = true := blkChk_join _ _ _ _ _ 1744 2 1 h1 okB1746
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 4 = true := blkChk_join _ _ _ _ _ 1744 3 1 h2 okB1747
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 5 = true := blkChk_join _ _ _ _ _ 1744 4 1 h3 okB1748
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 6 = true := blkChk_join _ _ _ _ _ 1744 5 1 h4 okB1749
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 7 = true := blkChk_join _ _ _ _ _ 1744 6 1 h5 okB1750
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 8 = true := blkChk_join _ _ _ _ _ 1744 7 1 h6 okB1751
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1744 9 = true := blkChk_join _ _ _ _ _ 1744 8 1 h7 okB1752
  exact h8
end E1.C384X
