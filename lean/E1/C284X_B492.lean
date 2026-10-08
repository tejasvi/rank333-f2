module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4656 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4657 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4657 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4658 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4658 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4659 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4659 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4660 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4660 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4661 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4661 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4662 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4662 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4663 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4663 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4664 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4664 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4665 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4665 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG492 : glueChkR lits W 4656 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4656 lenT]; decide +kernel
theorem okM492 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 1 = true := okB4656
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 2 = true := blkChk_join _ _ _ _ _ 4656 1 1 h0 okB4657
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 3 = true := blkChk_join _ _ _ _ _ 4656 2 1 h1 okB4658
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 4 = true := blkChk_join _ _ _ _ _ 4656 3 1 h2 okB4659
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 5 = true := blkChk_join _ _ _ _ _ 4656 4 1 h3 okB4660
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 6 = true := blkChk_join _ _ _ _ _ 4656 5 1 h4 okB4661
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 7 = true := blkChk_join _ _ _ _ _ 4656 6 1 h5 okB4662
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 8 = true := blkChk_join _ _ _ _ _ 4656 7 1 h6 okB4663
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 9 = true := blkChk_join _ _ _ _ _ 4656 8 1 h7 okB4664
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4656 10 = true := blkChk_join _ _ _ _ _ 4656 9 1 h8 okB4665
  exact h9
end E1.C284X
