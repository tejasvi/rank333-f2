module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3232 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3233 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3233 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3234 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3234 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3235 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3235 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3236 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3236 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3237 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3237 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3238 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3238 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG345 : glueChkR lits W 3232 7 = true := by
  rw [← glueChkRN_eq lits W 7747 3232 lenT]; decide +kernel
theorem okM345 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 1 = true := okB3232
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 2 = true := blkChk_join _ _ _ _ _ 3232 1 1 h0 okB3233
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 3 = true := blkChk_join _ _ _ _ _ 3232 2 1 h1 okB3234
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 4 = true := blkChk_join _ _ _ _ _ 3232 3 1 h2 okB3235
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 5 = true := blkChk_join _ _ _ _ _ 3232 4 1 h3 okB3236
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 6 = true := blkChk_join _ _ _ _ _ 3232 5 1 h4 okB3237
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3232 7 = true := blkChk_join _ _ _ _ _ 3232 6 1 h5 okB3238
  exact h6
end E1.C284X
