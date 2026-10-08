module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4465 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4466 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4466 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4467 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4467 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4468 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4468 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4469 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4469 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4470 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4471 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4471 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4472 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4472 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4473 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4473 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4474 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4474 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG474 : glueChkR lits W 4465 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4465 lenT]; decide +kernel
theorem okM474 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 1 = true := okB4465
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 2 = true := blkChk_join _ _ _ _ _ 4465 1 1 h0 okB4466
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 3 = true := blkChk_join _ _ _ _ _ 4465 2 1 h1 okB4467
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 4 = true := blkChk_join _ _ _ _ _ 4465 3 1 h2 okB4468
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 5 = true := blkChk_join _ _ _ _ _ 4465 4 1 h3 okB4469
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 6 = true := blkChk_join _ _ _ _ _ 4465 5 1 h4 okB4470
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 7 = true := blkChk_join _ _ _ _ _ 4465 6 1 h5 okB4471
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 8 = true := blkChk_join _ _ _ _ _ 4465 7 1 h6 okB4472
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 9 = true := blkChk_join _ _ _ _ _ 4465 8 1 h7 okB4473
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4465 10 = true := blkChk_join _ _ _ _ _ 4465 9 1 h8 okB4474
  exact h9
end E1.C284X
