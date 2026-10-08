module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4011 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4012 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4013 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4014 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4015 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG424 : glueChkR lits W 4011 5 = true := by
  rw [← glueChkRN_eq lits W 7747 4011 lenT]; decide +kernel
theorem okM424 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4011 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4011 1 = true := okB4011
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4011 2 = true := blkChk_join _ _ _ _ _ 4011 1 1 h0 okB4012
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4011 3 = true := blkChk_join _ _ _ _ _ 4011 2 1 h1 okB4013
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4011 4 = true := blkChk_join _ _ _ _ _ 4011 3 1 h2 okB4014
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4011 5 = true := blkChk_join _ _ _ _ _ 4011 4 1 h3 okB4015
  exact h4
end E1.C284X
