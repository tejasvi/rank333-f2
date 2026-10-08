module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4504 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 1 = true := by decide +kernel
theorem okB4505 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4505 1 = true := by decide +kernel
theorem okB4506 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4506 1 = true := by decide +kernel
theorem okB4507 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4507 1 = true := by decide +kernel
theorem okB4508 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4508 1 = true := by decide +kernel
theorem okB4509 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4509 1 = true := by decide +kernel
theorem okB4510 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4510 1 = true := by decide +kernel
theorem okB4511 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4511 1 = true := by decide +kernel
theorem okB4512 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4512 1 = true := by decide +kernel
theorem okB4513 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4513 1 = true := by decide +kernel
theorem okB4514 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4514 1 = true := by decide +kernel
theorem okG430 : glueChkR lits W 4504 11 = true := by decide +kernel
theorem okM430 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 1 = true := okB4504
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 2 = true := blkChk_join _ _ _ _ _ 4504 1 1 h0 okB4505
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 3 = true := blkChk_join _ _ _ _ _ 4504 2 1 h1 okB4506
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 4 = true := blkChk_join _ _ _ _ _ 4504 3 1 h2 okB4507
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 5 = true := blkChk_join _ _ _ _ _ 4504 4 1 h3 okB4508
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 6 = true := blkChk_join _ _ _ _ _ 4504 5 1 h4 okB4509
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 7 = true := blkChk_join _ _ _ _ _ 4504 6 1 h5 okB4510
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 8 = true := blkChk_join _ _ _ _ _ 4504 7 1 h6 okB4511
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 9 = true := blkChk_join _ _ _ _ _ 4504 8 1 h7 okB4512
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 10 = true := blkChk_join _ _ _ _ _ 4504 9 1 h8 okB4513
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4504 11 = true := blkChk_join _ _ _ _ _ 4504 10 1 h9 okB4514
  exact h10
end E1.C384X
