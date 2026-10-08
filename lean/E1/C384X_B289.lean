module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3043 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 1 = true := by decide +kernel
theorem okB3044 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3044 1 = true := by decide +kernel
theorem okB3045 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3045 1 = true := by decide +kernel
theorem okB3046 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3046 1 = true := by decide +kernel
theorem okB3047 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3047 1 = true := by decide +kernel
theorem okB3048 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3048 1 = true := by decide +kernel
theorem okB3049 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3049 1 = true := by decide +kernel
theorem okB3050 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3050 1 = true := by decide +kernel
theorem okB3051 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3051 1 = true := by decide +kernel
theorem okB3052 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3052 1 = true := by decide +kernel
theorem okB3053 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3053 1 = true := by decide +kernel
theorem okG289 : glueChkR lits W 3043 11 = true := by decide +kernel
theorem okM289 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 1 = true := okB3043
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 2 = true := blkChk_join _ _ _ _ _ 3043 1 1 h0 okB3044
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 3 = true := blkChk_join _ _ _ _ _ 3043 2 1 h1 okB3045
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 4 = true := blkChk_join _ _ _ _ _ 3043 3 1 h2 okB3046
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 5 = true := blkChk_join _ _ _ _ _ 3043 4 1 h3 okB3047
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 6 = true := blkChk_join _ _ _ _ _ 3043 5 1 h4 okB3048
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 7 = true := blkChk_join _ _ _ _ _ 3043 6 1 h5 okB3049
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 8 = true := blkChk_join _ _ _ _ _ 3043 7 1 h6 okB3050
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 9 = true := blkChk_join _ _ _ _ _ 3043 8 1 h7 okB3051
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 10 = true := blkChk_join _ _ _ _ _ 3043 9 1 h8 okB3052
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3043 11 = true := blkChk_join _ _ _ _ _ 3043 10 1 h9 okB3053
  exact h10
end E1.C384X
