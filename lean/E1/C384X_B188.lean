module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2006 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 1 = true := by decide +kernel
theorem okB2007 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2007 1 = true := by decide +kernel
theorem okB2008 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2008 1 = true := by decide +kernel
theorem okB2009 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2009 1 = true := by decide +kernel
theorem okB2010 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2010 1 = true := by decide +kernel
theorem okB2011 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2011 1 = true := by decide +kernel
theorem okB2012 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2012 1 = true := by decide +kernel
theorem okB2013 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2013 1 = true := by decide +kernel
theorem okB2014 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2014 1 = true := by decide +kernel
theorem okB2015 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2015 1 = true := by decide +kernel
theorem okB2016 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2016 1 = true := by decide +kernel
theorem okB2017 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2017 1 = true := by decide +kernel
theorem okB2018 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2018 1 = true := by decide +kernel
theorem okG188 : glueChkR lits W 2006 13 = true := by decide +kernel
theorem okM188 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 1 = true := okB2006
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 2 = true := blkChk_join _ _ _ _ _ 2006 1 1 h0 okB2007
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 3 = true := blkChk_join _ _ _ _ _ 2006 2 1 h1 okB2008
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 4 = true := blkChk_join _ _ _ _ _ 2006 3 1 h2 okB2009
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 5 = true := blkChk_join _ _ _ _ _ 2006 4 1 h3 okB2010
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 6 = true := blkChk_join _ _ _ _ _ 2006 5 1 h4 okB2011
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 7 = true := blkChk_join _ _ _ _ _ 2006 6 1 h5 okB2012
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 8 = true := blkChk_join _ _ _ _ _ 2006 7 1 h6 okB2013
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 9 = true := blkChk_join _ _ _ _ _ 2006 8 1 h7 okB2014
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 10 = true := blkChk_join _ _ _ _ _ 2006 9 1 h8 okB2015
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 11 = true := blkChk_join _ _ _ _ _ 2006 10 1 h9 okB2016
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 12 = true := blkChk_join _ _ _ _ _ 2006 11 1 h10 okB2017
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2006 13 = true := blkChk_join _ _ _ _ _ 2006 12 1 h11 okB2018
  exact h12
end E1.C384X
