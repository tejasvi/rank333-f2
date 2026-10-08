module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4420 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 1 = true := by decide +kernel
theorem okB4421 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4421 1 = true := by decide +kernel
theorem okB4422 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4422 1 = true := by decide +kernel
theorem okB4423 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4423 1 = true := by decide +kernel
theorem okB4424 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4424 1 = true := by decide +kernel
theorem okB4425 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4425 1 = true := by decide +kernel
theorem okB4426 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4426 1 = true := by decide +kernel
theorem okB4427 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4427 1 = true := by decide +kernel
theorem okB4428 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4428 1 = true := by decide +kernel
theorem okB4429 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4429 1 = true := by decide +kernel
theorem okG422 : glueChkR lits W 4420 10 = true := by decide +kernel
theorem okM422 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 1 = true := okB4420
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 2 = true := blkChk_join _ _ _ _ _ 4420 1 1 h0 okB4421
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 3 = true := blkChk_join _ _ _ _ _ 4420 2 1 h1 okB4422
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 4 = true := blkChk_join _ _ _ _ _ 4420 3 1 h2 okB4423
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 5 = true := blkChk_join _ _ _ _ _ 4420 4 1 h3 okB4424
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 6 = true := blkChk_join _ _ _ _ _ 4420 5 1 h4 okB4425
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 7 = true := blkChk_join _ _ _ _ _ 4420 6 1 h5 okB4426
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 8 = true := blkChk_join _ _ _ _ _ 4420 7 1 h6 okB4427
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 9 = true := blkChk_join _ _ _ _ _ 4420 8 1 h7 okB4428
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4420 10 = true := blkChk_join _ _ _ _ _ 4420 9 1 h8 okB4429
  exact h9
end E1.C384X
