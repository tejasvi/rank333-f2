module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4004 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4005 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4005 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4006 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4006 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4007 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4008 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4009 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4010 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG423 : glueChkR lits W 4004 7 = true := by
  rw [← glueChkRN_eq lits W 7747 4004 lenT]; decide +kernel
theorem okM423 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 1 = true := okB4004
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 2 = true := blkChk_join _ _ _ _ _ 4004 1 1 h0 okB4005
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 3 = true := blkChk_join _ _ _ _ _ 4004 2 1 h1 okB4006
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 4 = true := blkChk_join _ _ _ _ _ 4004 3 1 h2 okB4007
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 5 = true := blkChk_join _ _ _ _ _ 4004 4 1 h3 okB4008
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 6 = true := blkChk_join _ _ _ _ _ 4004 5 1 h4 okB4009
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4004 7 = true := blkChk_join _ _ _ _ _ 4004 6 1 h5 okB4010
  exact h6
end E1.C284X
