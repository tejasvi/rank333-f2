module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1903 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 1 = true := by decide +kernel
theorem okB1904 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1904 1 = true := by decide +kernel
theorem okB1905 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1905 1 = true := by decide +kernel
theorem okB1906 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1906 1 = true := by decide +kernel
theorem okB1907 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1907 1 = true := by decide +kernel
theorem okB1908 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1908 1 = true := by decide +kernel
theorem okB1909 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1909 1 = true := by decide +kernel
theorem okB1910 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1910 1 = true := by decide +kernel
theorem okB1911 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1911 1 = true := by decide +kernel
theorem okB1912 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1912 1 = true := by decide +kernel
theorem okB1913 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1913 1 = true := by decide +kernel
theorem okB1914 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1914 1 = true := by decide +kernel
theorem okG179 : glueChkR lits W 1903 12 = true := by decide +kernel
theorem okM179 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 1 = true := okB1903
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 2 = true := blkChk_join _ _ _ _ _ 1903 1 1 h0 okB1904
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 3 = true := blkChk_join _ _ _ _ _ 1903 2 1 h1 okB1905
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 4 = true := blkChk_join _ _ _ _ _ 1903 3 1 h2 okB1906
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 5 = true := blkChk_join _ _ _ _ _ 1903 4 1 h3 okB1907
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 6 = true := blkChk_join _ _ _ _ _ 1903 5 1 h4 okB1908
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 7 = true := blkChk_join _ _ _ _ _ 1903 6 1 h5 okB1909
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 8 = true := blkChk_join _ _ _ _ _ 1903 7 1 h6 okB1910
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 9 = true := blkChk_join _ _ _ _ _ 1903 8 1 h7 okB1911
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 10 = true := blkChk_join _ _ _ _ _ 1903 9 1 h8 okB1912
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 11 = true := blkChk_join _ _ _ _ _ 1903 10 1 h9 okB1913
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1903 12 = true := blkChk_join _ _ _ _ _ 1903 11 1 h10 okB1914
  exact h11
end E1.C384X
