module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6494 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6495 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6495 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6496 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6496 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6497 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6497 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6498 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6498 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6499 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6499 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6500 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6500 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6501 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6501 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG677 : glueChkR lits W 6494 8 = true := by
  rw [← glueChkRN_eq lits W 7747 6494 lenT]; decide +kernel
theorem okM677 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 1 = true := okB6494
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 2 = true := blkChk_join _ _ _ _ _ 6494 1 1 h0 okB6495
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 3 = true := blkChk_join _ _ _ _ _ 6494 2 1 h1 okB6496
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 4 = true := blkChk_join _ _ _ _ _ 6494 3 1 h2 okB6497
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 5 = true := blkChk_join _ _ _ _ _ 6494 4 1 h3 okB6498
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 6 = true := blkChk_join _ _ _ _ _ 6494 5 1 h4 okB6499
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 7 = true := blkChk_join _ _ _ _ _ 6494 6 1 h5 okB6500
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6494 8 = true := blkChk_join _ _ _ _ _ 6494 7 1 h6 okB6501
  exact h7
end E1.C284X
