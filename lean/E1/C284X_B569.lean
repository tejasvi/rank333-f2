module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5361 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5362 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5362 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5363 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5363 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5364 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5364 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5365 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5365 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5366 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5366 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5367 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5367 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5368 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5368 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5369 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5369 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG569 : glueChkR lits W 5361 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5361 lenT]; decide +kernel
theorem okM569 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 1 = true := okB5361
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 2 = true := blkChk_join _ _ _ _ _ 5361 1 1 h0 okB5362
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 3 = true := blkChk_join _ _ _ _ _ 5361 2 1 h1 okB5363
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 4 = true := blkChk_join _ _ _ _ _ 5361 3 1 h2 okB5364
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 5 = true := blkChk_join _ _ _ _ _ 5361 4 1 h3 okB5365
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 6 = true := blkChk_join _ _ _ _ _ 5361 5 1 h4 okB5366
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 7 = true := blkChk_join _ _ _ _ _ 5361 6 1 h5 okB5367
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 8 = true := blkChk_join _ _ _ _ _ 5361 7 1 h6 okB5368
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5361 9 = true := blkChk_join _ _ _ _ _ 5361 8 1 h7 okB5369
  exact h8
end E1.C284X
