module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2407 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2408 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2408 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2409 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2409 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2410 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2410 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2411 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2411 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2412 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2412 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2413 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2413 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2414 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2414 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2415 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2415 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG264 : glueChkR lits W 2407 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2407 lenT]; decide +kernel
theorem okM264 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 1 = true := okB2407
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 2 = true := blkChk_join _ _ _ _ _ 2407 1 1 h0 okB2408
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 3 = true := blkChk_join _ _ _ _ _ 2407 2 1 h1 okB2409
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 4 = true := blkChk_join _ _ _ _ _ 2407 3 1 h2 okB2410
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 5 = true := blkChk_join _ _ _ _ _ 2407 4 1 h3 okB2411
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 6 = true := blkChk_join _ _ _ _ _ 2407 5 1 h4 okB2412
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 7 = true := blkChk_join _ _ _ _ _ 2407 6 1 h5 okB2413
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 8 = true := blkChk_join _ _ _ _ _ 2407 7 1 h6 okB2414
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2407 9 = true := blkChk_join _ _ _ _ _ 2407 8 1 h7 okB2415
  exact h8
end E1.C284X
