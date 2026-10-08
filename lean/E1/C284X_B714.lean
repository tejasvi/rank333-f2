module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6954 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6955 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6955 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6956 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6956 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6957 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6957 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6958 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6958 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6959 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6959 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6960 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6960 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6961 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6962 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6962 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6963 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6963 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG714 : glueChkR lits W 6954 10 = true := by
  rw [← glueChkRN_eq lits W 7747 6954 lenT]; decide +kernel
theorem okM714 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 1 = true := okB6954
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 2 = true := blkChk_join _ _ _ _ _ 6954 1 1 h0 okB6955
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 3 = true := blkChk_join _ _ _ _ _ 6954 2 1 h1 okB6956
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 4 = true := blkChk_join _ _ _ _ _ 6954 3 1 h2 okB6957
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 5 = true := blkChk_join _ _ _ _ _ 6954 4 1 h3 okB6958
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 6 = true := blkChk_join _ _ _ _ _ 6954 5 1 h4 okB6959
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 7 = true := blkChk_join _ _ _ _ _ 6954 6 1 h5 okB6960
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 8 = true := blkChk_join _ _ _ _ _ 6954 7 1 h6 okB6961
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 9 = true := blkChk_join _ _ _ _ _ 6954 8 1 h7 okB6962
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6954 10 = true := blkChk_join _ _ _ _ _ 6954 9 1 h8 okB6963
  exact h9
end E1.C284X
