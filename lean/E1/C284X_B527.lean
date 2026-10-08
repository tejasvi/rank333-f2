module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4974 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4975 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4976 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4977 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4978 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4979 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4980 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4981 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4982 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4983 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4983 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4984 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4984 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4985 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG527 : glueChkR lits W 4974 12 = true := by
  rw [← glueChkRN_eq lits W 7747 4974 lenT]; decide +kernel
theorem okM527 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 1 = true := okB4974
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 2 = true := blkChk_join _ _ _ _ _ 4974 1 1 h0 okB4975
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 3 = true := blkChk_join _ _ _ _ _ 4974 2 1 h1 okB4976
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 4 = true := blkChk_join _ _ _ _ _ 4974 3 1 h2 okB4977
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 5 = true := blkChk_join _ _ _ _ _ 4974 4 1 h3 okB4978
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 6 = true := blkChk_join _ _ _ _ _ 4974 5 1 h4 okB4979
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 7 = true := blkChk_join _ _ _ _ _ 4974 6 1 h5 okB4980
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 8 = true := blkChk_join _ _ _ _ _ 4974 7 1 h6 okB4981
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 9 = true := blkChk_join _ _ _ _ _ 4974 8 1 h7 okB4982
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 10 = true := blkChk_join _ _ _ _ _ 4974 9 1 h8 okB4983
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 11 = true := blkChk_join _ _ _ _ _ 4974 10 1 h9 okB4984
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4974 12 = true := blkChk_join _ _ _ _ _ 4974 11 1 h10 okB4985
  exact h11
end E1.C284X
