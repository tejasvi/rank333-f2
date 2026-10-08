module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB1973 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 1 = true := by decide +kernel
theorem okB1974 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1974 1 = true := by decide +kernel
theorem okB1975 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1975 1 = true := by decide +kernel
theorem okB1976 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1976 1 = true := by decide +kernel
theorem okB1977 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1977 1 = true := by decide +kernel
theorem okB1978 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1978 1 = true := by decide +kernel
theorem okB1979 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1979 1 = true := by decide +kernel
theorem okB1980 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1980 1 = true := by decide +kernel
theorem okB1981 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1981 1 = true := by decide +kernel
theorem okB1982 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1982 1 = true := by decide +kernel
theorem okG189 : glueChkR lits W 1973 10 = true := by decide +kernel
theorem okM189 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 10 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 1 = true := okB1973
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 2 = true := blkChk_join _ _ _ _ _ 1973 1 1 h0 okB1974
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 3 = true := blkChk_join _ _ _ _ _ 1973 2 1 h1 okB1975
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 4 = true := blkChk_join _ _ _ _ _ 1973 3 1 h2 okB1976
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 5 = true := blkChk_join _ _ _ _ _ 1973 4 1 h3 okB1977
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 6 = true := blkChk_join _ _ _ _ _ 1973 5 1 h4 okB1978
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 7 = true := blkChk_join _ _ _ _ _ 1973 6 1 h5 okB1979
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 8 = true := blkChk_join _ _ _ _ _ 1973 7 1 h6 okB1980
  have h8 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 9 = true := blkChk_join _ _ _ _ _ 1973 8 1 h7 okB1981
  have h9 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 1973 10 = true := blkChk_join _ _ _ _ _ 1973 9 1 h8 okB1982
  exact h9
end E1.C394X
