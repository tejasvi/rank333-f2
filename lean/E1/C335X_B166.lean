module
public import R22Port.U_d41d8cd98f00
public import E1.C335X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C335X
open E1S
theorem okB1994 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 1 = true := by decide +kernel
theorem okB1995 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1995 1 = true := by decide +kernel
theorem okB1996 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1996 1 = true := by decide +kernel
theorem okB1997 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1997 1 = true := by decide +kernel
theorem okB1998 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1998 1 = true := by decide +kernel
theorem okB1999 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1999 1 = true := by decide +kernel
theorem okB2000 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 2000 1 = true := by decide +kernel
theorem okB2001 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 2001 1 = true := by decide +kernel
theorem okB2002 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 2002 1 = true := by decide +kernel
theorem okB2003 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 2003 1 = true := by decide +kernel
theorem okG166 : glueChkR lits W 1994 10 = true := by decide +kernel
theorem okM166 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 10 = true := by
  have h0 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 1 = true := okB1994
  have h1 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 2 = true := blkChk_join _ _ _ _ _ 1994 1 1 h0 okB1995
  have h2 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 3 = true := blkChk_join _ _ _ _ _ 1994 2 1 h1 okB1996
  have h3 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 4 = true := blkChk_join _ _ _ _ _ 1994 3 1 h2 okB1997
  have h4 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 5 = true := blkChk_join _ _ _ _ _ 1994 4 1 h3 okB1998
  have h5 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 6 = true := blkChk_join _ _ _ _ _ 1994 5 1 h4 okB1999
  have h6 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 7 = true := blkChk_join _ _ _ _ _ 1994 6 1 h5 okB2000
  have h7 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 8 = true := blkChk_join _ _ _ _ _ 1994 7 1 h6 okB2001
  have h8 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 9 = true := blkChk_join _ _ _ _ _ 1994 8 1 h7 okB2002
  have h9 : blkChk E1.IP_e335.C E1.SL_e335.entry E1.IP_e335.UB E1.IP_e335.UBR lits 1994 10 = true := blkChk_join _ _ _ _ _ 1994 9 1 h8 okB2003
  exact h9
end E1.C335X
