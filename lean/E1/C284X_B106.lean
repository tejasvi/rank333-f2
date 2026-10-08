module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1002 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1003 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1003 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1004 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1004 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1005 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1005 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1006 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1006 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1007 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1008 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG106 : glueChkR lits W 1002 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1002 lenT]; decide +kernel
theorem okM106 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 1 = true := okB1002
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 2 = true := blkChk_join _ _ _ _ _ 1002 1 1 h0 okB1003
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 3 = true := blkChk_join _ _ _ _ _ 1002 2 1 h1 okB1004
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 4 = true := blkChk_join _ _ _ _ _ 1002 3 1 h2 okB1005
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 5 = true := blkChk_join _ _ _ _ _ 1002 4 1 h3 okB1006
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 6 = true := blkChk_join _ _ _ _ _ 1002 5 1 h4 okB1007
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1002 7 = true := blkChk_join _ _ _ _ _ 1002 6 1 h5 okB1008
  exact h6
end E1.C284X
