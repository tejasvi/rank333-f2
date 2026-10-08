module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1968 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 1 = true := by decide +kernel
theorem okB1969 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1969 1 = true := by decide +kernel
theorem okB1970 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1970 1 = true := by decide +kernel
theorem okB1971 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1971 1 = true := by decide +kernel
theorem okB1972 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1972 1 = true := by decide +kernel
theorem okB1973 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1973 1 = true := by decide +kernel
theorem okB1974 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1974 1 = true := by decide +kernel
theorem okB1975 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1975 1 = true := by decide +kernel
theorem okB1976 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1976 1 = true := by decide +kernel
theorem okB1977 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1977 1 = true := by decide +kernel
theorem okB1978 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1978 1 = true := by decide +kernel
theorem okB1979 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1979 1 = true := by decide +kernel
theorem okB1980 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1980 1 = true := by decide +kernel
theorem okG185 : glueChkR lits W 1968 13 = true := by decide +kernel
theorem okM185 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 1 = true := okB1968
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 2 = true := blkChk_join _ _ _ _ _ 1968 1 1 h0 okB1969
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 3 = true := blkChk_join _ _ _ _ _ 1968 2 1 h1 okB1970
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 4 = true := blkChk_join _ _ _ _ _ 1968 3 1 h2 okB1971
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 5 = true := blkChk_join _ _ _ _ _ 1968 4 1 h3 okB1972
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 6 = true := blkChk_join _ _ _ _ _ 1968 5 1 h4 okB1973
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 7 = true := blkChk_join _ _ _ _ _ 1968 6 1 h5 okB1974
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 8 = true := blkChk_join _ _ _ _ _ 1968 7 1 h6 okB1975
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 9 = true := blkChk_join _ _ _ _ _ 1968 8 1 h7 okB1976
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 10 = true := blkChk_join _ _ _ _ _ 1968 9 1 h8 okB1977
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 11 = true := blkChk_join _ _ _ _ _ 1968 10 1 h9 okB1978
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 12 = true := blkChk_join _ _ _ _ _ 1968 11 1 h10 okB1979
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1968 13 = true := blkChk_join _ _ _ _ _ 1968 12 1 h11 okB1980
  exact h12
end E1.C384X
