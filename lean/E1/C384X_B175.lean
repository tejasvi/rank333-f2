module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1867 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 1 = true := by decide +kernel
theorem okB1868 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1868 1 = true := by decide +kernel
theorem okB1869 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1869 1 = true := by decide +kernel
theorem okB1870 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1870 1 = true := by decide +kernel
theorem okB1871 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1871 1 = true := by decide +kernel
theorem okB1872 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1872 1 = true := by decide +kernel
theorem okB1873 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1873 1 = true := by decide +kernel
theorem okB1874 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1874 1 = true := by decide +kernel
theorem okB1875 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1875 1 = true := by decide +kernel
theorem okB1876 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1876 1 = true := by decide +kernel
theorem okG175 : glueChkR lits W 1867 10 = true := by decide +kernel
theorem okM175 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 1 = true := okB1867
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 2 = true := blkChk_join _ _ _ _ _ 1867 1 1 h0 okB1868
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 3 = true := blkChk_join _ _ _ _ _ 1867 2 1 h1 okB1869
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 4 = true := blkChk_join _ _ _ _ _ 1867 3 1 h2 okB1870
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 5 = true := blkChk_join _ _ _ _ _ 1867 4 1 h3 okB1871
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 6 = true := blkChk_join _ _ _ _ _ 1867 5 1 h4 okB1872
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 7 = true := blkChk_join _ _ _ _ _ 1867 6 1 h5 okB1873
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 8 = true := blkChk_join _ _ _ _ _ 1867 7 1 h6 okB1874
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 9 = true := blkChk_join _ _ _ _ _ 1867 8 1 h7 okB1875
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1867 10 = true := blkChk_join _ _ _ _ _ 1867 9 1 h8 okB1876
  exact h9
end E1.C384X
