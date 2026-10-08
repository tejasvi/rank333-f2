module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1914 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1915 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1916 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1917 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1918 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1919 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1920 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1920 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG210 : glueChkR lits W 1914 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1914 lenT]; decide +kernel
theorem okM210 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 1 = true := okB1914
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 2 = true := blkChk_join _ _ _ _ _ 1914 1 1 h0 okB1915
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 3 = true := blkChk_join _ _ _ _ _ 1914 2 1 h1 okB1916
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 4 = true := blkChk_join _ _ _ _ _ 1914 3 1 h2 okB1917
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 5 = true := blkChk_join _ _ _ _ _ 1914 4 1 h3 okB1918
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 6 = true := blkChk_join _ _ _ _ _ 1914 5 1 h4 okB1919
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1914 7 = true := blkChk_join _ _ _ _ _ 1914 6 1 h5 okB1920
  exact h6
end E1.C284X
