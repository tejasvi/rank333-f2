module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5784 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5785 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5785 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5786 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5786 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5787 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5787 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5788 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5788 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5789 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5789 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5790 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5790 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5791 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5791 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5792 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5792 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5793 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5793 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5794 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5794 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG610 : glueChkR lits W 5784 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5784 lenT]; decide +kernel
theorem okM610 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 1 = true := okB5784
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 2 = true := blkChk_join _ _ _ _ _ 5784 1 1 h0 okB5785
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 3 = true := blkChk_join _ _ _ _ _ 5784 2 1 h1 okB5786
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 4 = true := blkChk_join _ _ _ _ _ 5784 3 1 h2 okB5787
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 5 = true := blkChk_join _ _ _ _ _ 5784 4 1 h3 okB5788
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 6 = true := blkChk_join _ _ _ _ _ 5784 5 1 h4 okB5789
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 7 = true := blkChk_join _ _ _ _ _ 5784 6 1 h5 okB5790
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 8 = true := blkChk_join _ _ _ _ _ 5784 7 1 h6 okB5791
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 9 = true := blkChk_join _ _ _ _ _ 5784 8 1 h7 okB5792
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 10 = true := blkChk_join _ _ _ _ _ 5784 9 1 h8 okB5793
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5784 11 = true := blkChk_join _ _ _ _ _ 5784 10 1 h9 okB5794
  exact h10
end E1.C284X
