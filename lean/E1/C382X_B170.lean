module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1905 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 1 = true := by decide +kernel
theorem okB1906 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1906 1 = true := by decide +kernel
theorem okB1907 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1907 1 = true := by decide +kernel
theorem okB1908 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1908 1 = true := by decide +kernel
theorem okB1909 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1909 1 = true := by decide +kernel
theorem okB1910 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1910 1 = true := by decide +kernel
theorem okB1911 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1911 1 = true := by decide +kernel
theorem okB1912 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1912 1 = true := by decide +kernel
theorem okB1913 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1913 1 = true := by decide +kernel
theorem okB1914 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1914 1 = true := by decide +kernel
theorem okB1915 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1915 1 = true := by decide +kernel
theorem okG170 : glueChkR lits W 1905 11 = true := by decide +kernel
theorem okM170 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 11 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 1 = true := okB1905
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 2 = true := blkChk_join _ _ _ _ _ 1905 1 1 h0 okB1906
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 3 = true := blkChk_join _ _ _ _ _ 1905 2 1 h1 okB1907
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 4 = true := blkChk_join _ _ _ _ _ 1905 3 1 h2 okB1908
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 5 = true := blkChk_join _ _ _ _ _ 1905 4 1 h3 okB1909
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 6 = true := blkChk_join _ _ _ _ _ 1905 5 1 h4 okB1910
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 7 = true := blkChk_join _ _ _ _ _ 1905 6 1 h5 okB1911
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 8 = true := blkChk_join _ _ _ _ _ 1905 7 1 h6 okB1912
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 9 = true := blkChk_join _ _ _ _ _ 1905 8 1 h7 okB1913
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 10 = true := blkChk_join _ _ _ _ _ 1905 9 1 h8 okB1914
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1905 11 = true := blkChk_join _ _ _ _ _ 1905 10 1 h9 okB1915
  exact h10
end E1.C382X
