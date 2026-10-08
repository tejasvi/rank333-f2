module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6944 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6945 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6945 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6946 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6946 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6947 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6947 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6948 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6948 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6949 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6949 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6950 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6950 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6951 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6951 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6952 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6952 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6953 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6953 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG713 : glueChkR lits W 6944 10 = true := by
  rw [← glueChkRN_eq lits W 7747 6944 lenT]; decide +kernel
theorem okM713 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 1 = true := okB6944
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 2 = true := blkChk_join _ _ _ _ _ 6944 1 1 h0 okB6945
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 3 = true := blkChk_join _ _ _ _ _ 6944 2 1 h1 okB6946
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 4 = true := blkChk_join _ _ _ _ _ 6944 3 1 h2 okB6947
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 5 = true := blkChk_join _ _ _ _ _ 6944 4 1 h3 okB6948
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 6 = true := blkChk_join _ _ _ _ _ 6944 5 1 h4 okB6949
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 7 = true := blkChk_join _ _ _ _ _ 6944 6 1 h5 okB6950
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 8 = true := blkChk_join _ _ _ _ _ 6944 7 1 h6 okB6951
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 9 = true := blkChk_join _ _ _ _ _ 6944 8 1 h7 okB6952
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6944 10 = true := blkChk_join _ _ _ _ _ 6944 9 1 h8 okB6953
  exact h9
end E1.C284X
