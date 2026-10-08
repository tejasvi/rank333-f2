module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3446 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3447 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3447 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3448 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3448 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3449 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3449 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3450 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3450 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3451 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3451 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3452 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3452 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3453 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3453 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG366 : glueChkR lits W 3446 8 = true := by
  rw [← glueChkRN_eq lits W 7747 3446 lenT]; decide +kernel
theorem okM366 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 1 = true := okB3446
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 2 = true := blkChk_join _ _ _ _ _ 3446 1 1 h0 okB3447
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 3 = true := blkChk_join _ _ _ _ _ 3446 2 1 h1 okB3448
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 4 = true := blkChk_join _ _ _ _ _ 3446 3 1 h2 okB3449
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 5 = true := blkChk_join _ _ _ _ _ 3446 4 1 h3 okB3450
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 6 = true := blkChk_join _ _ _ _ _ 3446 5 1 h4 okB3451
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 7 = true := blkChk_join _ _ _ _ _ 3446 6 1 h5 okB3452
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3446 8 = true := blkChk_join _ _ _ _ _ 3446 7 1 h6 okB3453
  exact h7
end E1.C284X
