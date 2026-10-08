module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2419 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 1 = true := by decide +kernel
theorem okB2420 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2420 1 = true := by decide +kernel
theorem okB2421 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2421 1 = true := by decide +kernel
theorem okB2422 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2422 1 = true := by decide +kernel
theorem okB2423 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2423 1 = true := by decide +kernel
theorem okB2424 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2424 1 = true := by decide +kernel
theorem okB2425 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2425 1 = true := by decide +kernel
theorem okB2426 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2426 1 = true := by decide +kernel
theorem okB2427 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2427 1 = true := by decide +kernel
theorem okG226 : glueChkR lits W 2419 9 = true := by decide +kernel
theorem okM226 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 1 = true := okB2419
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 2 = true := blkChk_join _ _ _ _ _ 2419 1 1 h0 okB2420
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 3 = true := blkChk_join _ _ _ _ _ 2419 2 1 h1 okB2421
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 4 = true := blkChk_join _ _ _ _ _ 2419 3 1 h2 okB2422
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 5 = true := blkChk_join _ _ _ _ _ 2419 4 1 h3 okB2423
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 6 = true := blkChk_join _ _ _ _ _ 2419 5 1 h4 okB2424
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 7 = true := blkChk_join _ _ _ _ _ 2419 6 1 h5 okB2425
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 8 = true := blkChk_join _ _ _ _ _ 2419 7 1 h6 okB2426
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2419 9 = true := blkChk_join _ _ _ _ _ 2419 8 1 h7 okB2427
  exact h8
end E1.C384X
