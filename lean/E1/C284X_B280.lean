module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2590 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2591 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2591 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2592 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2592 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2593 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2593 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2594 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2594 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2595 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2595 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2596 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2596 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2597 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2597 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2598 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2598 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG280 : glueChkR lits W 2590 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2590 lenT]; decide +kernel
theorem okM280 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 1 = true := okB2590
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 2 = true := blkChk_join _ _ _ _ _ 2590 1 1 h0 okB2591
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 3 = true := blkChk_join _ _ _ _ _ 2590 2 1 h1 okB2592
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 4 = true := blkChk_join _ _ _ _ _ 2590 3 1 h2 okB2593
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 5 = true := blkChk_join _ _ _ _ _ 2590 4 1 h3 okB2594
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 6 = true := blkChk_join _ _ _ _ _ 2590 5 1 h4 okB2595
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 7 = true := blkChk_join _ _ _ _ _ 2590 6 1 h5 okB2596
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 8 = true := blkChk_join _ _ _ _ _ 2590 7 1 h6 okB2597
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2590 9 = true := blkChk_join _ _ _ _ _ 2590 8 1 h7 okB2598
  exact h8
end E1.C284X
