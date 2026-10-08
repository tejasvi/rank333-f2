module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3221 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3222 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3223 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3224 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3225 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3225 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3226 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3226 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3227 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3227 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3228 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3228 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3229 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3229 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3230 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3230 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3231 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3231 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG344 : glueChkR lits W 3221 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3221 lenT]; decide +kernel
theorem okM344 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 1 = true := okB3221
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 2 = true := blkChk_join _ _ _ _ _ 3221 1 1 h0 okB3222
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 3 = true := blkChk_join _ _ _ _ _ 3221 2 1 h1 okB3223
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 4 = true := blkChk_join _ _ _ _ _ 3221 3 1 h2 okB3224
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 5 = true := blkChk_join _ _ _ _ _ 3221 4 1 h3 okB3225
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 6 = true := blkChk_join _ _ _ _ _ 3221 5 1 h4 okB3226
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 7 = true := blkChk_join _ _ _ _ _ 3221 6 1 h5 okB3227
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 8 = true := blkChk_join _ _ _ _ _ 3221 7 1 h6 okB3228
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 9 = true := blkChk_join _ _ _ _ _ 3221 8 1 h7 okB3229
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 10 = true := blkChk_join _ _ _ _ _ 3221 9 1 h8 okB3230
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3221 11 = true := blkChk_join _ _ _ _ _ 3221 10 1 h9 okB3231
  exact h10
end E1.C284X
