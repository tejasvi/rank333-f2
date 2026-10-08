module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2915 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2916 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2917 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2918 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2919 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2920 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2920 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2921 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2921 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2922 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2922 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2923 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2923 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG316 : glueChkR lits W 2915 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2915 lenT]; decide +kernel
theorem okM316 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 1 = true := okB2915
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 2 = true := blkChk_join _ _ _ _ _ 2915 1 1 h0 okB2916
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 3 = true := blkChk_join _ _ _ _ _ 2915 2 1 h1 okB2917
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 4 = true := blkChk_join _ _ _ _ _ 2915 3 1 h2 okB2918
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 5 = true := blkChk_join _ _ _ _ _ 2915 4 1 h3 okB2919
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 6 = true := blkChk_join _ _ _ _ _ 2915 5 1 h4 okB2920
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 7 = true := blkChk_join _ _ _ _ _ 2915 6 1 h5 okB2921
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 8 = true := blkChk_join _ _ _ _ _ 2915 7 1 h6 okB2922
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2915 9 = true := blkChk_join _ _ _ _ _ 2915 8 1 h7 okB2923
  exact h8
end E1.C284X
