module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1981 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 1 = true := by decide +kernel
theorem okB1982 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1982 1 = true := by decide +kernel
theorem okB1983 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1983 1 = true := by decide +kernel
theorem okB1984 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1984 1 = true := by decide +kernel
theorem okB1985 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1985 1 = true := by decide +kernel
theorem okB1986 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1986 1 = true := by decide +kernel
theorem okB1987 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1987 1 = true := by decide +kernel
theorem okB1988 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1988 1 = true := by decide +kernel
theorem okB1989 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1989 1 = true := by decide +kernel
theorem okB1990 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1990 1 = true := by decide +kernel
theorem okG186 : glueChkR lits W 1981 10 = true := by decide +kernel
theorem okM186 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 1 = true := okB1981
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 2 = true := blkChk_join _ _ _ _ _ 1981 1 1 h0 okB1982
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 3 = true := blkChk_join _ _ _ _ _ 1981 2 1 h1 okB1983
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 4 = true := blkChk_join _ _ _ _ _ 1981 3 1 h2 okB1984
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 5 = true := blkChk_join _ _ _ _ _ 1981 4 1 h3 okB1985
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 6 = true := blkChk_join _ _ _ _ _ 1981 5 1 h4 okB1986
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 7 = true := blkChk_join _ _ _ _ _ 1981 6 1 h5 okB1987
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 8 = true := blkChk_join _ _ _ _ _ 1981 7 1 h6 okB1988
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 9 = true := blkChk_join _ _ _ _ _ 1981 8 1 h7 okB1989
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1981 10 = true := blkChk_join _ _ _ _ _ 1981 9 1 h8 okB1990
  exact h9
end E1.C384X
