module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB2010 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 1 = true := by decide +kernel
theorem okB2011 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2011 1 = true := by decide +kernel
theorem okB2012 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2012 1 = true := by decide +kernel
theorem okB2013 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2013 1 = true := by decide +kernel
theorem okB2014 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2014 1 = true := by decide +kernel
theorem okB2015 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2015 1 = true := by decide +kernel
theorem okB2016 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2016 1 = true := by decide +kernel
theorem okB2017 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2017 1 = true := by decide +kernel
theorem okB2018 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2018 1 = true := by decide +kernel
theorem okB2019 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2019 1 = true := by decide +kernel
theorem okG185 : glueChkR lits W 2010 10 = true := by decide +kernel
theorem okM185 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 1 = true := okB2010
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 2 = true := blkChk_join _ _ _ _ _ 2010 1 1 h0 okB2011
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 3 = true := blkChk_join _ _ _ _ _ 2010 2 1 h1 okB2012
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 4 = true := blkChk_join _ _ _ _ _ 2010 3 1 h2 okB2013
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 5 = true := blkChk_join _ _ _ _ _ 2010 4 1 h3 okB2014
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 6 = true := blkChk_join _ _ _ _ _ 2010 5 1 h4 okB2015
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 7 = true := blkChk_join _ _ _ _ _ 2010 6 1 h5 okB2016
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 8 = true := blkChk_join _ _ _ _ _ 2010 7 1 h6 okB2017
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 9 = true := blkChk_join _ _ _ _ _ 2010 8 1 h7 okB2018
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2010 10 = true := blkChk_join _ _ _ _ _ 2010 9 1 h8 okB2019
  exact h9
end E1.C213X
