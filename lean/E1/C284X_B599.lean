module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5670 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5671 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5671 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5672 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5672 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5673 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5673 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5674 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5674 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5677 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5678 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5679 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5679 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5680 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5680 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5681 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5681 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5682 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5682 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG599 : glueChkR lits W 5670 13 = true := by
  rw [← glueChkRN_eq lits W 7747 5670 lenT]; decide +kernel
theorem okM599 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 1 = true := okB5670
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 2 = true := blkChk_join _ _ _ _ _ 5670 1 1 h0 okB5671
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 3 = true := blkChk_join _ _ _ _ _ 5670 2 1 h1 okB5672
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 4 = true := blkChk_join _ _ _ _ _ 5670 3 1 h2 okB5673
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 5 = true := blkChk_join _ _ _ _ _ 5670 4 1 h3 okB5674
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 6 = true := blkChk_join _ _ _ _ _ 5670 5 1 h4 okB5675
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 7 = true := blkChk_join _ _ _ _ _ 5670 6 1 h5 okB5676
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 8 = true := blkChk_join _ _ _ _ _ 5670 7 1 h6 okB5677
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 9 = true := blkChk_join _ _ _ _ _ 5670 8 1 h7 okB5678
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 10 = true := blkChk_join _ _ _ _ _ 5670 9 1 h8 okB5679
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 11 = true := blkChk_join _ _ _ _ _ 5670 10 1 h9 okB5680
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 12 = true := blkChk_join _ _ _ _ _ 5670 11 1 h10 okB5681
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5670 13 = true := blkChk_join _ _ _ _ _ 5670 12 1 h11 okB5682
  exact h12
end E1.C284X
