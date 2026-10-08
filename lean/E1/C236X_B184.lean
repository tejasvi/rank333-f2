module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1901 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1902 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1903 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1904 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1905 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1906 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1907 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1908 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG184 : glueChkR lits W 1901 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1901 lenT]; decide +kernel
theorem okM184 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 1 = true := okB1901
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 2 = true := blkChk_join _ _ _ _ _ 1901 1 1 h0 okB1902
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 3 = true := blkChk_join _ _ _ _ _ 1901 2 1 h1 okB1903
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 4 = true := blkChk_join _ _ _ _ _ 1901 3 1 h2 okB1904
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 5 = true := blkChk_join _ _ _ _ _ 1901 4 1 h3 okB1905
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 6 = true := blkChk_join _ _ _ _ _ 1901 5 1 h4 okB1906
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 7 = true := blkChk_join _ _ _ _ _ 1901 6 1 h5 okB1907
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1901 8 = true := blkChk_join _ _ _ _ _ 1901 7 1 h6 okB1908
  exact h7
end E1.C236X
