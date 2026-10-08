module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2996 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2997 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2997 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2998 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2998 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2999 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2999 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3000 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3000 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3001 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3001 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3002 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3002 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3003 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3003 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3004 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3004 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3005 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3005 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3006 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3006 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3007 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3008 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3009 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG324 : glueChkR lits W 2996 14 = true := by
  rw [← glueChkRN_eq lits W 7747 2996 lenT]; decide +kernel
theorem okM324 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 14 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 1 = true := okB2996
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 2 = true := blkChk_join _ _ _ _ _ 2996 1 1 h0 okB2997
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 3 = true := blkChk_join _ _ _ _ _ 2996 2 1 h1 okB2998
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 4 = true := blkChk_join _ _ _ _ _ 2996 3 1 h2 okB2999
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 5 = true := blkChk_join _ _ _ _ _ 2996 4 1 h3 okB3000
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 6 = true := blkChk_join _ _ _ _ _ 2996 5 1 h4 okB3001
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 7 = true := blkChk_join _ _ _ _ _ 2996 6 1 h5 okB3002
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 8 = true := blkChk_join _ _ _ _ _ 2996 7 1 h6 okB3003
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 9 = true := blkChk_join _ _ _ _ _ 2996 8 1 h7 okB3004
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 10 = true := blkChk_join _ _ _ _ _ 2996 9 1 h8 okB3005
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 11 = true := blkChk_join _ _ _ _ _ 2996 10 1 h9 okB3006
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 12 = true := blkChk_join _ _ _ _ _ 2996 11 1 h10 okB3007
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 13 = true := blkChk_join _ _ _ _ _ 2996 12 1 h11 okB3008
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2996 14 = true := blkChk_join _ _ _ _ _ 2996 13 1 h12 okB3009
  exact h13
end E1.C284X
