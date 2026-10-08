module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3460 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3461 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3461 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3462 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3462 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3463 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3463 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3464 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3464 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3465 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3465 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3466 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3466 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3467 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3467 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3468 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3468 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3469 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3469 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG368 : glueChkR lits W 3460 10 = true := by
  rw [← glueChkRN_eq lits W 7747 3460 lenT]; decide +kernel
theorem okM368 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 1 = true := okB3460
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 2 = true := blkChk_join _ _ _ _ _ 3460 1 1 h0 okB3461
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 3 = true := blkChk_join _ _ _ _ _ 3460 2 1 h1 okB3462
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 4 = true := blkChk_join _ _ _ _ _ 3460 3 1 h2 okB3463
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 5 = true := blkChk_join _ _ _ _ _ 3460 4 1 h3 okB3464
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 6 = true := blkChk_join _ _ _ _ _ 3460 5 1 h4 okB3465
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 7 = true := blkChk_join _ _ _ _ _ 3460 6 1 h5 okB3466
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 8 = true := blkChk_join _ _ _ _ _ 3460 7 1 h6 okB3467
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 9 = true := blkChk_join _ _ _ _ _ 3460 8 1 h7 okB3468
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3460 10 = true := blkChk_join _ _ _ _ _ 3460 9 1 h8 okB3469
  exact h9
end E1.C284X
