module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3236 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 1 = true := by decide +kernel
theorem okB3237 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3237 1 = true := by decide +kernel
theorem okB3238 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3238 1 = true := by decide +kernel
theorem okB3239 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3239 1 = true := by decide +kernel
theorem okB3240 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3240 1 = true := by decide +kernel
theorem okB3241 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3241 1 = true := by decide +kernel
theorem okB3242 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3242 1 = true := by decide +kernel
theorem okB3243 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3243 1 = true := by decide +kernel
theorem okG308 : glueChkR lits W 3236 8 = true := by decide +kernel
theorem okM308 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 1 = true := okB3236
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 2 = true := blkChk_join _ _ _ _ _ 3236 1 1 h0 okB3237
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 3 = true := blkChk_join _ _ _ _ _ 3236 2 1 h1 okB3238
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 4 = true := blkChk_join _ _ _ _ _ 3236 3 1 h2 okB3239
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 5 = true := blkChk_join _ _ _ _ _ 3236 4 1 h3 okB3240
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 6 = true := blkChk_join _ _ _ _ _ 3236 5 1 h4 okB3241
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 7 = true := blkChk_join _ _ _ _ _ 3236 6 1 h5 okB3242
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3236 8 = true := blkChk_join _ _ _ _ _ 3236 7 1 h6 okB3243
  exact h7
end E1.C384X
