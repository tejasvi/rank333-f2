module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1927 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1928 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1928 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1929 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1929 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1930 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1930 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1931 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1931 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1932 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1932 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1933 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1933 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1934 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1934 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1935 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1935 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1936 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1936 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG212 : glueChkR lits W 1927 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1927 lenT]; decide +kernel
theorem okM212 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 1 = true := okB1927
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 2 = true := blkChk_join _ _ _ _ _ 1927 1 1 h0 okB1928
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 3 = true := blkChk_join _ _ _ _ _ 1927 2 1 h1 okB1929
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 4 = true := blkChk_join _ _ _ _ _ 1927 3 1 h2 okB1930
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 5 = true := blkChk_join _ _ _ _ _ 1927 4 1 h3 okB1931
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 6 = true := blkChk_join _ _ _ _ _ 1927 5 1 h4 okB1932
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 7 = true := blkChk_join _ _ _ _ _ 1927 6 1 h5 okB1933
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 8 = true := blkChk_join _ _ _ _ _ 1927 7 1 h6 okB1934
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 9 = true := blkChk_join _ _ _ _ _ 1927 8 1 h7 okB1935
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1927 10 = true := blkChk_join _ _ _ _ _ 1927 9 1 h8 okB1936
  exact h9
end E1.C284X
