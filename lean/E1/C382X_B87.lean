module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB970 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 1 = true := by decide +kernel
theorem okB971 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 971 1 = true := by decide +kernel
theorem okB972 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 972 1 = true := by decide +kernel
theorem okB973 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 973 1 = true := by decide +kernel
theorem okB974 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 974 1 = true := by decide +kernel
theorem okB975 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 975 1 = true := by decide +kernel
theorem okB976 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 976 1 = true := by decide +kernel
theorem okB977 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 977 1 = true := by decide +kernel
theorem okB978 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 978 1 = true := by decide +kernel
theorem okB979 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 979 1 = true := by decide +kernel
theorem okB980 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 980 1 = true := by decide +kernel
theorem okB981 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 981 1 = true := by decide +kernel
theorem okG87 : glueChkR lits W 970 12 = true := by decide +kernel
theorem okM87 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 12 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 1 = true := okB970
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 2 = true := blkChk_join _ _ _ _ _ 970 1 1 h0 okB971
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 3 = true := blkChk_join _ _ _ _ _ 970 2 1 h1 okB972
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 4 = true := blkChk_join _ _ _ _ _ 970 3 1 h2 okB973
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 5 = true := blkChk_join _ _ _ _ _ 970 4 1 h3 okB974
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 6 = true := blkChk_join _ _ _ _ _ 970 5 1 h4 okB975
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 7 = true := blkChk_join _ _ _ _ _ 970 6 1 h5 okB976
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 8 = true := blkChk_join _ _ _ _ _ 970 7 1 h6 okB977
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 9 = true := blkChk_join _ _ _ _ _ 970 8 1 h7 okB978
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 10 = true := blkChk_join _ _ _ _ _ 970 9 1 h8 okB979
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 11 = true := blkChk_join _ _ _ _ _ 970 10 1 h9 okB980
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 970 12 = true := blkChk_join _ _ _ _ _ 970 11 1 h10 okB981
  exact h11
end E1.C382X
