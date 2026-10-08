module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1778 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 1 = true := by decide +kernel
theorem okB1779 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1779 1 = true := by decide +kernel
theorem okB1780 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1780 1 = true := by decide +kernel
theorem okB1781 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1781 1 = true := by decide +kernel
theorem okB1782 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1782 1 = true := by decide +kernel
theorem okB1783 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1783 1 = true := by decide +kernel
theorem okB1784 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1784 1 = true := by decide +kernel
theorem okB1785 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1785 1 = true := by decide +kernel
theorem okB1786 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1786 1 = true := by decide +kernel
theorem okB1787 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1787 1 = true := by decide +kernel
theorem okB1788 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1788 1 = true := by decide +kernel
theorem okB1789 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1789 1 = true := by decide +kernel
theorem okB1790 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1790 1 = true := by decide +kernel
theorem okG160 : glueChkR lits W 1778 13 = true := by decide +kernel
theorem okM160 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 13 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 1 = true := okB1778
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 2 = true := blkChk_join _ _ _ _ _ 1778 1 1 h0 okB1779
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 3 = true := blkChk_join _ _ _ _ _ 1778 2 1 h1 okB1780
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 4 = true := blkChk_join _ _ _ _ _ 1778 3 1 h2 okB1781
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 5 = true := blkChk_join _ _ _ _ _ 1778 4 1 h3 okB1782
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 6 = true := blkChk_join _ _ _ _ _ 1778 5 1 h4 okB1783
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 7 = true := blkChk_join _ _ _ _ _ 1778 6 1 h5 okB1784
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 8 = true := blkChk_join _ _ _ _ _ 1778 7 1 h6 okB1785
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 9 = true := blkChk_join _ _ _ _ _ 1778 8 1 h7 okB1786
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 10 = true := blkChk_join _ _ _ _ _ 1778 9 1 h8 okB1787
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 11 = true := blkChk_join _ _ _ _ _ 1778 10 1 h9 okB1788
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 12 = true := blkChk_join _ _ _ _ _ 1778 11 1 h10 okB1789
  have h12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1778 13 = true := blkChk_join _ _ _ _ _ 1778 12 1 h11 okB1790
  exact h12
end E1.C382X
