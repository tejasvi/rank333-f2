module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4358 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4359 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4359 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4360 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4360 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4361 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4361 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4362 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4362 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4363 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4363 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4364 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4364 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4365 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4365 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4366 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4366 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG464 : glueChkR lits W 4358 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4358 lenT]; decide +kernel
theorem okM464 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 1 = true := okB4358
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 2 = true := blkChk_join _ _ _ _ _ 4358 1 1 h0 okB4359
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 3 = true := blkChk_join _ _ _ _ _ 4358 2 1 h1 okB4360
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 4 = true := blkChk_join _ _ _ _ _ 4358 3 1 h2 okB4361
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 5 = true := blkChk_join _ _ _ _ _ 4358 4 1 h3 okB4362
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 6 = true := blkChk_join _ _ _ _ _ 4358 5 1 h4 okB4363
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 7 = true := blkChk_join _ _ _ _ _ 4358 6 1 h5 okB4364
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 8 = true := blkChk_join _ _ _ _ _ 4358 7 1 h6 okB4365
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4358 9 = true := blkChk_join _ _ _ _ _ 4358 8 1 h7 okB4366
  exact h8
end E1.C284X
