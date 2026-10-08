module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5961 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5962 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5962 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5963 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5963 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5964 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5964 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5965 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5965 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5966 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5966 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5967 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5968 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5969 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5970 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5971 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5971 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG626 : glueChkR lits W 5961 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5961 lenT]; decide +kernel
theorem okM626 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 1 = true := okB5961
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 2 = true := blkChk_join _ _ _ _ _ 5961 1 1 h0 okB5962
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 3 = true := blkChk_join _ _ _ _ _ 5961 2 1 h1 okB5963
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 4 = true := blkChk_join _ _ _ _ _ 5961 3 1 h2 okB5964
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 5 = true := blkChk_join _ _ _ _ _ 5961 4 1 h3 okB5965
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 6 = true := blkChk_join _ _ _ _ _ 5961 5 1 h4 okB5966
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 7 = true := blkChk_join _ _ _ _ _ 5961 6 1 h5 okB5967
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 8 = true := blkChk_join _ _ _ _ _ 5961 7 1 h6 okB5968
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 9 = true := blkChk_join _ _ _ _ _ 5961 8 1 h7 okB5969
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 10 = true := blkChk_join _ _ _ _ _ 5961 9 1 h8 okB5970
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5961 11 = true := blkChk_join _ _ _ _ _ 5961 10 1 h9 okB5971
  exact h10
end E1.C284X
