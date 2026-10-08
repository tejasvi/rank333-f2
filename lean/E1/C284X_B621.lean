module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5917 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5918 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5919 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5920 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5920 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5921 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5921 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5922 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5922 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5923 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5923 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5924 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5924 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5925 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5925 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5926 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5926 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5927 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5927 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5928 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5928 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG621 : glueChkR lits W 5917 12 = true := by
  rw [← glueChkRN_eq lits W 7747 5917 lenT]; decide +kernel
theorem okM621 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 1 = true := okB5917
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 2 = true := blkChk_join _ _ _ _ _ 5917 1 1 h0 okB5918
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 3 = true := blkChk_join _ _ _ _ _ 5917 2 1 h1 okB5919
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 4 = true := blkChk_join _ _ _ _ _ 5917 3 1 h2 okB5920
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 5 = true := blkChk_join _ _ _ _ _ 5917 4 1 h3 okB5921
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 6 = true := blkChk_join _ _ _ _ _ 5917 5 1 h4 okB5922
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 7 = true := blkChk_join _ _ _ _ _ 5917 6 1 h5 okB5923
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 8 = true := blkChk_join _ _ _ _ _ 5917 7 1 h6 okB5924
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 9 = true := blkChk_join _ _ _ _ _ 5917 8 1 h7 okB5925
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 10 = true := blkChk_join _ _ _ _ _ 5917 9 1 h8 okB5926
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 11 = true := blkChk_join _ _ _ _ _ 5917 10 1 h9 okB5927
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5917 12 = true := blkChk_join _ _ _ _ _ 5917 11 1 h10 okB5928
  exact h11
end E1.C284X
