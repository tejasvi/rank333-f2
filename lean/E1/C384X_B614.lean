module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6352 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 1 = true := by decide +kernel
theorem okB6353 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6353 1 = true := by decide +kernel
theorem okB6354 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6354 1 = true := by decide +kernel
theorem okB6355 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6355 1 = true := by decide +kernel
theorem okB6356 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6356 1 = true := by decide +kernel
theorem okB6357 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6357 1 = true := by decide +kernel
theorem okB6358 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6358 1 = true := by decide +kernel
theorem okB6359 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6359 1 = true := by decide +kernel
theorem okB6360 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6360 1 = true := by decide +kernel
theorem okB6361 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6361 1 = true := by decide +kernel
theorem okG614 : glueChkR lits W 6352 10 = true := by decide +kernel
theorem okM614 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 1 = true := okB6352
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 2 = true := blkChk_join _ _ _ _ _ 6352 1 1 h0 okB6353
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 3 = true := blkChk_join _ _ _ _ _ 6352 2 1 h1 okB6354
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 4 = true := blkChk_join _ _ _ _ _ 6352 3 1 h2 okB6355
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 5 = true := blkChk_join _ _ _ _ _ 6352 4 1 h3 okB6356
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 6 = true := blkChk_join _ _ _ _ _ 6352 5 1 h4 okB6357
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 7 = true := blkChk_join _ _ _ _ _ 6352 6 1 h5 okB6358
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 8 = true := blkChk_join _ _ _ _ _ 6352 7 1 h6 okB6359
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 9 = true := blkChk_join _ _ _ _ _ 6352 8 1 h7 okB6360
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6352 10 = true := blkChk_join _ _ _ _ _ 6352 9 1 h8 okB6361
  exact h9
end E1.C384X
