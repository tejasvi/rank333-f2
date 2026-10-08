module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1915 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 1 = true := by decide +kernel
theorem okB1916 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1916 1 = true := by decide +kernel
theorem okB1917 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1917 1 = true := by decide +kernel
theorem okB1918 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1918 1 = true := by decide +kernel
theorem okB1919 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1919 1 = true := by decide +kernel
theorem okB1920 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1920 1 = true := by decide +kernel
theorem okB1921 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1921 1 = true := by decide +kernel
theorem okB1922 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1922 1 = true := by decide +kernel
theorem okB1923 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1923 1 = true := by decide +kernel
theorem okG180 : glueChkR lits W 1915 9 = true := by decide +kernel
theorem okM180 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 1 = true := okB1915
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 2 = true := blkChk_join _ _ _ _ _ 1915 1 1 h0 okB1916
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 3 = true := blkChk_join _ _ _ _ _ 1915 2 1 h1 okB1917
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 4 = true := blkChk_join _ _ _ _ _ 1915 3 1 h2 okB1918
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 5 = true := blkChk_join _ _ _ _ _ 1915 4 1 h3 okB1919
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 6 = true := blkChk_join _ _ _ _ _ 1915 5 1 h4 okB1920
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 7 = true := blkChk_join _ _ _ _ _ 1915 6 1 h5 okB1921
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 8 = true := blkChk_join _ _ _ _ _ 1915 7 1 h6 okB1922
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1915 9 = true := blkChk_join _ _ _ _ _ 1915 8 1 h7 okB1923
  exact h8
end E1.C384X
