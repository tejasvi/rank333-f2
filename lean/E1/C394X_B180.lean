module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB1885 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 1 = true := by decide +kernel
theorem okB1886 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1886 1 = true := by decide +kernel
theorem okB1887 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1887 1 = true := by decide +kernel
theorem okB1888 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1888 1 = true := by decide +kernel
theorem okB1889 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1889 1 = true := by decide +kernel
theorem okB1890 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1890 1 = true := by decide +kernel
theorem okB1891 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1891 1 = true := by decide +kernel
theorem okB1892 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1892 1 = true := by decide +kernel
theorem okB1893 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1893 1 = true := by decide +kernel
theorem okB1894 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1894 1 = true := by decide +kernel
theorem okB1895 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1895 1 = true := by decide +kernel
theorem okB1896 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1896 1 = true := by decide +kernel
theorem okG180 : glueChkR lits W 1885 12 = true := by decide +kernel
theorem okM180 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 12 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 1 = true := okB1885
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 2 = true := blkChk_join _ _ _ _ _ 1885 1 1 h0 okB1886
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 3 = true := blkChk_join _ _ _ _ _ 1885 2 1 h1 okB1887
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 4 = true := blkChk_join _ _ _ _ _ 1885 3 1 h2 okB1888
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 5 = true := blkChk_join _ _ _ _ _ 1885 4 1 h3 okB1889
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 6 = true := blkChk_join _ _ _ _ _ 1885 5 1 h4 okB1890
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 7 = true := blkChk_join _ _ _ _ _ 1885 6 1 h5 okB1891
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 8 = true := blkChk_join _ _ _ _ _ 1885 7 1 h6 okB1892
  have h8 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 9 = true := blkChk_join _ _ _ _ _ 1885 8 1 h7 okB1893
  have h9 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 10 = true := blkChk_join _ _ _ _ _ 1885 9 1 h8 okB1894
  have h10 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 11 = true := blkChk_join _ _ _ _ _ 1885 10 1 h9 okB1895
  have h11 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1885 12 = true := blkChk_join _ _ _ _ _ 1885 11 1 h10 okB1896
  exact h11
end E1.C394X
