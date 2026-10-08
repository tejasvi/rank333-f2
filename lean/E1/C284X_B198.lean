module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1799 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1800 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1800 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1801 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1801 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1802 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1803 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1804 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1805 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1806 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1807 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1808 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG198 : glueChkR lits W 1799 10 = true := by
  rw [← glueChkRN_eq lits W 7747 1799 lenT]; decide +kernel
theorem okM198 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 1 = true := okB1799
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 2 = true := blkChk_join _ _ _ _ _ 1799 1 1 h0 okB1800
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 3 = true := blkChk_join _ _ _ _ _ 1799 2 1 h1 okB1801
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 4 = true := blkChk_join _ _ _ _ _ 1799 3 1 h2 okB1802
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 5 = true := blkChk_join _ _ _ _ _ 1799 4 1 h3 okB1803
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 6 = true := blkChk_join _ _ _ _ _ 1799 5 1 h4 okB1804
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 7 = true := blkChk_join _ _ _ _ _ 1799 6 1 h5 okB1805
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 8 = true := blkChk_join _ _ _ _ _ 1799 7 1 h6 okB1806
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 9 = true := blkChk_join _ _ _ _ _ 1799 8 1 h7 okB1807
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1799 10 = true := blkChk_join _ _ _ _ _ 1799 9 1 h8 okB1808
  exact h9
end E1.C284X
