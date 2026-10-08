module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2007 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2008 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2009 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2010 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2011 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2012 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2012 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2013 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2013 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2014 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2014 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2015 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2015 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2016 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2016 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG195 : glueChkR lits W 2007 10 = true := by
  rw [← glueChkRN_eq lits W 8596 2007 lenT]; decide +kernel
theorem okM195 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 1 = true := okB2007
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 2 = true := blkChk_join _ _ _ _ _ 2007 1 1 h0 okB2008
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 3 = true := blkChk_join _ _ _ _ _ 2007 2 1 h1 okB2009
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 4 = true := blkChk_join _ _ _ _ _ 2007 3 1 h2 okB2010
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 5 = true := blkChk_join _ _ _ _ _ 2007 4 1 h3 okB2011
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 6 = true := blkChk_join _ _ _ _ _ 2007 5 1 h4 okB2012
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 7 = true := blkChk_join _ _ _ _ _ 2007 6 1 h5 okB2013
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 8 = true := blkChk_join _ _ _ _ _ 2007 7 1 h6 okB2014
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 9 = true := blkChk_join _ _ _ _ _ 2007 8 1 h7 okB2015
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2007 10 = true := blkChk_join _ _ _ _ _ 2007 9 1 h8 okB2016
  exact h9
end E1.C236X
