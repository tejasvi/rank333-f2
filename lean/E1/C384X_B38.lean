module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB377 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 1 = true := by decide +kernel
theorem okB378 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 378 1 = true := by decide +kernel
theorem okB379 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 379 1 = true := by decide +kernel
theorem okB380 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 380 1 = true := by decide +kernel
theorem okB381 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 381 1 = true := by decide +kernel
theorem okB382 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 382 1 = true := by decide +kernel
theorem okB383 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 383 1 = true := by decide +kernel
theorem okG38 : glueChkR lits W 377 7 = true := by decide +kernel
theorem okM38 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 7 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 1 = true := okB377
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 2 = true := blkChk_join _ _ _ _ _ 377 1 1 h0 okB378
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 3 = true := blkChk_join _ _ _ _ _ 377 2 1 h1 okB379
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 4 = true := blkChk_join _ _ _ _ _ 377 3 1 h2 okB380
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 5 = true := blkChk_join _ _ _ _ _ 377 4 1 h3 okB381
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 6 = true := blkChk_join _ _ _ _ _ 377 5 1 h4 okB382
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 377 7 = true := blkChk_join _ _ _ _ _ 377 6 1 h5 okB383
  exact h6
end E1.C384X
