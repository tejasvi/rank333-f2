module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB361 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB362 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 362 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB363 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 363 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB364 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 364 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB365 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 365 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB366 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 366 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB367 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 367 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB368 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB369 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG38 : glueChkR lits W 361 9 = true := by
  rw [← glueChkRN_eq lits W 7747 361 lenT]; decide +kernel
theorem okM38 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 1 = true := okB361
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 2 = true := blkChk_join _ _ _ _ _ 361 1 1 h0 okB362
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 3 = true := blkChk_join _ _ _ _ _ 361 2 1 h1 okB363
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 4 = true := blkChk_join _ _ _ _ _ 361 3 1 h2 okB364
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 5 = true := blkChk_join _ _ _ _ _ 361 4 1 h3 okB365
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 6 = true := blkChk_join _ _ _ _ _ 361 5 1 h4 okB366
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 7 = true := blkChk_join _ _ _ _ _ 361 6 1 h5 okB367
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 8 = true := blkChk_join _ _ _ _ _ 361 7 1 h6 okB368
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 361 9 = true := blkChk_join _ _ _ _ _ 361 8 1 h7 okB369
  exact h8
end E1.C284X
