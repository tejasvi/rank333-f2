module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2651 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2652 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2652 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2653 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2653 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2654 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2654 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2655 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2655 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2656 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2656 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG287 : glueChkR lits W 2651 6 = true := by
  rw [← glueChkRN_eq lits W 7747 2651 lenT]; decide +kernel
theorem okM287 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 1 = true := okB2651
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 2 = true := blkChk_join _ _ _ _ _ 2651 1 1 h0 okB2652
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 3 = true := blkChk_join _ _ _ _ _ 2651 2 1 h1 okB2653
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 4 = true := blkChk_join _ _ _ _ _ 2651 3 1 h2 okB2654
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 5 = true := blkChk_join _ _ _ _ _ 2651 4 1 h3 okB2655
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2651 6 = true := blkChk_join _ _ _ _ _ 2651 5 1 h4 okB2656
  exact h5
end E1.C284X
