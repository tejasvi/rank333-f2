module
public import R22Port.U_d41d8cd98f00
public import E1.C402X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C402X
open E1S
theorem okB2009 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 1 = true := by decide +kernel
theorem okB2010 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2010 1 = true := by decide +kernel
theorem okB2011 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2011 1 = true := by decide +kernel
theorem okB2012 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2012 1 = true := by decide +kernel
theorem okB2013 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2013 1 = true := by decide +kernel
theorem okB2014 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2014 1 = true := by decide +kernel
theorem okB2015 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2015 1 = true := by decide +kernel
theorem okB2016 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2016 1 = true := by decide +kernel
theorem okG196 : glueChkR lits W 2009 8 = true := by decide +kernel
theorem okM196 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 8 = true := by
  have h0 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 1 = true := okB2009
  have h1 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 2 = true := blkChk_join _ _ _ _ _ 2009 1 1 h0 okB2010
  have h2 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 3 = true := blkChk_join _ _ _ _ _ 2009 2 1 h1 okB2011
  have h3 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 4 = true := blkChk_join _ _ _ _ _ 2009 3 1 h2 okB2012
  have h4 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 5 = true := blkChk_join _ _ _ _ _ 2009 4 1 h3 okB2013
  have h5 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 6 = true := blkChk_join _ _ _ _ _ 2009 5 1 h4 okB2014
  have h6 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 7 = true := blkChk_join _ _ _ _ _ 2009 6 1 h5 okB2015
  have h7 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 2009 8 = true := blkChk_join _ _ _ _ _ 2009 7 1 h6 okB2016
  exact h7
end E1.C402X
