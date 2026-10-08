module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1858 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 1 = true := by decide +kernel
theorem okB1859 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1859 1 = true := by decide +kernel
theorem okB1860 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1860 1 = true := by decide +kernel
theorem okB1861 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1861 1 = true := by decide +kernel
theorem okB1862 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1862 1 = true := by decide +kernel
theorem okB1863 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1863 1 = true := by decide +kernel
theorem okB1864 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1864 1 = true := by decide +kernel
theorem okB1865 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1865 1 = true := by decide +kernel
theorem okB1866 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1866 1 = true := by decide +kernel
theorem okG174 : glueChkR lits W 1858 9 = true := by decide +kernel
theorem okM174 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 1 = true := okB1858
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 2 = true := blkChk_join _ _ _ _ _ 1858 1 1 h0 okB1859
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 3 = true := blkChk_join _ _ _ _ _ 1858 2 1 h1 okB1860
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 4 = true := blkChk_join _ _ _ _ _ 1858 3 1 h2 okB1861
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 5 = true := blkChk_join _ _ _ _ _ 1858 4 1 h3 okB1862
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 6 = true := blkChk_join _ _ _ _ _ 1858 5 1 h4 okB1863
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 7 = true := blkChk_join _ _ _ _ _ 1858 6 1 h5 okB1864
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 8 = true := blkChk_join _ _ _ _ _ 1858 7 1 h6 okB1865
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1858 9 = true := blkChk_join _ _ _ _ _ 1858 8 1 h7 okB1866
  exact h8
end E1.C384X
