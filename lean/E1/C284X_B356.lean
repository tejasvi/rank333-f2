module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3338 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3339 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3339 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3340 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3340 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3341 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3341 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3342 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3342 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3343 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3343 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3344 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3344 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3345 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3345 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3346 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3346 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3347 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3347 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3348 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3348 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG356 : glueChkR lits W 3338 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3338 lenT]; decide +kernel
theorem okM356 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 1 = true := okB3338
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 2 = true := blkChk_join _ _ _ _ _ 3338 1 1 h0 okB3339
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 3 = true := blkChk_join _ _ _ _ _ 3338 2 1 h1 okB3340
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 4 = true := blkChk_join _ _ _ _ _ 3338 3 1 h2 okB3341
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 5 = true := blkChk_join _ _ _ _ _ 3338 4 1 h3 okB3342
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 6 = true := blkChk_join _ _ _ _ _ 3338 5 1 h4 okB3343
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 7 = true := blkChk_join _ _ _ _ _ 3338 6 1 h5 okB3344
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 8 = true := blkChk_join _ _ _ _ _ 3338 7 1 h6 okB3345
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 9 = true := blkChk_join _ _ _ _ _ 3338 8 1 h7 okB3346
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 10 = true := blkChk_join _ _ _ _ _ 3338 9 1 h8 okB3347
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3338 11 = true := blkChk_join _ _ _ _ _ 3338 10 1 h9 okB3348
  exact h10
end E1.C284X
