module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5597 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5598 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5598 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5599 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5599 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5600 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5600 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5601 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5601 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5602 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5602 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5603 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5603 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5604 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5604 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5605 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5605 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG592 : glueChkR lits W 5597 9 = true := by
  rw [← glueChkRN_eq lits W 7747 5597 lenT]; decide +kernel
theorem okM592 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 1 = true := okB5597
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 2 = true := blkChk_join _ _ _ _ _ 5597 1 1 h0 okB5598
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 3 = true := blkChk_join _ _ _ _ _ 5597 2 1 h1 okB5599
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 4 = true := blkChk_join _ _ _ _ _ 5597 3 1 h2 okB5600
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 5 = true := blkChk_join _ _ _ _ _ 5597 4 1 h3 okB5601
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 6 = true := blkChk_join _ _ _ _ _ 5597 5 1 h4 okB5602
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 7 = true := blkChk_join _ _ _ _ _ 5597 6 1 h5 okB5603
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 8 = true := blkChk_join _ _ _ _ _ 5597 7 1 h6 okB5604
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5597 9 = true := blkChk_join _ _ _ _ _ 5597 8 1 h7 okB5605
  exact h8
end E1.C284X
