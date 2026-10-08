module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4276 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 1 = true := by decide +kernel
theorem okB4277 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4277 1 = true := by decide +kernel
theorem okB4278 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4278 1 = true := by decide +kernel
theorem okB4279 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4279 1 = true := by decide +kernel
theorem okB4280 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4280 1 = true := by decide +kernel
theorem okB4281 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4281 1 = true := by decide +kernel
theorem okB4282 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4282 1 = true := by decide +kernel
theorem okB4283 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4283 1 = true := by decide +kernel
theorem okB4284 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4284 1 = true := by decide +kernel
theorem okB4285 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4285 1 = true := by decide +kernel
theorem okG408 : glueChkR lits W 4276 10 = true := by decide +kernel
theorem okM408 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 1 = true := okB4276
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 2 = true := blkChk_join _ _ _ _ _ 4276 1 1 h0 okB4277
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 3 = true := blkChk_join _ _ _ _ _ 4276 2 1 h1 okB4278
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 4 = true := blkChk_join _ _ _ _ _ 4276 3 1 h2 okB4279
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 5 = true := blkChk_join _ _ _ _ _ 4276 4 1 h3 okB4280
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 6 = true := blkChk_join _ _ _ _ _ 4276 5 1 h4 okB4281
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 7 = true := blkChk_join _ _ _ _ _ 4276 6 1 h5 okB4282
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 8 = true := blkChk_join _ _ _ _ _ 4276 7 1 h6 okB4283
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 9 = true := blkChk_join _ _ _ _ _ 4276 8 1 h7 okB4284
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4276 10 = true := blkChk_join _ _ _ _ _ 4276 9 1 h8 okB4285
  exact h9
end E1.C384X
