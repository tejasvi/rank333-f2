module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB455 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 1 = true := by decide +kernel
theorem okB456 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 456 1 = true := by decide +kernel
theorem okB457 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 457 1 = true := by decide +kernel
theorem okB458 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 458 1 = true := by decide +kernel
theorem okB459 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 459 1 = true := by decide +kernel
theorem okB460 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 460 1 = true := by decide +kernel
theorem okB461 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 461 1 = true := by decide +kernel
theorem okB462 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 462 1 = true := by decide +kernel
theorem okG45 : glueChkR lits W 455 8 = true := by decide +kernel
theorem okM45 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 1 = true := okB455
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 2 = true := blkChk_join _ _ _ _ _ 455 1 1 h0 okB456
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 3 = true := blkChk_join _ _ _ _ _ 455 2 1 h1 okB457
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 4 = true := blkChk_join _ _ _ _ _ 455 3 1 h2 okB458
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 5 = true := blkChk_join _ _ _ _ _ 455 4 1 h3 okB459
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 6 = true := blkChk_join _ _ _ _ _ 455 5 1 h4 okB460
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 7 = true := blkChk_join _ _ _ _ _ 455 6 1 h5 okB461
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 455 8 = true := blkChk_join _ _ _ _ _ 455 7 1 h6 okB462
  exact h7
end E1.C384X
