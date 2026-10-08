module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2531 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 1 = true := by decide +kernel
theorem okB2532 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2532 1 = true := by decide +kernel
theorem okB2533 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2533 1 = true := by decide +kernel
theorem okB2534 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2534 1 = true := by decide +kernel
theorem okB2535 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2535 1 = true := by decide +kernel
theorem okB2536 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2536 1 = true := by decide +kernel
theorem okB2537 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2537 1 = true := by decide +kernel
theorem okB2538 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2538 1 = true := by decide +kernel
theorem okB2539 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2539 1 = true := by decide +kernel
theorem okB2540 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2540 1 = true := by decide +kernel
theorem okG237 : glueChkR lits W 2531 10 = true := by decide +kernel
theorem okM237 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 1 = true := okB2531
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 2 = true := blkChk_join _ _ _ _ _ 2531 1 1 h0 okB2532
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 3 = true := blkChk_join _ _ _ _ _ 2531 2 1 h1 okB2533
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 4 = true := blkChk_join _ _ _ _ _ 2531 3 1 h2 okB2534
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 5 = true := blkChk_join _ _ _ _ _ 2531 4 1 h3 okB2535
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 6 = true := blkChk_join _ _ _ _ _ 2531 5 1 h4 okB2536
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 7 = true := blkChk_join _ _ _ _ _ 2531 6 1 h5 okB2537
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 8 = true := blkChk_join _ _ _ _ _ 2531 7 1 h6 okB2538
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 9 = true := blkChk_join _ _ _ _ _ 2531 8 1 h7 okB2539
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2531 10 = true := blkChk_join _ _ _ _ _ 2531 9 1 h8 okB2540
  exact h9
end E1.C384X
