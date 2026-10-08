module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1995 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1996 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1996 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1997 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1997 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1998 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1998 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1999 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1999 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2000 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2000 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2001 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2001 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG220 : glueChkR lits W 1995 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1995 lenT]; decide +kernel
theorem okM220 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 1 = true := okB1995
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 2 = true := blkChk_join _ _ _ _ _ 1995 1 1 h0 okB1996
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 3 = true := blkChk_join _ _ _ _ _ 1995 2 1 h1 okB1997
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 4 = true := blkChk_join _ _ _ _ _ 1995 3 1 h2 okB1998
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 5 = true := blkChk_join _ _ _ _ _ 1995 4 1 h3 okB1999
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 6 = true := blkChk_join _ _ _ _ _ 1995 5 1 h4 okB2000
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1995 7 = true := blkChk_join _ _ _ _ _ 1995 6 1 h5 okB2001
  exact h6
end E1.C284X
