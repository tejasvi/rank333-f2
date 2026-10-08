module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3444 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 1 = true := by decide +kernel
theorem okB3445 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3445 1 = true := by decide +kernel
theorem okB3446 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3446 1 = true := by decide +kernel
theorem okB3447 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3447 1 = true := by decide +kernel
theorem okB3448 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3448 1 = true := by decide +kernel
theorem okB3449 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3449 1 = true := by decide +kernel
theorem okB3450 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3450 1 = true := by decide +kernel
theorem okB3451 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3451 1 = true := by decide +kernel
theorem okB3452 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3452 1 = true := by decide +kernel
theorem okB3453 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3453 1 = true := by decide +kernel
theorem okG331 : glueChkR lits W 3444 10 = true := by decide +kernel
theorem okM331 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 1 = true := okB3444
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 2 = true := blkChk_join _ _ _ _ _ 3444 1 1 h0 okB3445
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 3 = true := blkChk_join _ _ _ _ _ 3444 2 1 h1 okB3446
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 4 = true := blkChk_join _ _ _ _ _ 3444 3 1 h2 okB3447
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 5 = true := blkChk_join _ _ _ _ _ 3444 4 1 h3 okB3448
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 6 = true := blkChk_join _ _ _ _ _ 3444 5 1 h4 okB3449
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 7 = true := blkChk_join _ _ _ _ _ 3444 6 1 h5 okB3450
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 8 = true := blkChk_join _ _ _ _ _ 3444 7 1 h6 okB3451
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 9 = true := blkChk_join _ _ _ _ _ 3444 8 1 h7 okB3452
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3444 10 = true := blkChk_join _ _ _ _ _ 3444 9 1 h8 okB3453
  exact h9
end E1.C384X
