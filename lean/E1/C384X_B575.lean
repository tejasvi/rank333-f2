module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5966 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 1 = true := by decide +kernel
theorem okB5967 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5967 1 = true := by decide +kernel
theorem okB5968 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5968 1 = true := by decide +kernel
theorem okB5969 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5969 1 = true := by decide +kernel
theorem okB5970 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5970 1 = true := by decide +kernel
theorem okB5971 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5971 1 = true := by decide +kernel
theorem okB5972 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5972 1 = true := by decide +kernel
theorem okB5973 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5973 1 = true := by decide +kernel
theorem okB5974 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5974 1 = true := by decide +kernel
theorem okB5975 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5975 1 = true := by decide +kernel
theorem okB5976 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5976 1 = true := by decide +kernel
theorem okB5977 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5977 1 = true := by decide +kernel
theorem okB5978 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5978 1 = true := by decide +kernel
theorem okG575 : glueChkR lits W 5966 13 = true := by decide +kernel
theorem okM575 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 1 = true := okB5966
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 2 = true := blkChk_join _ _ _ _ _ 5966 1 1 h0 okB5967
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 3 = true := blkChk_join _ _ _ _ _ 5966 2 1 h1 okB5968
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 4 = true := blkChk_join _ _ _ _ _ 5966 3 1 h2 okB5969
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 5 = true := blkChk_join _ _ _ _ _ 5966 4 1 h3 okB5970
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 6 = true := blkChk_join _ _ _ _ _ 5966 5 1 h4 okB5971
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 7 = true := blkChk_join _ _ _ _ _ 5966 6 1 h5 okB5972
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 8 = true := blkChk_join _ _ _ _ _ 5966 7 1 h6 okB5973
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 9 = true := blkChk_join _ _ _ _ _ 5966 8 1 h7 okB5974
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 10 = true := blkChk_join _ _ _ _ _ 5966 9 1 h8 okB5975
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 11 = true := blkChk_join _ _ _ _ _ 5966 10 1 h9 okB5976
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 12 = true := blkChk_join _ _ _ _ _ 5966 11 1 h10 okB5977
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5966 13 = true := blkChk_join _ _ _ _ _ 5966 12 1 h11 okB5978
  exact h12
end E1.C384X
