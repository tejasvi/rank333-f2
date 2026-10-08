module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3349 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3350 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3350 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3351 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3351 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3352 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3352 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3353 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3353 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3354 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3354 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3355 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3355 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3356 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3356 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3357 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3357 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3358 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3358 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3359 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3359 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3360 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3360 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG357 : glueChkR lits W 3349 12 = true := by
  rw [← glueChkRN_eq lits W 7747 3349 lenT]; decide +kernel
theorem okM357 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 1 = true := okB3349
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 2 = true := blkChk_join _ _ _ _ _ 3349 1 1 h0 okB3350
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 3 = true := blkChk_join _ _ _ _ _ 3349 2 1 h1 okB3351
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 4 = true := blkChk_join _ _ _ _ _ 3349 3 1 h2 okB3352
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 5 = true := blkChk_join _ _ _ _ _ 3349 4 1 h3 okB3353
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 6 = true := blkChk_join _ _ _ _ _ 3349 5 1 h4 okB3354
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 7 = true := blkChk_join _ _ _ _ _ 3349 6 1 h5 okB3355
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 8 = true := blkChk_join _ _ _ _ _ 3349 7 1 h6 okB3356
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 9 = true := blkChk_join _ _ _ _ _ 3349 8 1 h7 okB3357
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 10 = true := blkChk_join _ _ _ _ _ 3349 9 1 h8 okB3358
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 11 = true := blkChk_join _ _ _ _ _ 3349 10 1 h9 okB3359
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3349 12 = true := blkChk_join _ _ _ _ _ 3349 11 1 h10 okB3360
  exact h11
end E1.C284X
