module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5344 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 1 = true := by decide +kernel
theorem okB5345 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5345 1 = true := by decide +kernel
theorem okB5346 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5346 1 = true := by decide +kernel
theorem okB5347 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5347 1 = true := by decide +kernel
theorem okB5348 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5348 1 = true := by decide +kernel
theorem okB5349 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5349 1 = true := by decide +kernel
theorem okB5350 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5350 1 = true := by decide +kernel
theorem okB5351 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5351 1 = true := by decide +kernel
theorem okB5352 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5352 1 = true := by decide +kernel
theorem okB5353 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5353 1 = true := by decide +kernel
theorem okB5354 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5354 1 = true := by decide +kernel
theorem okG512 : glueChkR lits W 5344 11 = true := by decide +kernel
theorem okM512 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 1 = true := okB5344
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 2 = true := blkChk_join _ _ _ _ _ 5344 1 1 h0 okB5345
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 3 = true := blkChk_join _ _ _ _ _ 5344 2 1 h1 okB5346
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 4 = true := blkChk_join _ _ _ _ _ 5344 3 1 h2 okB5347
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 5 = true := blkChk_join _ _ _ _ _ 5344 4 1 h3 okB5348
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 6 = true := blkChk_join _ _ _ _ _ 5344 5 1 h4 okB5349
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 7 = true := blkChk_join _ _ _ _ _ 5344 6 1 h5 okB5350
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 8 = true := blkChk_join _ _ _ _ _ 5344 7 1 h6 okB5351
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 9 = true := blkChk_join _ _ _ _ _ 5344 8 1 h7 okB5352
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 10 = true := blkChk_join _ _ _ _ _ 5344 9 1 h8 okB5353
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5344 11 = true := blkChk_join _ _ _ _ _ 5344 10 1 h9 okB5354
  exact h10
end E1.C384X
