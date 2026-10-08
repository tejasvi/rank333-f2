module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5595 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 1 = true := by decide +kernel
theorem okB5596 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5596 1 = true := by decide +kernel
theorem okB5597 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5597 1 = true := by decide +kernel
theorem okB5598 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5598 1 = true := by decide +kernel
theorem okB5599 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5599 1 = true := by decide +kernel
theorem okB5600 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5600 1 = true := by decide +kernel
theorem okB5601 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5601 1 = true := by decide +kernel
theorem okB5602 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5602 1 = true := by decide +kernel
theorem okB5603 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5603 1 = true := by decide +kernel
theorem okG537 : glueChkR lits W 5595 9 = true := by decide +kernel
theorem okM537 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 1 = true := okB5595
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 2 = true := blkChk_join _ _ _ _ _ 5595 1 1 h0 okB5596
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 3 = true := blkChk_join _ _ _ _ _ 5595 2 1 h1 okB5597
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 4 = true := blkChk_join _ _ _ _ _ 5595 3 1 h2 okB5598
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 5 = true := blkChk_join _ _ _ _ _ 5595 4 1 h3 okB5599
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 6 = true := blkChk_join _ _ _ _ _ 5595 5 1 h4 okB5600
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 7 = true := blkChk_join _ _ _ _ _ 5595 6 1 h5 okB5601
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 8 = true := blkChk_join _ _ _ _ _ 5595 7 1 h6 okB5602
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5595 9 = true := blkChk_join _ _ _ _ _ 5595 8 1 h7 okB5603
  exact h8
end E1.C384X
