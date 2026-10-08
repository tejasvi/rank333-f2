module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4535 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 1 = true := by decide +kernel
theorem okB4536 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4536 1 = true := by decide +kernel
theorem okB4537 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4537 1 = true := by decide +kernel
theorem okB4538 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4538 1 = true := by decide +kernel
theorem okB4539 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4539 1 = true := by decide +kernel
theorem okB4540 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4540 1 = true := by decide +kernel
theorem okB4541 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4541 1 = true := by decide +kernel
theorem okB4542 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4542 1 = true := by decide +kernel
theorem okB4543 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4543 1 = true := by decide +kernel
theorem okB4544 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4544 1 = true := by decide +kernel
theorem okG433 : glueChkR lits W 4535 10 = true := by decide +kernel
theorem okM433 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 1 = true := okB4535
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 2 = true := blkChk_join _ _ _ _ _ 4535 1 1 h0 okB4536
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 3 = true := blkChk_join _ _ _ _ _ 4535 2 1 h1 okB4537
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 4 = true := blkChk_join _ _ _ _ _ 4535 3 1 h2 okB4538
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 5 = true := blkChk_join _ _ _ _ _ 4535 4 1 h3 okB4539
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 6 = true := blkChk_join _ _ _ _ _ 4535 5 1 h4 okB4540
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 7 = true := blkChk_join _ _ _ _ _ 4535 6 1 h5 okB4541
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 8 = true := blkChk_join _ _ _ _ _ 4535 7 1 h6 okB4542
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 9 = true := blkChk_join _ _ _ _ _ 4535 8 1 h7 okB4543
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4535 10 = true := blkChk_join _ _ _ _ _ 4535 9 1 h8 okB4544
  exact h9
end E1.C384X
