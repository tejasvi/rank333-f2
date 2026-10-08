module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB595 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 1 = true := by decide +kernel
theorem okB596 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 596 1 = true := by decide +kernel
theorem okB597 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 597 1 = true := by decide +kernel
theorem okB598 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 598 1 = true := by decide +kernel
theorem okB599 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 599 1 = true := by decide +kernel
theorem okB600 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 600 1 = true := by decide +kernel
theorem okB601 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 601 1 = true := by decide +kernel
theorem okB602 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 602 1 = true := by decide +kernel
theorem okG54 : glueChkR lits W 595 8 = true := by decide +kernel
theorem okM54 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 8 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 1 = true := okB595
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 2 = true := blkChk_join _ _ _ _ _ 595 1 1 h0 okB596
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 3 = true := blkChk_join _ _ _ _ _ 595 2 1 h1 okB597
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 4 = true := blkChk_join _ _ _ _ _ 595 3 1 h2 okB598
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 5 = true := blkChk_join _ _ _ _ _ 595 4 1 h3 okB599
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 6 = true := blkChk_join _ _ _ _ _ 595 5 1 h4 okB600
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 7 = true := blkChk_join _ _ _ _ _ 595 6 1 h5 okB601
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 595 8 = true := blkChk_join _ _ _ _ _ 595 7 1 h6 okB602
  exact h7
end E1.C387X
