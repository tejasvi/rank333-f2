module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB655 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 1 = true := by decide +kernel
theorem okB656 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 656 1 = true := by decide +kernel
theorem okB657 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 657 1 = true := by decide +kernel
theorem okB658 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 658 1 = true := by decide +kernel
theorem okB659 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 659 1 = true := by decide +kernel
theorem okB660 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 660 1 = true := by decide +kernel
theorem okB661 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 661 1 = true := by decide +kernel
theorem okG63 : glueChkR lits W 655 7 = true := by decide +kernel
theorem okM63 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 7 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 1 = true := okB655
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 2 = true := blkChk_join _ _ _ _ _ 655 1 1 h0 okB656
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 3 = true := blkChk_join _ _ _ _ _ 655 2 1 h1 okB657
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 4 = true := blkChk_join _ _ _ _ _ 655 3 1 h2 okB658
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 5 = true := blkChk_join _ _ _ _ _ 655 4 1 h3 okB659
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 6 = true := blkChk_join _ _ _ _ _ 655 5 1 h4 okB660
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 655 7 = true := blkChk_join _ _ _ _ _ 655 6 1 h5 okB661
  exact h6
end E1.C384X
