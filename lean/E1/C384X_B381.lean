module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3977 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 1 = true := by decide +kernel
theorem okB3978 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3978 1 = true := by decide +kernel
theorem okB3979 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3979 1 = true := by decide +kernel
theorem okB3980 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3980 1 = true := by decide +kernel
theorem okB3981 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3981 1 = true := by decide +kernel
theorem okB3982 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3982 1 = true := by decide +kernel
theorem okB3983 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3983 1 = true := by decide +kernel
theorem okB3984 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3984 1 = true := by decide +kernel
theorem okB3985 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3985 1 = true := by decide +kernel
theorem okB3986 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3986 1 = true := by decide +kernel
theorem okB3987 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3987 1 = true := by decide +kernel
theorem okB3988 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3988 1 = true := by decide +kernel
theorem okG381 : glueChkR lits W 3977 12 = true := by decide +kernel
theorem okM381 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 1 = true := okB3977
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 2 = true := blkChk_join _ _ _ _ _ 3977 1 1 h0 okB3978
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 3 = true := blkChk_join _ _ _ _ _ 3977 2 1 h1 okB3979
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 4 = true := blkChk_join _ _ _ _ _ 3977 3 1 h2 okB3980
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 5 = true := blkChk_join _ _ _ _ _ 3977 4 1 h3 okB3981
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 6 = true := blkChk_join _ _ _ _ _ 3977 5 1 h4 okB3982
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 7 = true := blkChk_join _ _ _ _ _ 3977 6 1 h5 okB3983
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 8 = true := blkChk_join _ _ _ _ _ 3977 7 1 h6 okB3984
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 9 = true := blkChk_join _ _ _ _ _ 3977 8 1 h7 okB3985
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 10 = true := blkChk_join _ _ _ _ _ 3977 9 1 h8 okB3986
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 11 = true := blkChk_join _ _ _ _ _ 3977 10 1 h9 okB3987
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3977 12 = true := blkChk_join _ _ _ _ _ 3977 11 1 h10 okB3988
  exact h11
end E1.C384X
