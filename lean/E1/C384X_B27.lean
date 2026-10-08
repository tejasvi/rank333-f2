module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB277 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 1 = true := by decide +kernel
theorem okB278 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 278 1 = true := by decide +kernel
theorem okB279 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 279 1 = true := by decide +kernel
theorem okB280 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 280 1 = true := by decide +kernel
theorem okB281 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 281 1 = true := by decide +kernel
theorem okB282 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 282 1 = true := by decide +kernel
theorem okB283 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 283 1 = true := by decide +kernel
theorem okB284 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 284 1 = true := by decide +kernel
theorem okG27 : glueChkR lits W 277 8 = true := by decide +kernel
theorem okM27 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 1 = true := okB277
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 2 = true := blkChk_join _ _ _ _ _ 277 1 1 h0 okB278
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 3 = true := blkChk_join _ _ _ _ _ 277 2 1 h1 okB279
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 4 = true := blkChk_join _ _ _ _ _ 277 3 1 h2 okB280
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 5 = true := blkChk_join _ _ _ _ _ 277 4 1 h3 okB281
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 6 = true := blkChk_join _ _ _ _ _ 277 5 1 h4 okB282
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 7 = true := blkChk_join _ _ _ _ _ 277 6 1 h5 okB283
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 277 8 = true := blkChk_join _ _ _ _ _ 277 7 1 h6 okB284
  exact h7
end E1.C384X
