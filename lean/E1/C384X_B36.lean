module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB360 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 1 = true := by decide +kernel
theorem okB361 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 361 1 = true := by decide +kernel
theorem okB362 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 362 1 = true := by decide +kernel
theorem okB363 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 363 1 = true := by decide +kernel
theorem okB364 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 364 1 = true := by decide +kernel
theorem okB365 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 365 1 = true := by decide +kernel
theorem okB366 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 366 1 = true := by decide +kernel
theorem okB367 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 367 1 = true := by decide +kernel
theorem okB368 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 368 1 = true := by decide +kernel
theorem okG36 : glueChkR lits W 360 9 = true := by decide +kernel
theorem okM36 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 1 = true := okB360
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 2 = true := blkChk_join _ _ _ _ _ 360 1 1 h0 okB361
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 3 = true := blkChk_join _ _ _ _ _ 360 2 1 h1 okB362
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 4 = true := blkChk_join _ _ _ _ _ 360 3 1 h2 okB363
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 5 = true := blkChk_join _ _ _ _ _ 360 4 1 h3 okB364
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 6 = true := blkChk_join _ _ _ _ _ 360 5 1 h4 okB365
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 7 = true := blkChk_join _ _ _ _ _ 360 6 1 h5 okB366
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 8 = true := blkChk_join _ _ _ _ _ 360 7 1 h6 okB367
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 360 9 = true := blkChk_join _ _ _ _ _ 360 8 1 h7 okB368
  exact h8
end E1.C384X
