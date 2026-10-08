module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6003 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6004 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6004 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6005 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6005 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6006 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6006 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6007 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6008 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6009 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6010 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG630 : glueChkR lits W 6003 8 = true := by
  rw [← glueChkRN_eq lits W 7747 6003 lenT]; decide +kernel
theorem okM630 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 1 = true := okB6003
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 2 = true := blkChk_join _ _ _ _ _ 6003 1 1 h0 okB6004
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 3 = true := blkChk_join _ _ _ _ _ 6003 2 1 h1 okB6005
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 4 = true := blkChk_join _ _ _ _ _ 6003 3 1 h2 okB6006
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 5 = true := blkChk_join _ _ _ _ _ 6003 4 1 h3 okB6007
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 6 = true := blkChk_join _ _ _ _ _ 6003 5 1 h4 okB6008
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 7 = true := blkChk_join _ _ _ _ _ 6003 6 1 h5 okB6009
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6003 8 = true := blkChk_join _ _ _ _ _ 6003 7 1 h6 okB6010
  exact h7
end E1.C284X
