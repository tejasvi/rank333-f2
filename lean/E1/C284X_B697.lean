module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6735 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6736 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6736 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6737 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6737 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6738 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6738 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6739 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6739 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6740 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6740 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6741 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6741 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6742 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6742 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6743 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6743 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG697 : glueChkR lits W 6735 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6735 lenT]; decide +kernel
theorem okM697 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 1 = true := okB6735
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 2 = true := blkChk_join _ _ _ _ _ 6735 1 1 h0 okB6736
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 3 = true := blkChk_join _ _ _ _ _ 6735 2 1 h1 okB6737
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 4 = true := blkChk_join _ _ _ _ _ 6735 3 1 h2 okB6738
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 5 = true := blkChk_join _ _ _ _ _ 6735 4 1 h3 okB6739
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 6 = true := blkChk_join _ _ _ _ _ 6735 5 1 h4 okB6740
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 7 = true := blkChk_join _ _ _ _ _ 6735 6 1 h5 okB6741
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 8 = true := blkChk_join _ _ _ _ _ 6735 7 1 h6 okB6742
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6735 9 = true := blkChk_join _ _ _ _ _ 6735 8 1 h7 okB6743
  exact h8
end E1.C284X
