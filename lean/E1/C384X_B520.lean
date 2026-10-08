module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5432 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 1 = true := by decide +kernel
theorem okB5433 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5433 1 = true := by decide +kernel
theorem okB5434 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5434 1 = true := by decide +kernel
theorem okB5435 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5435 1 = true := by decide +kernel
theorem okB5436 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5436 1 = true := by decide +kernel
theorem okB5437 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5437 1 = true := by decide +kernel
theorem okB5438 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5438 1 = true := by decide +kernel
theorem okB5439 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5439 1 = true := by decide +kernel
theorem okB5440 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5440 1 = true := by decide +kernel
theorem okG520 : glueChkR lits W 5432 9 = true := by decide +kernel
theorem okM520 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 1 = true := okB5432
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 2 = true := blkChk_join _ _ _ _ _ 5432 1 1 h0 okB5433
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 3 = true := blkChk_join _ _ _ _ _ 5432 2 1 h1 okB5434
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 4 = true := blkChk_join _ _ _ _ _ 5432 3 1 h2 okB5435
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 5 = true := blkChk_join _ _ _ _ _ 5432 4 1 h3 okB5436
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 6 = true := blkChk_join _ _ _ _ _ 5432 5 1 h4 okB5437
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 7 = true := blkChk_join _ _ _ _ _ 5432 6 1 h5 okB5438
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 8 = true := blkChk_join _ _ _ _ _ 5432 7 1 h6 okB5439
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5432 9 = true := blkChk_join _ _ _ _ _ 5432 8 1 h7 okB5440
  exact h8
end E1.C384X
