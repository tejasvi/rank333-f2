module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6635 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6636 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6636 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6637 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6637 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6638 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6638 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6639 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6639 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6640 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6640 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6641 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6641 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6642 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6643 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6645 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6645 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6646 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6646 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG688 : glueChkR lits W 6635 12 = true := by
  rw [← glueChkRN_eq lits W 7747 6635 lenT]; decide +kernel
theorem okM688 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 1 = true := okB6635
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 2 = true := blkChk_join _ _ _ _ _ 6635 1 1 h0 okB6636
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 3 = true := blkChk_join _ _ _ _ _ 6635 2 1 h1 okB6637
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 4 = true := blkChk_join _ _ _ _ _ 6635 3 1 h2 okB6638
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 5 = true := blkChk_join _ _ _ _ _ 6635 4 1 h3 okB6639
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 6 = true := blkChk_join _ _ _ _ _ 6635 5 1 h4 okB6640
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 7 = true := blkChk_join _ _ _ _ _ 6635 6 1 h5 okB6641
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 8 = true := blkChk_join _ _ _ _ _ 6635 7 1 h6 okB6642
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 9 = true := blkChk_join _ _ _ _ _ 6635 8 1 h7 okB6643
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 10 = true := blkChk_join _ _ _ _ _ 6635 9 1 h8 okB6644
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 11 = true := blkChk_join _ _ _ _ _ 6635 10 1 h9 okB6645
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6635 12 = true := blkChk_join _ _ _ _ _ 6635 11 1 h10 okB6646
  exact h11
end E1.C284X
