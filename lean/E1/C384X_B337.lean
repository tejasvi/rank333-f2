module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3501 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 1 = true := by decide +kernel
theorem okB3502 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3502 1 = true := by decide +kernel
theorem okB3503 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3503 1 = true := by decide +kernel
theorem okB3504 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3504 1 = true := by decide +kernel
theorem okB3505 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3505 1 = true := by decide +kernel
theorem okB3506 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3506 1 = true := by decide +kernel
theorem okB3507 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3507 1 = true := by decide +kernel
theorem okB3508 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3508 1 = true := by decide +kernel
theorem okB3509 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3509 1 = true := by decide +kernel
theorem okG337 : glueChkR lits W 3501 9 = true := by decide +kernel
theorem okM337 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 1 = true := okB3501
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 2 = true := blkChk_join _ _ _ _ _ 3501 1 1 h0 okB3502
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 3 = true := blkChk_join _ _ _ _ _ 3501 2 1 h1 okB3503
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 4 = true := blkChk_join _ _ _ _ _ 3501 3 1 h2 okB3504
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 5 = true := blkChk_join _ _ _ _ _ 3501 4 1 h3 okB3505
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 6 = true := blkChk_join _ _ _ _ _ 3501 5 1 h4 okB3506
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 7 = true := blkChk_join _ _ _ _ _ 3501 6 1 h5 okB3507
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 8 = true := blkChk_join _ _ _ _ _ 3501 7 1 h6 okB3508
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3501 9 = true := blkChk_join _ _ _ _ _ 3501 8 1 h7 okB3509
  exact h8
end E1.C384X
