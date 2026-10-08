module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1806 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 1 = true := by decide +kernel
theorem okB1807 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1807 1 = true := by decide +kernel
theorem okB1808 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1808 1 = true := by decide +kernel
theorem okB1809 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1809 1 = true := by decide +kernel
theorem okB1810 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1810 1 = true := by decide +kernel
theorem okB1811 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1811 1 = true := by decide +kernel
theorem okB1812 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1812 1 = true := by decide +kernel
theorem okB1813 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1813 1 = true := by decide +kernel
theorem okB1814 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1814 1 = true := by decide +kernel
theorem okB1815 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1815 1 = true := by decide +kernel
theorem okB1816 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1816 1 = true := by decide +kernel
theorem okG169 : glueChkR lits W 1806 11 = true := by decide +kernel
theorem okM169 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 1 = true := okB1806
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 2 = true := blkChk_join _ _ _ _ _ 1806 1 1 h0 okB1807
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 3 = true := blkChk_join _ _ _ _ _ 1806 2 1 h1 okB1808
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 4 = true := blkChk_join _ _ _ _ _ 1806 3 1 h2 okB1809
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 5 = true := blkChk_join _ _ _ _ _ 1806 4 1 h3 okB1810
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 6 = true := blkChk_join _ _ _ _ _ 1806 5 1 h4 okB1811
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 7 = true := blkChk_join _ _ _ _ _ 1806 6 1 h5 okB1812
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 8 = true := blkChk_join _ _ _ _ _ 1806 7 1 h6 okB1813
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 9 = true := blkChk_join _ _ _ _ _ 1806 8 1 h7 okB1814
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 10 = true := blkChk_join _ _ _ _ _ 1806 9 1 h8 okB1815
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1806 11 = true := blkChk_join _ _ _ _ _ 1806 10 1 h9 okB1816
  exact h10
end E1.C384X
