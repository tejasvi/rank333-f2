module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2677 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2678 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2679 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2680 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2681 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2682 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2683 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2683 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2684 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2684 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG291 : glueChkR lits W 2676 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2676 lenT]; decide +kernel
theorem okM291 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 1 = true := okB2676
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 2 = true := blkChk_join _ _ _ _ _ 2676 1 1 h0 okB2677
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 3 = true := blkChk_join _ _ _ _ _ 2676 2 1 h1 okB2678
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 4 = true := blkChk_join _ _ _ _ _ 2676 3 1 h2 okB2679
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 5 = true := blkChk_join _ _ _ _ _ 2676 4 1 h3 okB2680
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 6 = true := blkChk_join _ _ _ _ _ 2676 5 1 h4 okB2681
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 7 = true := blkChk_join _ _ _ _ _ 2676 6 1 h5 okB2682
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 8 = true := blkChk_join _ _ _ _ _ 2676 7 1 h6 okB2683
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2676 9 = true := blkChk_join _ _ _ _ _ 2676 8 1 h7 okB2684
  exact h8
end E1.C284X
