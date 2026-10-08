module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4468 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 1 = true := by decide +kernel
theorem okB4469 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4469 1 = true := by decide +kernel
theorem okB4470 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4470 1 = true := by decide +kernel
theorem okB4471 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4471 1 = true := by decide +kernel
theorem okB4472 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4472 1 = true := by decide +kernel
theorem okB4473 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4473 1 = true := by decide +kernel
theorem okB4474 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4474 1 = true := by decide +kernel
theorem okB4475 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4475 1 = true := by decide +kernel
theorem okB4476 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4476 1 = true := by decide +kernel
theorem okB4477 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4477 1 = true := by decide +kernel
theorem okB4478 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4478 1 = true := by decide +kernel
theorem okG427 : glueChkR lits W 4468 11 = true := by decide +kernel
theorem okM427 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 1 = true := okB4468
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 2 = true := blkChk_join _ _ _ _ _ 4468 1 1 h0 okB4469
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 3 = true := blkChk_join _ _ _ _ _ 4468 2 1 h1 okB4470
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 4 = true := blkChk_join _ _ _ _ _ 4468 3 1 h2 okB4471
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 5 = true := blkChk_join _ _ _ _ _ 4468 4 1 h3 okB4472
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 6 = true := blkChk_join _ _ _ _ _ 4468 5 1 h4 okB4473
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 7 = true := blkChk_join _ _ _ _ _ 4468 6 1 h5 okB4474
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 8 = true := blkChk_join _ _ _ _ _ 4468 7 1 h6 okB4475
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 9 = true := blkChk_join _ _ _ _ _ 4468 8 1 h7 okB4476
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 10 = true := blkChk_join _ _ _ _ _ 4468 9 1 h8 okB4477
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4468 11 = true := blkChk_join _ _ _ _ _ 4468 10 1 h9 okB4478
  exact h10
end E1.C384X
