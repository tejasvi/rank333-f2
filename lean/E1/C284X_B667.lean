module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6403 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6404 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6404 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6405 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6405 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6406 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6406 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6407 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6407 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6408 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6408 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6409 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6409 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6410 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6410 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6411 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6411 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6412 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6412 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6413 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6413 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG667 : glueChkR lits W 6403 11 = true := by
  rw [← glueChkRN_eq lits W 7747 6403 lenT]; decide +kernel
theorem okM667 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 1 = true := okB6403
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 2 = true := blkChk_join _ _ _ _ _ 6403 1 1 h0 okB6404
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 3 = true := blkChk_join _ _ _ _ _ 6403 2 1 h1 okB6405
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 4 = true := blkChk_join _ _ _ _ _ 6403 3 1 h2 okB6406
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 5 = true := blkChk_join _ _ _ _ _ 6403 4 1 h3 okB6407
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 6 = true := blkChk_join _ _ _ _ _ 6403 5 1 h4 okB6408
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 7 = true := blkChk_join _ _ _ _ _ 6403 6 1 h5 okB6409
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 8 = true := blkChk_join _ _ _ _ _ 6403 7 1 h6 okB6410
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 9 = true := blkChk_join _ _ _ _ _ 6403 8 1 h7 okB6411
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 10 = true := blkChk_join _ _ _ _ _ 6403 9 1 h8 okB6412
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6403 11 = true := blkChk_join _ _ _ _ _ 6403 10 1 h9 okB6413
  exact h10
end E1.C284X
