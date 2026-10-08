module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5438 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5439 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5439 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5440 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5440 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5441 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5441 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5442 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5442 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5443 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5443 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5444 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5444 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5445 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5445 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5446 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5447 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5447 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5448 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5448 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5449 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5449 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5450 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5450 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG577 : glueChkR lits W 5438 13 = true := by
  rw [← glueChkRN_eq lits W 7747 5438 lenT]; decide +kernel
theorem okM577 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 1 = true := okB5438
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 2 = true := blkChk_join _ _ _ _ _ 5438 1 1 h0 okB5439
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 3 = true := blkChk_join _ _ _ _ _ 5438 2 1 h1 okB5440
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 4 = true := blkChk_join _ _ _ _ _ 5438 3 1 h2 okB5441
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 5 = true := blkChk_join _ _ _ _ _ 5438 4 1 h3 okB5442
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 6 = true := blkChk_join _ _ _ _ _ 5438 5 1 h4 okB5443
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 7 = true := blkChk_join _ _ _ _ _ 5438 6 1 h5 okB5444
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 8 = true := blkChk_join _ _ _ _ _ 5438 7 1 h6 okB5445
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 9 = true := blkChk_join _ _ _ _ _ 5438 8 1 h7 okB5446
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 10 = true := blkChk_join _ _ _ _ _ 5438 9 1 h8 okB5447
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 11 = true := blkChk_join _ _ _ _ _ 5438 10 1 h9 okB5448
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 12 = true := blkChk_join _ _ _ _ _ 5438 11 1 h10 okB5449
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5438 13 = true := blkChk_join _ _ _ _ _ 5438 12 1 h11 okB5450
  exact h12
end E1.C284X
