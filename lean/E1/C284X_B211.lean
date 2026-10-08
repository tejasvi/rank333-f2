module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1921 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1922 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1922 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1923 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1923 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1924 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1924 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1925 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1925 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1926 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1926 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG211 : glueChkR lits W 1921 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1921 lenT]; decide +kernel
theorem okM211 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 1 = true := okB1921
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 2 = true := blkChk_join _ _ _ _ _ 1921 1 1 h0 okB1922
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 3 = true := blkChk_join _ _ _ _ _ 1921 2 1 h1 okB1923
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 4 = true := blkChk_join _ _ _ _ _ 1921 3 1 h2 okB1924
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 5 = true := blkChk_join _ _ _ _ _ 1921 4 1 h3 okB1925
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1921 6 = true := blkChk_join _ _ _ _ _ 1921 5 1 h4 okB1926
  exact h5
end E1.C284X
