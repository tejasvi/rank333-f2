module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3988 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3989 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3990 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3991 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3991 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3992 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3992 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3993 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3993 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3994 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3994 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3995 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3995 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3996 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3996 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG421 : glueChkR lits W 3988 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3988 lenT]; decide +kernel
theorem okM421 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 1 = true := okB3988
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 2 = true := blkChk_join _ _ _ _ _ 3988 1 1 h0 okB3989
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 3 = true := blkChk_join _ _ _ _ _ 3988 2 1 h1 okB3990
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 4 = true := blkChk_join _ _ _ _ _ 3988 3 1 h2 okB3991
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 5 = true := blkChk_join _ _ _ _ _ 3988 4 1 h3 okB3992
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 6 = true := blkChk_join _ _ _ _ _ 3988 5 1 h4 okB3993
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 7 = true := blkChk_join _ _ _ _ _ 3988 6 1 h5 okB3994
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 8 = true := blkChk_join _ _ _ _ _ 3988 7 1 h6 okB3995
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3988 9 = true := blkChk_join _ _ _ _ _ 3988 8 1 h7 okB3996
  exact h8
end E1.C284X
