module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB365 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 1 = true := by decide +kernel
theorem okB366 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 366 1 = true := by decide +kernel
theorem okB367 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 367 1 = true := by decide +kernel
theorem okB368 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 368 1 = true := by decide +kernel
theorem okB369 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 369 1 = true := by decide +kernel
theorem okB370 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 370 1 = true := by decide +kernel
theorem okB371 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 371 1 = true := by decide +kernel
theorem okB372 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 372 1 = true := by decide +kernel
theorem okB373 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 373 1 = true := by decide +kernel
theorem okG34 : glueChkR lits W 365 9 = true := by decide +kernel
theorem okM34 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 1 = true := okB365
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 2 = true := blkChk_join _ _ _ _ _ 365 1 1 h0 okB366
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 3 = true := blkChk_join _ _ _ _ _ 365 2 1 h1 okB367
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 4 = true := blkChk_join _ _ _ _ _ 365 3 1 h2 okB368
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 5 = true := blkChk_join _ _ _ _ _ 365 4 1 h3 okB369
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 6 = true := blkChk_join _ _ _ _ _ 365 5 1 h4 okB370
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 7 = true := blkChk_join _ _ _ _ _ 365 6 1 h5 okB371
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 8 = true := blkChk_join _ _ _ _ _ 365 7 1 h6 okB372
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 365 9 = true := blkChk_join _ _ _ _ _ 365 8 1 h7 okB373
  exact h8
end E1.C382X
