module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1839 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 1 = true := by decide +kernel
theorem okB1840 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1840 1 = true := by decide +kernel
theorem okB1841 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1841 1 = true := by decide +kernel
theorem okB1842 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1842 1 = true := by decide +kernel
theorem okB1843 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1843 1 = true := by decide +kernel
theorem okB1844 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1844 1 = true := by decide +kernel
theorem okB1845 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1845 1 = true := by decide +kernel
theorem okB1846 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1846 1 = true := by decide +kernel
theorem okB1847 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1847 1 = true := by decide +kernel
theorem okB1848 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1848 1 = true := by decide +kernel
theorem okB1849 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1849 1 = true := by decide +kernel
theorem okB1850 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1850 1 = true := by decide +kernel
theorem okG165 : glueChkR lits W 1839 12 = true := by decide +kernel
theorem okM165 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 1 = true := okB1839
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 2 = true := blkChk_join _ _ _ _ _ 1839 1 1 h0 okB1840
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 3 = true := blkChk_join _ _ _ _ _ 1839 2 1 h1 okB1841
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 4 = true := blkChk_join _ _ _ _ _ 1839 3 1 h2 okB1842
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 5 = true := blkChk_join _ _ _ _ _ 1839 4 1 h3 okB1843
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 6 = true := blkChk_join _ _ _ _ _ 1839 5 1 h4 okB1844
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 7 = true := blkChk_join _ _ _ _ _ 1839 6 1 h5 okB1845
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 8 = true := blkChk_join _ _ _ _ _ 1839 7 1 h6 okB1846
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 9 = true := blkChk_join _ _ _ _ _ 1839 8 1 h7 okB1847
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 10 = true := blkChk_join _ _ _ _ _ 1839 9 1 h8 okB1848
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 11 = true := blkChk_join _ _ _ _ _ 1839 10 1 h9 okB1849
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1839 12 = true := blkChk_join _ _ _ _ _ 1839 11 1 h10 okB1850
  exact h11
end E1.C382X
