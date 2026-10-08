module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB1908 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 1 = true := by decide +kernel
theorem okB1909 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1909 1 = true := by decide +kernel
theorem okB1910 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1910 1 = true := by decide +kernel
theorem okB1911 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1911 1 = true := by decide +kernel
theorem okB1912 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1912 1 = true := by decide +kernel
theorem okB1913 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1913 1 = true := by decide +kernel
theorem okB1914 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1914 1 = true := by decide +kernel
theorem okB1915 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1915 1 = true := by decide +kernel
theorem okB1916 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1916 1 = true := by decide +kernel
theorem okB1917 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1917 1 = true := by decide +kernel
theorem okB1918 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1918 1 = true := by decide +kernel
theorem okG177 : glueChkR lits W 1908 11 = true := by decide +kernel
theorem okM177 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 11 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 1 = true := okB1908
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 2 = true := blkChk_join _ _ _ _ _ 1908 1 1 h0 okB1909
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 3 = true := blkChk_join _ _ _ _ _ 1908 2 1 h1 okB1910
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 4 = true := blkChk_join _ _ _ _ _ 1908 3 1 h2 okB1911
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 5 = true := blkChk_join _ _ _ _ _ 1908 4 1 h3 okB1912
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 6 = true := blkChk_join _ _ _ _ _ 1908 5 1 h4 okB1913
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 7 = true := blkChk_join _ _ _ _ _ 1908 6 1 h5 okB1914
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 8 = true := blkChk_join _ _ _ _ _ 1908 7 1 h6 okB1915
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 9 = true := blkChk_join _ _ _ _ _ 1908 8 1 h7 okB1916
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 10 = true := blkChk_join _ _ _ _ _ 1908 9 1 h8 okB1917
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 1908 11 = true := blkChk_join _ _ _ _ _ 1908 10 1 h9 okB1918
  exact h10
end E1.C213X
