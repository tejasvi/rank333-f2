module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4744 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4745 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4745 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4746 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4746 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4747 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4747 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4748 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4748 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4749 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4749 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4750 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4750 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4751 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4751 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4752 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4752 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4753 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4753 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG501 : glueChkR lits W 4744 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4744 lenT]; decide +kernel
theorem okM501 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 1 = true := okB4744
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 2 = true := blkChk_join _ _ _ _ _ 4744 1 1 h0 okB4745
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 3 = true := blkChk_join _ _ _ _ _ 4744 2 1 h1 okB4746
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 4 = true := blkChk_join _ _ _ _ _ 4744 3 1 h2 okB4747
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 5 = true := blkChk_join _ _ _ _ _ 4744 4 1 h3 okB4748
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 6 = true := blkChk_join _ _ _ _ _ 4744 5 1 h4 okB4749
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 7 = true := blkChk_join _ _ _ _ _ 4744 6 1 h5 okB4750
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 8 = true := blkChk_join _ _ _ _ _ 4744 7 1 h6 okB4751
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 9 = true := blkChk_join _ _ _ _ _ 4744 8 1 h7 okB4752
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4744 10 = true := blkChk_join _ _ _ _ _ 4744 9 1 h8 okB4753
  exact h9
end E1.C284X
