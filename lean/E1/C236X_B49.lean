module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB520 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB521 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB522 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB523 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB524 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB525 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB526 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB527 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB528 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG49 : glueChkR lits W 520 9 = true := by
  rw [← glueChkRN_eq lits W 8596 520 lenT]; decide +kernel
theorem okM49 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 1 = true := okB520
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 2 = true := blkChk_join _ _ _ _ _ 520 1 1 h0 okB521
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 3 = true := blkChk_join _ _ _ _ _ 520 2 1 h1 okB522
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 4 = true := blkChk_join _ _ _ _ _ 520 3 1 h2 okB523
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 5 = true := blkChk_join _ _ _ _ _ 520 4 1 h3 okB524
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 6 = true := blkChk_join _ _ _ _ _ 520 5 1 h4 okB525
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 7 = true := blkChk_join _ _ _ _ _ 520 6 1 h5 okB526
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 8 = true := blkChk_join _ _ _ _ _ 520 7 1 h6 okB527
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 520 9 = true := blkChk_join _ _ _ _ _ 520 8 1 h7 okB528
  exact h8
end E1.C236X
