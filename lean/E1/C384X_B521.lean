module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5441 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 1 = true := by decide +kernel
theorem okB5442 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5442 1 = true := by decide +kernel
theorem okB5443 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5443 1 = true := by decide +kernel
theorem okB5444 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5444 1 = true := by decide +kernel
theorem okB5445 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5445 1 = true := by decide +kernel
theorem okB5446 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5446 1 = true := by decide +kernel
theorem okB5447 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5447 1 = true := by decide +kernel
theorem okB5448 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5448 1 = true := by decide +kernel
theorem okG521 : glueChkR lits W 5441 8 = true := by decide +kernel
theorem okM521 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 1 = true := okB5441
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 2 = true := blkChk_join _ _ _ _ _ 5441 1 1 h0 okB5442
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 3 = true := blkChk_join _ _ _ _ _ 5441 2 1 h1 okB5443
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 4 = true := blkChk_join _ _ _ _ _ 5441 3 1 h2 okB5444
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 5 = true := blkChk_join _ _ _ _ _ 5441 4 1 h3 okB5445
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 6 = true := blkChk_join _ _ _ _ _ 5441 5 1 h4 okB5446
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 7 = true := blkChk_join _ _ _ _ _ 5441 6 1 h5 okB5447
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5441 8 = true := blkChk_join _ _ _ _ _ 5441 7 1 h6 okB5448
  exact h7
end E1.C384X
