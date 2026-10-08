module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4441 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 1 = true := by decide +kernel
theorem okB4442 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4442 1 = true := by decide +kernel
theorem okB4443 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4443 1 = true := by decide +kernel
theorem okB4444 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4444 1 = true := by decide +kernel
theorem okB4445 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4445 1 = true := by decide +kernel
theorem okB4446 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4446 1 = true := by decide +kernel
theorem okB4447 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4447 1 = true := by decide +kernel
theorem okB4448 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4448 1 = true := by decide +kernel
theorem okB4449 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4449 1 = true := by decide +kernel
theorem okG424 : glueChkR lits W 4441 9 = true := by decide +kernel
theorem okM424 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 1 = true := okB4441
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 2 = true := blkChk_join _ _ _ _ _ 4441 1 1 h0 okB4442
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 3 = true := blkChk_join _ _ _ _ _ 4441 2 1 h1 okB4443
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 4 = true := blkChk_join _ _ _ _ _ 4441 3 1 h2 okB4444
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 5 = true := blkChk_join _ _ _ _ _ 4441 4 1 h3 okB4445
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 6 = true := blkChk_join _ _ _ _ _ 4441 5 1 h4 okB4446
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 7 = true := blkChk_join _ _ _ _ _ 4441 6 1 h5 okB4447
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 8 = true := blkChk_join _ _ _ _ _ 4441 7 1 h6 okB4448
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4441 9 = true := blkChk_join _ _ _ _ _ 4441 8 1 h7 okB4449
  exact h8
end E1.C384X
