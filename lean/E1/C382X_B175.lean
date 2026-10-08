module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1967 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 1 = true := by decide +kernel
theorem okB1968 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1968 1 = true := by decide +kernel
theorem okB1969 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1969 1 = true := by decide +kernel
theorem okB1970 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1970 1 = true := by decide +kernel
theorem okB1971 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1971 1 = true := by decide +kernel
theorem okB1972 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1972 1 = true := by decide +kernel
theorem okB1973 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1973 1 = true := by decide +kernel
theorem okB1974 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1974 1 = true := by decide +kernel
theorem okB1975 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1975 1 = true := by decide +kernel
theorem okB1976 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1976 1 = true := by decide +kernel
theorem okB1977 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1977 1 = true := by decide +kernel
theorem okB1978 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1978 1 = true := by decide +kernel
theorem okB1979 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1979 1 = true := by decide +kernel
theorem okB1980 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1980 1 = true := by decide +kernel
theorem okB1981 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1981 1 = true := by decide +kernel
theorem okG175 : glueChkR lits W 1967 15 = true := by decide +kernel
theorem okM175 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 15 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 1 = true := okB1967
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 2 = true := blkChk_join _ _ _ _ _ 1967 1 1 h0 okB1968
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 3 = true := blkChk_join _ _ _ _ _ 1967 2 1 h1 okB1969
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 4 = true := blkChk_join _ _ _ _ _ 1967 3 1 h2 okB1970
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 5 = true := blkChk_join _ _ _ _ _ 1967 4 1 h3 okB1971
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 6 = true := blkChk_join _ _ _ _ _ 1967 5 1 h4 okB1972
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 7 = true := blkChk_join _ _ _ _ _ 1967 6 1 h5 okB1973
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 8 = true := blkChk_join _ _ _ _ _ 1967 7 1 h6 okB1974
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 9 = true := blkChk_join _ _ _ _ _ 1967 8 1 h7 okB1975
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 10 = true := blkChk_join _ _ _ _ _ 1967 9 1 h8 okB1976
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 11 = true := blkChk_join _ _ _ _ _ 1967 10 1 h9 okB1977
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 12 = true := blkChk_join _ _ _ _ _ 1967 11 1 h10 okB1978
  have h12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 13 = true := blkChk_join _ _ _ _ _ 1967 12 1 h11 okB1979
  have h13 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 14 = true := blkChk_join _ _ _ _ _ 1967 13 1 h12 okB1980
  have h14 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1967 15 = true := blkChk_join _ _ _ _ _ 1967 14 1 h13 okB1981
  exact h14
end E1.C382X
