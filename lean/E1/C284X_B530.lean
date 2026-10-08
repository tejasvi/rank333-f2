module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5007 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5008 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5009 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5010 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5011 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5012 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG530 : glueChkR lits W 5007 6 = true := by
  rw [← glueChkRN_eq lits W 7747 5007 lenT]; decide +kernel
theorem okM530 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 1 = true := okB5007
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 2 = true := blkChk_join _ _ _ _ _ 5007 1 1 h0 okB5008
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 3 = true := blkChk_join _ _ _ _ _ 5007 2 1 h1 okB5009
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 4 = true := blkChk_join _ _ _ _ _ 5007 3 1 h2 okB5010
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 5 = true := blkChk_join _ _ _ _ _ 5007 4 1 h3 okB5011
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5007 6 = true := blkChk_join _ _ _ _ _ 5007 5 1 h4 okB5012
  exact h5
end E1.C284X
