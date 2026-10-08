module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1987 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1988 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1988 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1989 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1989 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1990 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1990 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1991 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1991 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1992 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1992 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1993 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1993 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1994 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1994 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG219 : glueChkR lits W 1987 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1987 lenT]; decide +kernel
theorem okM219 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 1 = true := okB1987
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 2 = true := blkChk_join _ _ _ _ _ 1987 1 1 h0 okB1988
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 3 = true := blkChk_join _ _ _ _ _ 1987 2 1 h1 okB1989
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 4 = true := blkChk_join _ _ _ _ _ 1987 3 1 h2 okB1990
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 5 = true := blkChk_join _ _ _ _ _ 1987 4 1 h3 okB1991
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 6 = true := blkChk_join _ _ _ _ _ 1987 5 1 h4 okB1992
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 7 = true := blkChk_join _ _ _ _ _ 1987 6 1 h5 okB1993
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1987 8 = true := blkChk_join _ _ _ _ _ 1987 7 1 h6 okB1994
  exact h7
end E1.C284X
