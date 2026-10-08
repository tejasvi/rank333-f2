module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3381 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3382 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3382 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3383 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3383 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3384 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3384 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3385 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3385 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3386 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3386 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3387 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3387 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3388 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3388 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3389 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3389 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG360 : glueChkR lits W 3381 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3381 lenT]; decide +kernel
theorem okM360 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 1 = true := okB3381
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 2 = true := blkChk_join _ _ _ _ _ 3381 1 1 h0 okB3382
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 3 = true := blkChk_join _ _ _ _ _ 3381 2 1 h1 okB3383
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 4 = true := blkChk_join _ _ _ _ _ 3381 3 1 h2 okB3384
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 5 = true := blkChk_join _ _ _ _ _ 3381 4 1 h3 okB3385
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 6 = true := blkChk_join _ _ _ _ _ 3381 5 1 h4 okB3386
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 7 = true := blkChk_join _ _ _ _ _ 3381 6 1 h5 okB3387
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 8 = true := blkChk_join _ _ _ _ _ 3381 7 1 h6 okB3388
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3381 9 = true := blkChk_join _ _ _ _ _ 3381 8 1 h7 okB3389
  exact h8
end E1.C284X
