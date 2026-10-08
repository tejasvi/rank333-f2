module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1748 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 1 = true := by decide +kernel
theorem okB1749 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1749 1 = true := by decide +kernel
theorem okB1750 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1750 1 = true := by decide +kernel
theorem okB1751 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1751 1 = true := by decide +kernel
theorem okB1752 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1752 1 = true := by decide +kernel
theorem okB1753 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1753 1 = true := by decide +kernel
theorem okB1754 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1754 1 = true := by decide +kernel
theorem okB1755 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1755 1 = true := by decide +kernel
theorem okG157 : glueChkR lits W 1748 8 = true := by decide +kernel
theorem okM157 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 1 = true := okB1748
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 2 = true := blkChk_join _ _ _ _ _ 1748 1 1 h0 okB1749
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 3 = true := blkChk_join _ _ _ _ _ 1748 2 1 h1 okB1750
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 4 = true := blkChk_join _ _ _ _ _ 1748 3 1 h2 okB1751
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 5 = true := blkChk_join _ _ _ _ _ 1748 4 1 h3 okB1752
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 6 = true := blkChk_join _ _ _ _ _ 1748 5 1 h4 okB1753
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 7 = true := blkChk_join _ _ _ _ _ 1748 6 1 h5 okB1754
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1748 8 = true := blkChk_join _ _ _ _ _ 1748 7 1 h6 okB1755
  exact h7
end E1.C382X
