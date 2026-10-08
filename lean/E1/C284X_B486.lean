module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4600 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4601 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4601 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4602 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4602 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4603 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4603 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4604 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4604 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4605 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4605 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4606 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4606 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4607 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4607 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4608 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4608 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4609 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4609 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG486 : glueChkR lits W 4600 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4600 lenT]; decide +kernel
theorem okM486 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 1 = true := okB4600
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 2 = true := blkChk_join _ _ _ _ _ 4600 1 1 h0 okB4601
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 3 = true := blkChk_join _ _ _ _ _ 4600 2 1 h1 okB4602
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 4 = true := blkChk_join _ _ _ _ _ 4600 3 1 h2 okB4603
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 5 = true := blkChk_join _ _ _ _ _ 4600 4 1 h3 okB4604
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 6 = true := blkChk_join _ _ _ _ _ 4600 5 1 h4 okB4605
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 7 = true := blkChk_join _ _ _ _ _ 4600 6 1 h5 okB4606
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 8 = true := blkChk_join _ _ _ _ _ 4600 7 1 h6 okB4607
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 9 = true := blkChk_join _ _ _ _ _ 4600 8 1 h7 okB4608
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4600 10 = true := blkChk_join _ _ _ _ _ 4600 9 1 h8 okB4609
  exact h9
end E1.C284X
