module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3361 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3362 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3362 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3363 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3363 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3364 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3364 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3365 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3365 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3366 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3366 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3367 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3367 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3368 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3369 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG358 : glueChkR lits W 3361 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3361 lenT]; decide +kernel
theorem okM358 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 1 = true := okB3361
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 2 = true := blkChk_join _ _ _ _ _ 3361 1 1 h0 okB3362
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 3 = true := blkChk_join _ _ _ _ _ 3361 2 1 h1 okB3363
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 4 = true := blkChk_join _ _ _ _ _ 3361 3 1 h2 okB3364
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 5 = true := blkChk_join _ _ _ _ _ 3361 4 1 h3 okB3365
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 6 = true := blkChk_join _ _ _ _ _ 3361 5 1 h4 okB3366
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 7 = true := blkChk_join _ _ _ _ _ 3361 6 1 h5 okB3367
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 8 = true := blkChk_join _ _ _ _ _ 3361 7 1 h6 okB3368
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3361 9 = true := blkChk_join _ _ _ _ _ 3361 8 1 h7 okB3369
  exact h8
end E1.C284X
