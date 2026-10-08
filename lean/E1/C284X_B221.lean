module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2002 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2003 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2003 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2004 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2004 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2005 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2005 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2006 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2006 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2007 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2007 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2008 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2008 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2009 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2009 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2010 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2010 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2011 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2011 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG221 : glueChkR lits W 2002 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2002 lenT]; decide +kernel
theorem okM221 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 1 = true := okB2002
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 2 = true := blkChk_join _ _ _ _ _ 2002 1 1 h0 okB2003
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 3 = true := blkChk_join _ _ _ _ _ 2002 2 1 h1 okB2004
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 4 = true := blkChk_join _ _ _ _ _ 2002 3 1 h2 okB2005
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 5 = true := blkChk_join _ _ _ _ _ 2002 4 1 h3 okB2006
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 6 = true := blkChk_join _ _ _ _ _ 2002 5 1 h4 okB2007
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 7 = true := blkChk_join _ _ _ _ _ 2002 6 1 h5 okB2008
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 8 = true := blkChk_join _ _ _ _ _ 2002 7 1 h6 okB2009
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 9 = true := blkChk_join _ _ _ _ _ 2002 8 1 h7 okB2010
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2002 10 = true := blkChk_join _ _ _ _ _ 2002 9 1 h8 okB2011
  exact h9
end E1.C284X
