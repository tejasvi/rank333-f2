module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3074 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 1 = true := by decide +kernel
theorem okB3075 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3075 1 = true := by decide +kernel
theorem okB3076 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3076 1 = true := by decide +kernel
theorem okB3077 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3077 1 = true := by decide +kernel
theorem okB3078 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3078 1 = true := by decide +kernel
theorem okB3079 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3079 1 = true := by decide +kernel
theorem okB3080 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3080 1 = true := by decide +kernel
theorem okB3081 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3081 1 = true := by decide +kernel
theorem okB3082 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3082 1 = true := by decide +kernel
theorem okB3083 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3083 1 = true := by decide +kernel
theorem okG292 : glueChkR lits W 3074 10 = true := by decide +kernel
theorem okM292 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 1 = true := okB3074
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 2 = true := blkChk_join _ _ _ _ _ 3074 1 1 h0 okB3075
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 3 = true := blkChk_join _ _ _ _ _ 3074 2 1 h1 okB3076
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 4 = true := blkChk_join _ _ _ _ _ 3074 3 1 h2 okB3077
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 5 = true := blkChk_join _ _ _ _ _ 3074 4 1 h3 okB3078
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 6 = true := blkChk_join _ _ _ _ _ 3074 5 1 h4 okB3079
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 7 = true := blkChk_join _ _ _ _ _ 3074 6 1 h5 okB3080
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 8 = true := blkChk_join _ _ _ _ _ 3074 7 1 h6 okB3081
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 9 = true := blkChk_join _ _ _ _ _ 3074 8 1 h7 okB3082
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3074 10 = true := blkChk_join _ _ _ _ _ 3074 9 1 h8 okB3083
  exact h9
end E1.C384X
