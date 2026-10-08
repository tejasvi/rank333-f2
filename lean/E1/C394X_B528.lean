module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB5472 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 1 = true := by decide +kernel
theorem okB5473 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5473 1 = true := by decide +kernel
theorem okB5474 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5474 1 = true := by decide +kernel
theorem okB5475 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5475 1 = true := by decide +kernel
theorem okB5476 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5476 1 = true := by decide +kernel
theorem okB5477 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5477 1 = true := by decide +kernel
theorem okB5478 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5478 1 = true := by decide +kernel
theorem okB5479 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5479 1 = true := by decide +kernel
theorem okB5480 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5480 1 = true := by decide +kernel
theorem okB5481 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5481 1 = true := by decide +kernel
theorem okG528 : glueChkR lits W 5472 10 = true := by decide +kernel
theorem okM528 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 10 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 1 = true := okB5472
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 2 = true := blkChk_join _ _ _ _ _ 5472 1 1 h0 okB5473
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 3 = true := blkChk_join _ _ _ _ _ 5472 2 1 h1 okB5474
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 4 = true := blkChk_join _ _ _ _ _ 5472 3 1 h2 okB5475
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 5 = true := blkChk_join _ _ _ _ _ 5472 4 1 h3 okB5476
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 6 = true := blkChk_join _ _ _ _ _ 5472 5 1 h4 okB5477
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 7 = true := blkChk_join _ _ _ _ _ 5472 6 1 h5 okB5478
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 8 = true := blkChk_join _ _ _ _ _ 5472 7 1 h6 okB5479
  have h8 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 9 = true := blkChk_join _ _ _ _ _ 5472 8 1 h7 okB5480
  have h9 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 5472 10 = true := blkChk_join _ _ _ _ _ 5472 9 1 h8 okB5481
  exact h9
end E1.C394X
