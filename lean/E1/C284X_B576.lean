module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5429 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5430 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5430 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5431 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5431 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5432 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5432 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5433 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5433 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5434 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5434 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5435 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5435 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5436 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5436 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5437 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5437 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG576 : glueChkR lits W 5429 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5429 lenT]; decide +kernel
theorem okM576 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 1 = true := okB5429
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 2 = true := blkChk_join _ _ _ _ _ 5429 1 1 h0 okB5430
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 3 = true := blkChk_join _ _ _ _ _ 5429 2 1 h1 okB5431
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 4 = true := blkChk_join _ _ _ _ _ 5429 3 1 h2 okB5432
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 5 = true := blkChk_join _ _ _ _ _ 5429 4 1 h3 okB5433
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 6 = true := blkChk_join _ _ _ _ _ 5429 5 1 h4 okB5434
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 7 = true := blkChk_join _ _ _ _ _ 5429 6 1 h5 okB5435
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 8 = true := blkChk_join _ _ _ _ _ 5429 7 1 h6 okB5436
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5429 9 = true := blkChk_join _ _ _ _ _ 5429 8 1 h7 okB5437
  exact h8
end E1.C284X
