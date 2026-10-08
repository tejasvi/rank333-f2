module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2498 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 1 = true := by decide +kernel
theorem okB2499 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2499 1 = true := by decide +kernel
theorem okB2500 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2500 1 = true := by decide +kernel
theorem okB2501 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2501 1 = true := by decide +kernel
theorem okB2502 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2502 1 = true := by decide +kernel
theorem okB2503 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2503 1 = true := by decide +kernel
theorem okB2504 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2504 1 = true := by decide +kernel
theorem okB2505 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2505 1 = true := by decide +kernel
theorem okG234 : glueChkR lits W 2498 8 = true := by decide +kernel
theorem okM234 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 1 = true := okB2498
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 2 = true := blkChk_join _ _ _ _ _ 2498 1 1 h0 okB2499
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 3 = true := blkChk_join _ _ _ _ _ 2498 2 1 h1 okB2500
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 4 = true := blkChk_join _ _ _ _ _ 2498 3 1 h2 okB2501
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 5 = true := blkChk_join _ _ _ _ _ 2498 4 1 h3 okB2502
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 6 = true := blkChk_join _ _ _ _ _ 2498 5 1 h4 okB2503
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 7 = true := blkChk_join _ _ _ _ _ 2498 6 1 h5 okB2504
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2498 8 = true := blkChk_join _ _ _ _ _ 2498 7 1 h6 okB2505
  exact h7
end E1.C384X
