module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1982 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 1 = true := by decide +kernel
theorem okB1983 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1983 1 = true := by decide +kernel
theorem okB1984 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1984 1 = true := by decide +kernel
theorem okB1985 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1985 1 = true := by decide +kernel
theorem okB1986 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1986 1 = true := by decide +kernel
theorem okB1987 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1987 1 = true := by decide +kernel
theorem okB1988 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1988 1 = true := by decide +kernel
theorem okB1989 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1989 1 = true := by decide +kernel
theorem okB1990 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1990 1 = true := by decide +kernel
theorem okB1991 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1991 1 = true := by decide +kernel
theorem okB1992 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1992 1 = true := by decide +kernel
theorem okG176 : glueChkR lits W 1982 11 = true := by decide +kernel
theorem okM176 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 11 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 1 = true := okB1982
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 2 = true := blkChk_join _ _ _ _ _ 1982 1 1 h0 okB1983
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 3 = true := blkChk_join _ _ _ _ _ 1982 2 1 h1 okB1984
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 4 = true := blkChk_join _ _ _ _ _ 1982 3 1 h2 okB1985
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 5 = true := blkChk_join _ _ _ _ _ 1982 4 1 h3 okB1986
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 6 = true := blkChk_join _ _ _ _ _ 1982 5 1 h4 okB1987
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 7 = true := blkChk_join _ _ _ _ _ 1982 6 1 h5 okB1988
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 8 = true := blkChk_join _ _ _ _ _ 1982 7 1 h6 okB1989
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 9 = true := blkChk_join _ _ _ _ _ 1982 8 1 h7 okB1990
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 10 = true := blkChk_join _ _ _ _ _ 1982 9 1 h8 okB1991
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1982 11 = true := blkChk_join _ _ _ _ _ 1982 10 1 h9 okB1992
  exact h10
end E1.C382X
