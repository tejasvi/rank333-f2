module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB532 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB533 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 533 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB534 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 534 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB535 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 535 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB536 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 536 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB537 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 537 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 538 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG61 : glueChkR lits W 532 7 = true := by
  rw [← glueChkRN_eq lits W 7747 532 lenT]; decide +kernel
theorem okM61 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 1 = true := okB532
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 2 = true := blkChk_join _ _ _ _ _ 532 1 1 h0 okB533
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 3 = true := blkChk_join _ _ _ _ _ 532 2 1 h1 okB534
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 4 = true := blkChk_join _ _ _ _ _ 532 3 1 h2 okB535
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 5 = true := blkChk_join _ _ _ _ _ 532 4 1 h3 okB536
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 6 = true := blkChk_join _ _ _ _ _ 532 5 1 h4 okB537
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 532 7 = true := blkChk_join _ _ _ _ _ 532 6 1 h5 okB538
  exact h6
end E1.C284X
