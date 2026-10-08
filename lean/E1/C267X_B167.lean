module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB1984 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 1 = true := by decide +kernel
theorem okB1985 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1985 1 = true := by decide +kernel
theorem okB1986 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1986 1 = true := by decide +kernel
theorem okB1987 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1987 1 = true := by decide +kernel
theorem okB1988 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1988 1 = true := by decide +kernel
theorem okB1989 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1989 1 = true := by decide +kernel
theorem okB1990 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1990 1 = true := by decide +kernel
theorem okB1991 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1991 1 = true := by decide +kernel
theorem okG167 : glueChkR lits W 1984 8 = true := by decide +kernel
theorem okM167 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 8 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 1 = true := okB1984
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 2 = true := blkChk_join _ _ _ _ _ 1984 1 1 h0 okB1985
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 3 = true := blkChk_join _ _ _ _ _ 1984 2 1 h1 okB1986
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 4 = true := blkChk_join _ _ _ _ _ 1984 3 1 h2 okB1987
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 5 = true := blkChk_join _ _ _ _ _ 1984 4 1 h3 okB1988
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 6 = true := blkChk_join _ _ _ _ _ 1984 5 1 h4 okB1989
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 7 = true := blkChk_join _ _ _ _ _ 1984 6 1 h5 okB1990
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 1984 8 = true := blkChk_join _ _ _ _ _ 1984 7 1 h6 okB1991
  exact h7
end E1.C267X
