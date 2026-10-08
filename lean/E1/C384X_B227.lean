module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2428 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 1 = true := by decide +kernel
theorem okB2429 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2429 1 = true := by decide +kernel
theorem okB2430 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2430 1 = true := by decide +kernel
theorem okB2431 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2431 1 = true := by decide +kernel
theorem okB2432 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2432 1 = true := by decide +kernel
theorem okB2433 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2433 1 = true := by decide +kernel
theorem okB2434 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2434 1 = true := by decide +kernel
theorem okB2435 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2435 1 = true := by decide +kernel
theorem okG227 : glueChkR lits W 2428 8 = true := by decide +kernel
theorem okM227 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 1 = true := okB2428
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 2 = true := blkChk_join _ _ _ _ _ 2428 1 1 h0 okB2429
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 3 = true := blkChk_join _ _ _ _ _ 2428 2 1 h1 okB2430
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 4 = true := blkChk_join _ _ _ _ _ 2428 3 1 h2 okB2431
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 5 = true := blkChk_join _ _ _ _ _ 2428 4 1 h3 okB2432
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 6 = true := blkChk_join _ _ _ _ _ 2428 5 1 h4 okB2433
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 7 = true := blkChk_join _ _ _ _ _ 2428 6 1 h5 okB2434
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2428 8 = true := blkChk_join _ _ _ _ _ 2428 7 1 h6 okB2435
  exact h7
end E1.C384X
