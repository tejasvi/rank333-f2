module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5912 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5913 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5913 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5914 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5914 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5915 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5916 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5917 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5918 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5919 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5920 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5920 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5921 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5921 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5922 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5922 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5923 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5923 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5924 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5924 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG570 : glueChkR lits W 5912 13 = true := by
  rw [← glueChkRN_eq lits W 8596 5912 lenT]; decide +kernel
theorem okM570 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 13 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 1 = true := okB5912
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 2 = true := blkChk_join _ _ _ _ _ 5912 1 1 h0 okB5913
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 3 = true := blkChk_join _ _ _ _ _ 5912 2 1 h1 okB5914
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 4 = true := blkChk_join _ _ _ _ _ 5912 3 1 h2 okB5915
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 5 = true := blkChk_join _ _ _ _ _ 5912 4 1 h3 okB5916
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 6 = true := blkChk_join _ _ _ _ _ 5912 5 1 h4 okB5917
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 7 = true := blkChk_join _ _ _ _ _ 5912 6 1 h5 okB5918
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 8 = true := blkChk_join _ _ _ _ _ 5912 7 1 h6 okB5919
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 9 = true := blkChk_join _ _ _ _ _ 5912 8 1 h7 okB5920
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 10 = true := blkChk_join _ _ _ _ _ 5912 9 1 h8 okB5921
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 11 = true := blkChk_join _ _ _ _ _ 5912 10 1 h9 okB5922
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 12 = true := blkChk_join _ _ _ _ _ 5912 11 1 h10 okB5923
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5912 13 = true := blkChk_join _ _ _ _ _ 5912 12 1 h11 okB5924
  exact h12
end E1.C236X
