module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7591 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7592 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7592 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7593 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7593 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7594 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7594 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7595 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7595 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7596 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7596 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7597 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7597 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7598 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7598 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7599 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7599 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7600 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7600 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG764 : glueChkR lits W 7591 10 = true := by
  rw [← glueChkRN_eq lits W 7747 7591 lenT]; decide +kernel
theorem okM764 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 1 = true := okB7591
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 2 = true := blkChk_join _ _ _ _ _ 7591 1 1 h0 okB7592
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 3 = true := blkChk_join _ _ _ _ _ 7591 2 1 h1 okB7593
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 4 = true := blkChk_join _ _ _ _ _ 7591 3 1 h2 okB7594
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 5 = true := blkChk_join _ _ _ _ _ 7591 4 1 h3 okB7595
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 6 = true := blkChk_join _ _ _ _ _ 7591 5 1 h4 okB7596
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 7 = true := blkChk_join _ _ _ _ _ 7591 6 1 h5 okB7597
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 8 = true := blkChk_join _ _ _ _ _ 7591 7 1 h6 okB7598
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 9 = true := blkChk_join _ _ _ _ _ 7591 8 1 h7 okB7599
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7591 10 = true := blkChk_join _ _ _ _ _ 7591 9 1 h8 okB7600
  exact h9
end E1.C284X
