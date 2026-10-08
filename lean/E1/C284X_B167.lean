module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1528 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1528 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1529 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1530 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1531 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1531 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG167 : glueChkR lits W 1527 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1527 lenT]; decide +kernel
theorem okM167 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 1 = true := okB1527
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 2 = true := blkChk_join _ _ _ _ _ 1527 1 1 h0 okB1528
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 3 = true := blkChk_join _ _ _ _ _ 1527 2 1 h1 okB1529
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 4 = true := blkChk_join _ _ _ _ _ 1527 3 1 h2 okB1530
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 5 = true := blkChk_join _ _ _ _ _ 1527 4 1 h3 okB1531
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1527 6 = true := blkChk_join _ _ _ _ _ 1527 5 1 h4 okB1532
  exact h5
end E1.C284X
