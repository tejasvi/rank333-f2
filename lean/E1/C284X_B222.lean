module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2012 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2013 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2014 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2015 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2016 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2017 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2017 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG222 : glueChkR lits W 2012 6 = true := by
  rw [← glueChkRN_eq lits W 7747 2012 lenT]; decide +kernel
theorem okM222 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 1 = true := okB2012
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 2 = true := blkChk_join _ _ _ _ _ 2012 1 1 h0 okB2013
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 3 = true := blkChk_join _ _ _ _ _ 2012 2 1 h1 okB2014
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 4 = true := blkChk_join _ _ _ _ _ 2012 3 1 h2 okB2015
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 5 = true := blkChk_join _ _ _ _ _ 2012 4 1 h3 okB2016
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2012 6 = true := blkChk_join _ _ _ _ _ 2012 5 1 h4 okB2017
  exact h5
end E1.C284X
