module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3472 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 1 = true := by decide +kernel
theorem okB3473 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3473 1 = true := by decide +kernel
theorem okB3474 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3474 1 = true := by decide +kernel
theorem okB3475 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3475 1 = true := by decide +kernel
theorem okB3476 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3476 1 = true := by decide +kernel
theorem okB3477 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3477 1 = true := by decide +kernel
theorem okB3478 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3478 1 = true := by decide +kernel
theorem okB3479 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3479 1 = true := by decide +kernel
theorem okG334 : glueChkR lits W 3472 8 = true := by decide +kernel
theorem okM334 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 1 = true := okB3472
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 2 = true := blkChk_join _ _ _ _ _ 3472 1 1 h0 okB3473
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 3 = true := blkChk_join _ _ _ _ _ 3472 2 1 h1 okB3474
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 4 = true := blkChk_join _ _ _ _ _ 3472 3 1 h2 okB3475
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 5 = true := blkChk_join _ _ _ _ _ 3472 4 1 h3 okB3476
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 6 = true := blkChk_join _ _ _ _ _ 3472 5 1 h4 okB3477
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 7 = true := blkChk_join _ _ _ _ _ 3472 6 1 h5 okB3478
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3472 8 = true := blkChk_join _ _ _ _ _ 3472 7 1 h6 okB3479
  exact h7
end E1.C384X
