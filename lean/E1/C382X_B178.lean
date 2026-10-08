module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB2007 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 1 = true := by decide +kernel
theorem okB2008 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2008 1 = true := by decide +kernel
theorem okB2009 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2009 1 = true := by decide +kernel
theorem okB2010 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2010 1 = true := by decide +kernel
theorem okB2011 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2011 1 = true := by decide +kernel
theorem okB2012 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2012 1 = true := by decide +kernel
theorem okB2013 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2013 1 = true := by decide +kernel
theorem okB2014 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2014 1 = true := by decide +kernel
theorem okB2015 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2015 1 = true := by decide +kernel
theorem okB2016 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2016 1 = true := by decide +kernel
theorem okB2017 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2017 1 = true := by decide +kernel
theorem okB2018 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2018 1 = true := by decide +kernel
theorem okB2019 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2019 1 = true := by decide +kernel
theorem okB2020 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2020 1 = true := by decide +kernel
theorem okB2021 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2021 1 = true := by decide +kernel
theorem okB2022 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2022 1 = true := by decide +kernel
theorem okG178 : glueChkR lits W 2007 16 = true := by decide +kernel
theorem okM178 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 16 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 1 = true := okB2007
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 2 = true := blkChk_join _ _ _ _ _ 2007 1 1 h0 okB2008
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 3 = true := blkChk_join _ _ _ _ _ 2007 2 1 h1 okB2009
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 4 = true := blkChk_join _ _ _ _ _ 2007 3 1 h2 okB2010
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 5 = true := blkChk_join _ _ _ _ _ 2007 4 1 h3 okB2011
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 6 = true := blkChk_join _ _ _ _ _ 2007 5 1 h4 okB2012
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 7 = true := blkChk_join _ _ _ _ _ 2007 6 1 h5 okB2013
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 8 = true := blkChk_join _ _ _ _ _ 2007 7 1 h6 okB2014
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 9 = true := blkChk_join _ _ _ _ _ 2007 8 1 h7 okB2015
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 10 = true := blkChk_join _ _ _ _ _ 2007 9 1 h8 okB2016
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 11 = true := blkChk_join _ _ _ _ _ 2007 10 1 h9 okB2017
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 12 = true := blkChk_join _ _ _ _ _ 2007 11 1 h10 okB2018
  have h12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 13 = true := blkChk_join _ _ _ _ _ 2007 12 1 h11 okB2019
  have h13 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 14 = true := blkChk_join _ _ _ _ _ 2007 13 1 h12 okB2020
  have h14 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 15 = true := blkChk_join _ _ _ _ _ 2007 14 1 h13 okB2021
  have h15 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 2007 16 = true := blkChk_join _ _ _ _ _ 2007 15 1 h14 okB2022
  exact h15
end E1.C382X
