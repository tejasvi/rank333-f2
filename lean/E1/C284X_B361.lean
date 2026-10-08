module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3390 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3391 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3391 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3392 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3392 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3393 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3393 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3394 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3394 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3395 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3395 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3396 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3396 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3397 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3397 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3398 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3398 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3399 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3399 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3400 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3400 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3401 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3401 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3402 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3402 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3403 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3403 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG361 : glueChkR lits W 3390 14 = true := by
  rw [← glueChkRN_eq lits W 7747 3390 lenT]; decide +kernel
theorem okM361 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 14 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 1 = true := okB3390
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 2 = true := blkChk_join _ _ _ _ _ 3390 1 1 h0 okB3391
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 3 = true := blkChk_join _ _ _ _ _ 3390 2 1 h1 okB3392
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 4 = true := blkChk_join _ _ _ _ _ 3390 3 1 h2 okB3393
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 5 = true := blkChk_join _ _ _ _ _ 3390 4 1 h3 okB3394
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 6 = true := blkChk_join _ _ _ _ _ 3390 5 1 h4 okB3395
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 7 = true := blkChk_join _ _ _ _ _ 3390 6 1 h5 okB3396
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 8 = true := blkChk_join _ _ _ _ _ 3390 7 1 h6 okB3397
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 9 = true := blkChk_join _ _ _ _ _ 3390 8 1 h7 okB3398
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 10 = true := blkChk_join _ _ _ _ _ 3390 9 1 h8 okB3399
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 11 = true := blkChk_join _ _ _ _ _ 3390 10 1 h9 okB3400
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 12 = true := blkChk_join _ _ _ _ _ 3390 11 1 h10 okB3401
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 13 = true := blkChk_join _ _ _ _ _ 3390 12 1 h11 okB3402
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3390 14 = true := blkChk_join _ _ _ _ _ 3390 13 1 h12 okB3403
  exact h13
end E1.C284X
