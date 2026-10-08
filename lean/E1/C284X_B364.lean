module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3430 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3431 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3431 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3432 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3432 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3433 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3433 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3434 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3434 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3435 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3435 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3436 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3436 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3437 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3437 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG364 : glueChkR lits W 3430 8 = true := by
  rw [← glueChkRN_eq lits W 7747 3430 lenT]; decide +kernel
theorem okM364 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 1 = true := okB3430
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 2 = true := blkChk_join _ _ _ _ _ 3430 1 1 h0 okB3431
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 3 = true := blkChk_join _ _ _ _ _ 3430 2 1 h1 okB3432
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 4 = true := blkChk_join _ _ _ _ _ 3430 3 1 h2 okB3433
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 5 = true := blkChk_join _ _ _ _ _ 3430 4 1 h3 okB3434
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 6 = true := blkChk_join _ _ _ _ _ 3430 5 1 h4 okB3435
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 7 = true := blkChk_join _ _ _ _ _ 3430 6 1 h5 okB3436
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3430 8 = true := blkChk_join _ _ _ _ _ 3430 7 1 h6 okB3437
  exact h7
end E1.C284X
