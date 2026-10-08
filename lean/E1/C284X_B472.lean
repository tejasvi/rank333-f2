module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4437 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4438 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4438 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4439 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4439 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4440 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4440 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4441 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4441 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4442 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4442 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4443 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4443 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4444 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4444 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4445 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4445 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4446 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4447 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4447 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4448 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4448 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4449 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4449 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4450 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4450 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4451 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4451 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4452 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4452 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG472 : glueChkR lits W 4437 16 = true := by
  rw [← glueChkRN_eq lits W 7747 4437 lenT]; decide +kernel
theorem okM472 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 1 = true := okB4437
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 2 = true := blkChk_join _ _ _ _ _ 4437 1 1 h0 okB4438
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 3 = true := blkChk_join _ _ _ _ _ 4437 2 1 h1 okB4439
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 4 = true := blkChk_join _ _ _ _ _ 4437 3 1 h2 okB4440
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 5 = true := blkChk_join _ _ _ _ _ 4437 4 1 h3 okB4441
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 6 = true := blkChk_join _ _ _ _ _ 4437 5 1 h4 okB4442
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 7 = true := blkChk_join _ _ _ _ _ 4437 6 1 h5 okB4443
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 8 = true := blkChk_join _ _ _ _ _ 4437 7 1 h6 okB4444
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 9 = true := blkChk_join _ _ _ _ _ 4437 8 1 h7 okB4445
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 10 = true := blkChk_join _ _ _ _ _ 4437 9 1 h8 okB4446
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 11 = true := blkChk_join _ _ _ _ _ 4437 10 1 h9 okB4447
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 12 = true := blkChk_join _ _ _ _ _ 4437 11 1 h10 okB4448
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 13 = true := blkChk_join _ _ _ _ _ 4437 12 1 h11 okB4449
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 14 = true := blkChk_join _ _ _ _ _ 4437 13 1 h12 okB4450
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 15 = true := blkChk_join _ _ _ _ _ 4437 14 1 h13 okB4451
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4437 16 = true := blkChk_join _ _ _ _ _ 4437 15 1 h14 okB4452
  exact h15
end E1.C284X
