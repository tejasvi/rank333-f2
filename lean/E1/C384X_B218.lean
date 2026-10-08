module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2343 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 1 = true := by decide +kernel
theorem okB2344 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2344 1 = true := by decide +kernel
theorem okB2345 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2345 1 = true := by decide +kernel
theorem okB2346 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2346 1 = true := by decide +kernel
theorem okB2347 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2347 1 = true := by decide +kernel
theorem okB2348 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2348 1 = true := by decide +kernel
theorem okB2349 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2349 1 = true := by decide +kernel
theorem okB2350 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2350 1 = true := by decide +kernel
theorem okB2351 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2351 1 = true := by decide +kernel
theorem okB2352 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2352 1 = true := by decide +kernel
theorem okB2353 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2353 1 = true := by decide +kernel
theorem okB2354 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2354 1 = true := by decide +kernel
theorem okG218 : glueChkR lits W 2343 12 = true := by decide +kernel
theorem okM218 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 1 = true := okB2343
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 2 = true := blkChk_join _ _ _ _ _ 2343 1 1 h0 okB2344
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 3 = true := blkChk_join _ _ _ _ _ 2343 2 1 h1 okB2345
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 4 = true := blkChk_join _ _ _ _ _ 2343 3 1 h2 okB2346
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 5 = true := blkChk_join _ _ _ _ _ 2343 4 1 h3 okB2347
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 6 = true := blkChk_join _ _ _ _ _ 2343 5 1 h4 okB2348
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 7 = true := blkChk_join _ _ _ _ _ 2343 6 1 h5 okB2349
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 8 = true := blkChk_join _ _ _ _ _ 2343 7 1 h6 okB2350
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 9 = true := blkChk_join _ _ _ _ _ 2343 8 1 h7 okB2351
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 10 = true := blkChk_join _ _ _ _ _ 2343 9 1 h8 okB2352
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 11 = true := blkChk_join _ _ _ _ _ 2343 10 1 h9 okB2353
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2343 12 = true := blkChk_join _ _ _ _ _ 2343 11 1 h10 okB2354
  exact h11
end E1.C384X
