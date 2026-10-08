module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3288 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 1 = true := by decide +kernel
theorem okB3289 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3289 1 = true := by decide +kernel
theorem okB3290 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3290 1 = true := by decide +kernel
theorem okB3291 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3291 1 = true := by decide +kernel
theorem okB3292 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3292 1 = true := by decide +kernel
theorem okB3293 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3293 1 = true := by decide +kernel
theorem okB3294 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3294 1 = true := by decide +kernel
theorem okB3295 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3295 1 = true := by decide +kernel
theorem okB3296 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3296 1 = true := by decide +kernel
theorem okB3297 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3297 1 = true := by decide +kernel
theorem okG314 : glueChkR lits W 3288 10 = true := by decide +kernel
theorem okM314 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 1 = true := okB3288
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 2 = true := blkChk_join _ _ _ _ _ 3288 1 1 h0 okB3289
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 3 = true := blkChk_join _ _ _ _ _ 3288 2 1 h1 okB3290
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 4 = true := blkChk_join _ _ _ _ _ 3288 3 1 h2 okB3291
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 5 = true := blkChk_join _ _ _ _ _ 3288 4 1 h3 okB3292
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 6 = true := blkChk_join _ _ _ _ _ 3288 5 1 h4 okB3293
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 7 = true := blkChk_join _ _ _ _ _ 3288 6 1 h5 okB3294
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 8 = true := blkChk_join _ _ _ _ _ 3288 7 1 h6 okB3295
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 9 = true := blkChk_join _ _ _ _ _ 3288 8 1 h7 okB3296
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3288 10 = true := blkChk_join _ _ _ _ _ 3288 9 1 h8 okB3297
  exact h9
end E1.C384X
