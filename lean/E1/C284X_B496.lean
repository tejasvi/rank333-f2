module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4695 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4696 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4696 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4697 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4697 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4698 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4698 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4699 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4699 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4700 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4700 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4701 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4701 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4702 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4702 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4703 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4704 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4705 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4706 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG496 : glueChkR lits W 4695 13 = true := by
  rw [← glueChkRN_eq lits W 7747 4695 lenT]; decide +kernel
theorem okM496 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 1 = true := okB4695
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 2 = true := blkChk_join _ _ _ _ _ 4695 1 1 h0 okB4696
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 3 = true := blkChk_join _ _ _ _ _ 4695 2 1 h1 okB4697
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 4 = true := blkChk_join _ _ _ _ _ 4695 3 1 h2 okB4698
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 5 = true := blkChk_join _ _ _ _ _ 4695 4 1 h3 okB4699
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 6 = true := blkChk_join _ _ _ _ _ 4695 5 1 h4 okB4700
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 7 = true := blkChk_join _ _ _ _ _ 4695 6 1 h5 okB4701
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 8 = true := blkChk_join _ _ _ _ _ 4695 7 1 h6 okB4702
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 9 = true := blkChk_join _ _ _ _ _ 4695 8 1 h7 okB4703
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 10 = true := blkChk_join _ _ _ _ _ 4695 9 1 h8 okB4704
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 11 = true := blkChk_join _ _ _ _ _ 4695 10 1 h9 okB4705
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 12 = true := blkChk_join _ _ _ _ _ 4695 11 1 h10 okB4706
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4695 13 = true := blkChk_join _ _ _ _ _ 4695 12 1 h11 okB4707
  exact h12
end E1.C284X
