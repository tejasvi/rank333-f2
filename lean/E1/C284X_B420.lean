module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3979 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3980 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3981 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3982 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3983 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3983 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3984 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3984 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3985 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3985 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3986 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3986 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3987 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG420 : glueChkR lits W 3979 9 = true := by
  rw [← glueChkRN_eq lits W 7747 3979 lenT]; decide +kernel
theorem okM420 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 1 = true := okB3979
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 2 = true := blkChk_join _ _ _ _ _ 3979 1 1 h0 okB3980
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 3 = true := blkChk_join _ _ _ _ _ 3979 2 1 h1 okB3981
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 4 = true := blkChk_join _ _ _ _ _ 3979 3 1 h2 okB3982
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 5 = true := blkChk_join _ _ _ _ _ 3979 4 1 h3 okB3983
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 6 = true := blkChk_join _ _ _ _ _ 3979 5 1 h4 okB3984
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 7 = true := blkChk_join _ _ _ _ _ 3979 6 1 h5 okB3985
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 8 = true := blkChk_join _ _ _ _ _ 3979 7 1 h6 okB3986
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3979 9 = true := blkChk_join _ _ _ _ _ 3979 8 1 h7 okB3987
  exact h8
end E1.C284X
