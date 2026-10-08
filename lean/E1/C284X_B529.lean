module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4995 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4996 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4996 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4997 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4997 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4998 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4998 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4999 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4999 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5000 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5000 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5001 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5001 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5002 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5002 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5003 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5003 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5004 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5004 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5005 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5005 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5006 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5006 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG529 : glueChkR lits W 4995 12 = true := by
  rw [← glueChkRN_eq lits W 7747 4995 lenT]; decide +kernel
theorem okM529 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 1 = true := okB4995
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 2 = true := blkChk_join _ _ _ _ _ 4995 1 1 h0 okB4996
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 3 = true := blkChk_join _ _ _ _ _ 4995 2 1 h1 okB4997
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 4 = true := blkChk_join _ _ _ _ _ 4995 3 1 h2 okB4998
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 5 = true := blkChk_join _ _ _ _ _ 4995 4 1 h3 okB4999
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 6 = true := blkChk_join _ _ _ _ _ 4995 5 1 h4 okB5000
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 7 = true := blkChk_join _ _ _ _ _ 4995 6 1 h5 okB5001
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 8 = true := blkChk_join _ _ _ _ _ 4995 7 1 h6 okB5002
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 9 = true := blkChk_join _ _ _ _ _ 4995 8 1 h7 okB5003
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 10 = true := blkChk_join _ _ _ _ _ 4995 9 1 h8 okB5004
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 11 = true := blkChk_join _ _ _ _ _ 4995 10 1 h9 okB5005
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4995 12 = true := blkChk_join _ _ _ _ _ 4995 11 1 h10 okB5006
  exact h11
end E1.C284X
