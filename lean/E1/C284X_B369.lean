module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3470 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3471 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3471 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3472 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3472 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3473 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3473 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3474 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3474 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3475 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3475 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3476 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3476 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3477 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3477 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3478 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3478 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3479 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3479 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3480 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3480 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG369 : glueChkR lits W 3470 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3470 lenT]; decide +kernel
theorem okM369 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 1 = true := okB3470
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 2 = true := blkChk_join _ _ _ _ _ 3470 1 1 h0 okB3471
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 3 = true := blkChk_join _ _ _ _ _ 3470 2 1 h1 okB3472
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 4 = true := blkChk_join _ _ _ _ _ 3470 3 1 h2 okB3473
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 5 = true := blkChk_join _ _ _ _ _ 3470 4 1 h3 okB3474
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 6 = true := blkChk_join _ _ _ _ _ 3470 5 1 h4 okB3475
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 7 = true := blkChk_join _ _ _ _ _ 3470 6 1 h5 okB3476
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 8 = true := blkChk_join _ _ _ _ _ 3470 7 1 h6 okB3477
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 9 = true := blkChk_join _ _ _ _ _ 3470 8 1 h7 okB3478
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 10 = true := blkChk_join _ _ _ _ _ 3470 9 1 h8 okB3479
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3470 11 = true := blkChk_join _ _ _ _ _ 3470 10 1 h9 okB3480
  exact h10
end E1.C284X
