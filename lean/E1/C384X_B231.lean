module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2467 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 1 = true := by decide +kernel
theorem okB2468 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2468 1 = true := by decide +kernel
theorem okB2469 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2469 1 = true := by decide +kernel
theorem okB2470 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2470 1 = true := by decide +kernel
theorem okB2471 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2471 1 = true := by decide +kernel
theorem okB2472 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2472 1 = true := by decide +kernel
theorem okB2473 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2473 1 = true := by decide +kernel
theorem okB2474 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2474 1 = true := by decide +kernel
theorem okG231 : glueChkR lits W 2467 8 = true := by decide +kernel
theorem okM231 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 1 = true := okB2467
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 2 = true := blkChk_join _ _ _ _ _ 2467 1 1 h0 okB2468
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 3 = true := blkChk_join _ _ _ _ _ 2467 2 1 h1 okB2469
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 4 = true := blkChk_join _ _ _ _ _ 2467 3 1 h2 okB2470
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 5 = true := blkChk_join _ _ _ _ _ 2467 4 1 h3 okB2471
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 6 = true := blkChk_join _ _ _ _ _ 2467 5 1 h4 okB2472
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 7 = true := blkChk_join _ _ _ _ _ 2467 6 1 h5 okB2473
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2467 8 = true := blkChk_join _ _ _ _ _ 2467 7 1 h6 okB2474
  exact h7
end E1.C384X
