module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB354 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB355 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 355 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB356 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 356 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB357 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 357 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB358 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 358 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB359 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 359 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB360 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 360 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG37 : glueChkR lits W 354 7 = true := by
  rw [← glueChkRN_eq lits W 7747 354 lenT]; decide +kernel
theorem okM37 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 1 = true := okB354
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 2 = true := blkChk_join _ _ _ _ _ 354 1 1 h0 okB355
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 3 = true := blkChk_join _ _ _ _ _ 354 2 1 h1 okB356
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 4 = true := blkChk_join _ _ _ _ _ 354 3 1 h2 okB357
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 5 = true := blkChk_join _ _ _ _ _ 354 4 1 h3 okB358
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 6 = true := blkChk_join _ _ _ _ _ 354 5 1 h4 okB359
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 354 7 = true := blkChk_join _ _ _ _ _ 354 6 1 h5 okB360
  exact h6
end E1.C284X
