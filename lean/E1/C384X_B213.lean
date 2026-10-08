module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2290 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 1 = true := by decide +kernel
theorem okB2291 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2291 1 = true := by decide +kernel
theorem okB2292 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2292 1 = true := by decide +kernel
theorem okB2293 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2293 1 = true := by decide +kernel
theorem okB2294 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2294 1 = true := by decide +kernel
theorem okB2295 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2295 1 = true := by decide +kernel
theorem okB2296 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2296 1 = true := by decide +kernel
theorem okB2297 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2297 1 = true := by decide +kernel
theorem okB2298 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2298 1 = true := by decide +kernel
theorem okG213 : glueChkR lits W 2290 9 = true := by decide +kernel
theorem okM213 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 1 = true := okB2290
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 2 = true := blkChk_join _ _ _ _ _ 2290 1 1 h0 okB2291
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 3 = true := blkChk_join _ _ _ _ _ 2290 2 1 h1 okB2292
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 4 = true := blkChk_join _ _ _ _ _ 2290 3 1 h2 okB2293
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 5 = true := blkChk_join _ _ _ _ _ 2290 4 1 h3 okB2294
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 6 = true := blkChk_join _ _ _ _ _ 2290 5 1 h4 okB2295
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 7 = true := blkChk_join _ _ _ _ _ 2290 6 1 h5 okB2296
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 8 = true := blkChk_join _ _ _ _ _ 2290 7 1 h6 okB2297
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2290 9 = true := blkChk_join _ _ _ _ _ 2290 8 1 h7 okB2298
  exact h8
end E1.C384X
