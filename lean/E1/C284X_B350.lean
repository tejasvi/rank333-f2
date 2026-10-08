module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3276 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3277 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3277 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3278 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3278 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3279 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3279 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3280 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3280 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3281 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3281 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3282 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3282 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3283 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3283 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3284 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3284 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3285 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3285 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3286 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3286 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG350 : glueChkR lits W 3276 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3276 lenT]; decide +kernel
theorem okM350 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 1 = true := okB3276
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 2 = true := blkChk_join _ _ _ _ _ 3276 1 1 h0 okB3277
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 3 = true := blkChk_join _ _ _ _ _ 3276 2 1 h1 okB3278
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 4 = true := blkChk_join _ _ _ _ _ 3276 3 1 h2 okB3279
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 5 = true := blkChk_join _ _ _ _ _ 3276 4 1 h3 okB3280
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 6 = true := blkChk_join _ _ _ _ _ 3276 5 1 h4 okB3281
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 7 = true := blkChk_join _ _ _ _ _ 3276 6 1 h5 okB3282
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 8 = true := blkChk_join _ _ _ _ _ 3276 7 1 h6 okB3283
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 9 = true := blkChk_join _ _ _ _ _ 3276 8 1 h7 okB3284
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 10 = true := blkChk_join _ _ _ _ _ 3276 9 1 h8 okB3285
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3276 11 = true := blkChk_join _ _ _ _ _ 3276 10 1 h9 okB3286
  exact h10
end E1.C284X
