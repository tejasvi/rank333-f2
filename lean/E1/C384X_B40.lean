module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB394 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 1 = true := by decide +kernel
theorem okB395 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 395 1 = true := by decide +kernel
theorem okB396 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 396 1 = true := by decide +kernel
theorem okB397 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 397 1 = true := by decide +kernel
theorem okB398 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 398 1 = true := by decide +kernel
theorem okB399 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 399 1 = true := by decide +kernel
theorem okB400 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 400 1 = true := by decide +kernel
theorem okB401 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 401 1 = true := by decide +kernel
theorem okB402 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 402 1 = true := by decide +kernel
theorem okB403 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 403 1 = true := by decide +kernel
theorem okG40 : glueChkR lits W 394 10 = true := by decide +kernel
theorem okM40 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 1 = true := okB394
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 2 = true := blkChk_join _ _ _ _ _ 394 1 1 h0 okB395
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 3 = true := blkChk_join _ _ _ _ _ 394 2 1 h1 okB396
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 4 = true := blkChk_join _ _ _ _ _ 394 3 1 h2 okB397
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 5 = true := blkChk_join _ _ _ _ _ 394 4 1 h3 okB398
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 6 = true := blkChk_join _ _ _ _ _ 394 5 1 h4 okB399
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 7 = true := blkChk_join _ _ _ _ _ 394 6 1 h5 okB400
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 8 = true := blkChk_join _ _ _ _ _ 394 7 1 h6 okB401
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 9 = true := blkChk_join _ _ _ _ _ 394 8 1 h7 okB402
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 394 10 = true := blkChk_join _ _ _ _ _ 394 9 1 h8 okB403
  exact h9
end E1.C384X
