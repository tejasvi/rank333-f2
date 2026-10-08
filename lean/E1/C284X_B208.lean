module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1897 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1898 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1899 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1900 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1901 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1902 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1903 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1904 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1905 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1906 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1907 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG208 : glueChkR lits W 1897 11 = true := by
  rw [← glueChkRN_eq lits W 7747 1897 lenT]; decide +kernel
theorem okM208 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 1 = true := okB1897
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 2 = true := blkChk_join _ _ _ _ _ 1897 1 1 h0 okB1898
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 3 = true := blkChk_join _ _ _ _ _ 1897 2 1 h1 okB1899
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 4 = true := blkChk_join _ _ _ _ _ 1897 3 1 h2 okB1900
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 5 = true := blkChk_join _ _ _ _ _ 1897 4 1 h3 okB1901
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 6 = true := blkChk_join _ _ _ _ _ 1897 5 1 h4 okB1902
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 7 = true := blkChk_join _ _ _ _ _ 1897 6 1 h5 okB1903
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 8 = true := blkChk_join _ _ _ _ _ 1897 7 1 h6 okB1904
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 9 = true := blkChk_join _ _ _ _ _ 1897 8 1 h7 okB1905
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 10 = true := blkChk_join _ _ _ _ _ 1897 9 1 h8 okB1906
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1897 11 = true := blkChk_join _ _ _ _ _ 1897 10 1 h9 okB1907
  exact h10
end E1.C284X
