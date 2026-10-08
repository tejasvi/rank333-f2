module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6553 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6554 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6554 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6555 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6555 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6556 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6556 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6557 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6557 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6558 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6558 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6559 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6559 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6560 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6560 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6561 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6561 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6562 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6562 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6563 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6563 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6564 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6564 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6565 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6565 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG682 : glueChkR lits W 6553 13 = true := by
  rw [← glueChkRN_eq lits W 7747 6553 lenT]; decide +kernel
theorem okM682 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 1 = true := okB6553
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 2 = true := blkChk_join _ _ _ _ _ 6553 1 1 h0 okB6554
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 3 = true := blkChk_join _ _ _ _ _ 6553 2 1 h1 okB6555
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 4 = true := blkChk_join _ _ _ _ _ 6553 3 1 h2 okB6556
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 5 = true := blkChk_join _ _ _ _ _ 6553 4 1 h3 okB6557
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 6 = true := blkChk_join _ _ _ _ _ 6553 5 1 h4 okB6558
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 7 = true := blkChk_join _ _ _ _ _ 6553 6 1 h5 okB6559
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 8 = true := blkChk_join _ _ _ _ _ 6553 7 1 h6 okB6560
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 9 = true := blkChk_join _ _ _ _ _ 6553 8 1 h7 okB6561
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 10 = true := blkChk_join _ _ _ _ _ 6553 9 1 h8 okB6562
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 11 = true := blkChk_join _ _ _ _ _ 6553 10 1 h9 okB6563
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 12 = true := blkChk_join _ _ _ _ _ 6553 11 1 h10 okB6564
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6553 13 = true := blkChk_join _ _ _ _ _ 6553 12 1 h11 okB6565
  exact h12
end E1.C284X
