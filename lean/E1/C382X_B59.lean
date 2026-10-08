module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB649 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 1 = true := by decide +kernel
theorem okB650 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 650 1 = true := by decide +kernel
theorem okB651 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 651 1 = true := by decide +kernel
theorem okB652 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 652 1 = true := by decide +kernel
theorem okB653 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 653 1 = true := by decide +kernel
theorem okB654 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 654 1 = true := by decide +kernel
theorem okB655 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 655 1 = true := by decide +kernel
theorem okB656 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 656 1 = true := by decide +kernel
theorem okG59 : glueChkR lits W 649 8 = true := by decide +kernel
theorem okM59 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 1 = true := okB649
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 2 = true := blkChk_join _ _ _ _ _ 649 1 1 h0 okB650
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 3 = true := blkChk_join _ _ _ _ _ 649 2 1 h1 okB651
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 4 = true := blkChk_join _ _ _ _ _ 649 3 1 h2 okB652
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 5 = true := blkChk_join _ _ _ _ _ 649 4 1 h3 okB653
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 6 = true := blkChk_join _ _ _ _ _ 649 5 1 h4 okB654
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 7 = true := blkChk_join _ _ _ _ _ 649 6 1 h5 okB655
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 649 8 = true := blkChk_join _ _ _ _ _ 649 7 1 h6 okB656
  exact h7
end E1.C382X
