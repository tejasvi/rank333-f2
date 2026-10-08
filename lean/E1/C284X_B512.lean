module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4868 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4869 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4870 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4871 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4872 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4873 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4874 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4875 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4876 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4877 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4878 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4878 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG512 : glueChkR lits W 4868 11 = true := by
  rw [← glueChkRN_eq lits W 7747 4868 lenT]; decide +kernel
theorem okM512 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 1 = true := okB4868
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 2 = true := blkChk_join _ _ _ _ _ 4868 1 1 h0 okB4869
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 3 = true := blkChk_join _ _ _ _ _ 4868 2 1 h1 okB4870
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 4 = true := blkChk_join _ _ _ _ _ 4868 3 1 h2 okB4871
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 5 = true := blkChk_join _ _ _ _ _ 4868 4 1 h3 okB4872
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 6 = true := blkChk_join _ _ _ _ _ 4868 5 1 h4 okB4873
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 7 = true := blkChk_join _ _ _ _ _ 4868 6 1 h5 okB4874
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 8 = true := blkChk_join _ _ _ _ _ 4868 7 1 h6 okB4875
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 9 = true := blkChk_join _ _ _ _ _ 4868 8 1 h7 okB4876
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 10 = true := blkChk_join _ _ _ _ _ 4868 9 1 h8 okB4877
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4868 11 = true := blkChk_join _ _ _ _ _ 4868 10 1 h9 okB4878
  exact h10
end E1.C284X
