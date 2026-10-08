module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4879 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4880 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4880 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4881 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4881 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4882 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4883 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4884 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4885 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4886 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4887 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4888 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG513 : glueChkR lits W 4879 10 = true := by
  rw [← glueChkRN_eq lits W 7747 4879 lenT]; decide +kernel
theorem okM513 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 1 = true := okB4879
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 2 = true := blkChk_join _ _ _ _ _ 4879 1 1 h0 okB4880
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 3 = true := blkChk_join _ _ _ _ _ 4879 2 1 h1 okB4881
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 4 = true := blkChk_join _ _ _ _ _ 4879 3 1 h2 okB4882
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 5 = true := blkChk_join _ _ _ _ _ 4879 4 1 h3 okB4883
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 6 = true := blkChk_join _ _ _ _ _ 4879 5 1 h4 okB4884
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 7 = true := blkChk_join _ _ _ _ _ 4879 6 1 h5 okB4885
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 8 = true := blkChk_join _ _ _ _ _ 4879 7 1 h6 okB4886
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 9 = true := blkChk_join _ _ _ _ _ 4879 8 1 h7 okB4887
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4879 10 = true := blkChk_join _ _ _ _ _ 4879 9 1 h8 okB4888
  exact h9
end E1.C284X
