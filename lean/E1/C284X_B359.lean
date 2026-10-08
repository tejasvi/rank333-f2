module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3370 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3371 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3371 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3372 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3372 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3373 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3373 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3374 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3374 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3375 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3375 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3376 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3376 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3377 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3377 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3378 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3378 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3379 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3379 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3380 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3380 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG359 : glueChkR lits W 3370 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3370 lenT]; decide +kernel
theorem okM359 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 1 = true := okB3370
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 2 = true := blkChk_join _ _ _ _ _ 3370 1 1 h0 okB3371
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 3 = true := blkChk_join _ _ _ _ _ 3370 2 1 h1 okB3372
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 4 = true := blkChk_join _ _ _ _ _ 3370 3 1 h2 okB3373
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 5 = true := blkChk_join _ _ _ _ _ 3370 4 1 h3 okB3374
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 6 = true := blkChk_join _ _ _ _ _ 3370 5 1 h4 okB3375
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 7 = true := blkChk_join _ _ _ _ _ 3370 6 1 h5 okB3376
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 8 = true := blkChk_join _ _ _ _ _ 3370 7 1 h6 okB3377
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 9 = true := blkChk_join _ _ _ _ _ 3370 8 1 h7 okB3378
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 10 = true := blkChk_join _ _ _ _ _ 3370 9 1 h8 okB3379
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3370 11 = true := blkChk_join _ _ _ _ _ 3370 10 1 h9 okB3380
  exact h10
end E1.C284X
