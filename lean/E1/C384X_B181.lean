module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1924 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 1 = true := by decide +kernel
theorem okB1925 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1925 1 = true := by decide +kernel
theorem okB1926 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1926 1 = true := by decide +kernel
theorem okB1927 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1927 1 = true := by decide +kernel
theorem okB1928 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1928 1 = true := by decide +kernel
theorem okB1929 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1929 1 = true := by decide +kernel
theorem okB1930 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1930 1 = true := by decide +kernel
theorem okB1931 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1931 1 = true := by decide +kernel
theorem okB1932 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1932 1 = true := by decide +kernel
theorem okG181 : glueChkR lits W 1924 9 = true := by decide +kernel
theorem okM181 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 1 = true := okB1924
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 2 = true := blkChk_join _ _ _ _ _ 1924 1 1 h0 okB1925
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 3 = true := blkChk_join _ _ _ _ _ 1924 2 1 h1 okB1926
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 4 = true := blkChk_join _ _ _ _ _ 1924 3 1 h2 okB1927
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 5 = true := blkChk_join _ _ _ _ _ 1924 4 1 h3 okB1928
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 6 = true := blkChk_join _ _ _ _ _ 1924 5 1 h4 okB1929
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 7 = true := blkChk_join _ _ _ _ _ 1924 6 1 h5 okB1930
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 8 = true := blkChk_join _ _ _ _ _ 1924 7 1 h6 okB1931
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1924 9 = true := blkChk_join _ _ _ _ _ 1924 8 1 h7 okB1932
  exact h8
end E1.C384X
