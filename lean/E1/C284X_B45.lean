module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB411 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB412 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 412 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB413 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 413 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB414 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 414 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB415 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 415 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB416 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 416 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG45 : glueChkR lits W 411 6 = true := by
  rw [← glueChkRN_eq lits W 7747 411 lenT]; decide +kernel
theorem okM45 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 1 = true := okB411
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 2 = true := blkChk_join _ _ _ _ _ 411 1 1 h0 okB412
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 3 = true := blkChk_join _ _ _ _ _ 411 2 1 h1 okB413
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 4 = true := blkChk_join _ _ _ _ _ 411 3 1 h2 okB414
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 5 = true := blkChk_join _ _ _ _ _ 411 4 1 h3 okB415
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 411 6 = true := blkChk_join _ _ _ _ _ 411 5 1 h4 okB416
  exact h5
end E1.C284X
