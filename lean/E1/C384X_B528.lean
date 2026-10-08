module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5508 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 1 = true := by decide +kernel
theorem okB5509 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5509 1 = true := by decide +kernel
theorem okB5510 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5510 1 = true := by decide +kernel
theorem okB5511 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5511 1 = true := by decide +kernel
theorem okB5512 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5512 1 = true := by decide +kernel
theorem okB5513 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5513 1 = true := by decide +kernel
theorem okB5514 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5514 1 = true := by decide +kernel
theorem okB5515 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5515 1 = true := by decide +kernel
theorem okG528 : glueChkR lits W 5508 8 = true := by decide +kernel
theorem okM528 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 1 = true := okB5508
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 2 = true := blkChk_join _ _ _ _ _ 5508 1 1 h0 okB5509
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 3 = true := blkChk_join _ _ _ _ _ 5508 2 1 h1 okB5510
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 4 = true := blkChk_join _ _ _ _ _ 5508 3 1 h2 okB5511
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 5 = true := blkChk_join _ _ _ _ _ 5508 4 1 h3 okB5512
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 6 = true := blkChk_join _ _ _ _ _ 5508 5 1 h4 okB5513
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 7 = true := blkChk_join _ _ _ _ _ 5508 6 1 h5 okB5514
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5508 8 = true := blkChk_join _ _ _ _ _ 5508 7 1 h6 okB5515
  exact h7
end E1.C384X
