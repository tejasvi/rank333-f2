module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2985 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2986 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2987 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2988 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2989 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2990 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2991 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2991 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2992 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2992 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2993 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2993 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2994 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2994 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2995 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2995 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG323 : glueChkR lits W 2985 11 = true := by
  rw [← glueChkRN_eq lits W 7747 2985 lenT]; decide +kernel
theorem okM323 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 1 = true := okB2985
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 2 = true := blkChk_join _ _ _ _ _ 2985 1 1 h0 okB2986
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 3 = true := blkChk_join _ _ _ _ _ 2985 2 1 h1 okB2987
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 4 = true := blkChk_join _ _ _ _ _ 2985 3 1 h2 okB2988
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 5 = true := blkChk_join _ _ _ _ _ 2985 4 1 h3 okB2989
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 6 = true := blkChk_join _ _ _ _ _ 2985 5 1 h4 okB2990
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 7 = true := blkChk_join _ _ _ _ _ 2985 6 1 h5 okB2991
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 8 = true := blkChk_join _ _ _ _ _ 2985 7 1 h6 okB2992
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 9 = true := blkChk_join _ _ _ _ _ 2985 8 1 h7 okB2993
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 10 = true := blkChk_join _ _ _ _ _ 2985 9 1 h8 okB2994
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2985 11 = true := blkChk_join _ _ _ _ _ 2985 10 1 h9 okB2995
  exact h10
end E1.C284X
