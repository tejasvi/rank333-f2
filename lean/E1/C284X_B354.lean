module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3316 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3317 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3317 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3318 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3318 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3319 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3319 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3320 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3320 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3321 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3321 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3322 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3322 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3323 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3323 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3324 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3324 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3325 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3325 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3326 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3326 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3327 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG354 : glueChkR lits W 3316 12 = true := by
  rw [← glueChkRN_eq lits W 7747 3316 lenT]; decide +kernel
theorem okM354 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 1 = true := okB3316
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 2 = true := blkChk_join _ _ _ _ _ 3316 1 1 h0 okB3317
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 3 = true := blkChk_join _ _ _ _ _ 3316 2 1 h1 okB3318
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 4 = true := blkChk_join _ _ _ _ _ 3316 3 1 h2 okB3319
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 5 = true := blkChk_join _ _ _ _ _ 3316 4 1 h3 okB3320
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 6 = true := blkChk_join _ _ _ _ _ 3316 5 1 h4 okB3321
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 7 = true := blkChk_join _ _ _ _ _ 3316 6 1 h5 okB3322
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 8 = true := blkChk_join _ _ _ _ _ 3316 7 1 h6 okB3323
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 9 = true := blkChk_join _ _ _ _ _ 3316 8 1 h7 okB3324
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 10 = true := blkChk_join _ _ _ _ _ 3316 9 1 h8 okB3325
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 11 = true := blkChk_join _ _ _ _ _ 3316 10 1 h9 okB3326
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3316 12 = true := blkChk_join _ _ _ _ _ 3316 11 1 h10 okB3327
  exact h11
end E1.C284X
