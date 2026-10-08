module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB808 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB809 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB810 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB811 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB812 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB813 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB814 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB815 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB816 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB817 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG87 : glueChkR lits W 808 10 = true := by
  rw [← glueChkRN_eq lits W 7747 808 lenT]; decide +kernel
theorem okM87 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 1 = true := okB808
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 2 = true := blkChk_join _ _ _ _ _ 808 1 1 h0 okB809
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 3 = true := blkChk_join _ _ _ _ _ 808 2 1 h1 okB810
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 4 = true := blkChk_join _ _ _ _ _ 808 3 1 h2 okB811
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 5 = true := blkChk_join _ _ _ _ _ 808 4 1 h3 okB812
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 6 = true := blkChk_join _ _ _ _ _ 808 5 1 h4 okB813
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 7 = true := blkChk_join _ _ _ _ _ 808 6 1 h5 okB814
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 8 = true := blkChk_join _ _ _ _ _ 808 7 1 h6 okB815
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 9 = true := blkChk_join _ _ _ _ _ 808 8 1 h7 okB816
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 808 10 = true := blkChk_join _ _ _ _ _ 808 9 1 h8 okB817
  exact h9
end E1.C284X
