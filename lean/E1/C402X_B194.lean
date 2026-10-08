module
public import R22Port.U_d41d8cd98f00
public import E1.C402X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C402X
open E1S
theorem okB1985 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 1 = true := by decide +kernel
theorem okB1986 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1986 1 = true := by decide +kernel
theorem okB1987 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1987 1 = true := by decide +kernel
theorem okB1988 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1988 1 = true := by decide +kernel
theorem okB1989 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1989 1 = true := by decide +kernel
theorem okB1990 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1990 1 = true := by decide +kernel
theorem okB1991 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1991 1 = true := by decide +kernel
theorem okB1992 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1992 1 = true := by decide +kernel
theorem okB1993 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1993 1 = true := by decide +kernel
theorem okB1994 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1994 1 = true := by decide +kernel
theorem okG194 : glueChkR lits W 1985 10 = true := by decide +kernel
theorem okM194 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 10 = true := by
  have h0 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 1 = true := okB1985
  have h1 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 2 = true := blkChk_join _ _ _ _ _ 1985 1 1 h0 okB1986
  have h2 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 3 = true := blkChk_join _ _ _ _ _ 1985 2 1 h1 okB1987
  have h3 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 4 = true := blkChk_join _ _ _ _ _ 1985 3 1 h2 okB1988
  have h4 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 5 = true := blkChk_join _ _ _ _ _ 1985 4 1 h3 okB1989
  have h5 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 6 = true := blkChk_join _ _ _ _ _ 1985 5 1 h4 okB1990
  have h6 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 7 = true := blkChk_join _ _ _ _ _ 1985 6 1 h5 okB1991
  have h7 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 8 = true := blkChk_join _ _ _ _ _ 1985 7 1 h6 okB1992
  have h8 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 9 = true := blkChk_join _ _ _ _ _ 1985 8 1 h7 okB1993
  have h9 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 1985 10 = true := blkChk_join _ _ _ _ _ 1985 9 1 h8 okB1994
  exact h9
end E1.C402X
