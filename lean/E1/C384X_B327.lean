module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3406 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 1 = true := by decide +kernel
theorem okB3407 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3407 1 = true := by decide +kernel
theorem okB3408 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3408 1 = true := by decide +kernel
theorem okB3409 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3409 1 = true := by decide +kernel
theorem okB3410 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3410 1 = true := by decide +kernel
theorem okB3411 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3411 1 = true := by decide +kernel
theorem okB3412 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3412 1 = true := by decide +kernel
theorem okB3413 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3413 1 = true := by decide +kernel
theorem okG327 : glueChkR lits W 3406 8 = true := by decide +kernel
theorem okM327 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 1 = true := okB3406
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 2 = true := blkChk_join _ _ _ _ _ 3406 1 1 h0 okB3407
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 3 = true := blkChk_join _ _ _ _ _ 3406 2 1 h1 okB3408
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 4 = true := blkChk_join _ _ _ _ _ 3406 3 1 h2 okB3409
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 5 = true := blkChk_join _ _ _ _ _ 3406 4 1 h3 okB3410
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 6 = true := blkChk_join _ _ _ _ _ 3406 5 1 h4 okB3411
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 7 = true := blkChk_join _ _ _ _ _ 3406 6 1 h5 okB3412
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3406 8 = true := blkChk_join _ _ _ _ _ 3406 7 1 h6 okB3413
  exact h7
end E1.C384X
