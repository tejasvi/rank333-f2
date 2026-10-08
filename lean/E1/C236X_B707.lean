module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7524 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7525 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7525 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7526 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7526 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7527 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7528 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7529 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7530 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7531 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7532 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG707 : glueChkR lits W 7524 9 = true := by
  rw [← glueChkRN_eq lits W 8596 7524 lenT]; decide +kernel
theorem okM707 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 1 = true := okB7524
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 2 = true := blkChk_join _ _ _ _ _ 7524 1 1 h0 okB7525
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 3 = true := blkChk_join _ _ _ _ _ 7524 2 1 h1 okB7526
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 4 = true := blkChk_join _ _ _ _ _ 7524 3 1 h2 okB7527
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 5 = true := blkChk_join _ _ _ _ _ 7524 4 1 h3 okB7528
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 6 = true := blkChk_join _ _ _ _ _ 7524 5 1 h4 okB7529
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 7 = true := blkChk_join _ _ _ _ _ 7524 6 1 h5 okB7530
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 8 = true := blkChk_join _ _ _ _ _ 7524 7 1 h6 okB7531
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7524 9 = true := blkChk_join _ _ _ _ _ 7524 8 1 h7 okB7532
  exact h8
end E1.C236X
