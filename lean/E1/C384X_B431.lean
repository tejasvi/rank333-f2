module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4515 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 1 = true := by decide +kernel
theorem okB4516 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4516 1 = true := by decide +kernel
theorem okB4517 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4517 1 = true := by decide +kernel
theorem okB4518 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4518 1 = true := by decide +kernel
theorem okB4519 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4519 1 = true := by decide +kernel
theorem okB4520 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4520 1 = true := by decide +kernel
theorem okB4521 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4521 1 = true := by decide +kernel
theorem okB4522 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4522 1 = true := by decide +kernel
theorem okB4523 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4523 1 = true := by decide +kernel
theorem okG431 : glueChkR lits W 4515 9 = true := by decide +kernel
theorem okM431 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 1 = true := okB4515
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 2 = true := blkChk_join _ _ _ _ _ 4515 1 1 h0 okB4516
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 3 = true := blkChk_join _ _ _ _ _ 4515 2 1 h1 okB4517
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 4 = true := blkChk_join _ _ _ _ _ 4515 3 1 h2 okB4518
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 5 = true := blkChk_join _ _ _ _ _ 4515 4 1 h3 okB4519
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 6 = true := blkChk_join _ _ _ _ _ 4515 5 1 h4 okB4520
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 7 = true := blkChk_join _ _ _ _ _ 4515 6 1 h5 okB4521
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 8 = true := blkChk_join _ _ _ _ _ 4515 7 1 h6 okB4522
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4515 9 = true := blkChk_join _ _ _ _ _ 4515 8 1 h7 okB4523
  exact h8
end E1.C384X
