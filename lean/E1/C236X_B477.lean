module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4867 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4868 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4869 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4870 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4871 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4872 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4873 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4874 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4875 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4876 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4877 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG477 : glueChkR lits W 4867 11 = true := by
  rw [← glueChkRN_eq lits W 8596 4867 lenT]; decide +kernel
theorem okM477 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 1 = true := okB4867
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 2 = true := blkChk_join _ _ _ _ _ 4867 1 1 h0 okB4868
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 3 = true := blkChk_join _ _ _ _ _ 4867 2 1 h1 okB4869
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 4 = true := blkChk_join _ _ _ _ _ 4867 3 1 h2 okB4870
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 5 = true := blkChk_join _ _ _ _ _ 4867 4 1 h3 okB4871
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 6 = true := blkChk_join _ _ _ _ _ 4867 5 1 h4 okB4872
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 7 = true := blkChk_join _ _ _ _ _ 4867 6 1 h5 okB4873
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 8 = true := blkChk_join _ _ _ _ _ 4867 7 1 h6 okB4874
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 9 = true := blkChk_join _ _ _ _ _ 4867 8 1 h7 okB4875
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 10 = true := blkChk_join _ _ _ _ _ 4867 9 1 h8 okB4876
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4867 11 = true := blkChk_join _ _ _ _ _ 4867 10 1 h9 okB4877
  exact h10
end E1.C236X
