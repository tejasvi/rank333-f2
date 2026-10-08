module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB657 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 1 = true := by decide +kernel
theorem okB658 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 658 1 = true := by decide +kernel
theorem okB659 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 659 1 = true := by decide +kernel
theorem okB660 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 660 1 = true := by decide +kernel
theorem okB661 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 661 1 = true := by decide +kernel
theorem okB662 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 662 1 = true := by decide +kernel
theorem okB663 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 663 1 = true := by decide +kernel
theorem okB664 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 664 1 = true := by decide +kernel
theorem okG60 : glueChkR lits W 657 8 = true := by decide +kernel
theorem okM60 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 1 = true := okB657
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 2 = true := blkChk_join _ _ _ _ _ 657 1 1 h0 okB658
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 3 = true := blkChk_join _ _ _ _ _ 657 2 1 h1 okB659
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 4 = true := blkChk_join _ _ _ _ _ 657 3 1 h2 okB660
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 5 = true := blkChk_join _ _ _ _ _ 657 4 1 h3 okB661
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 6 = true := blkChk_join _ _ _ _ _ 657 5 1 h4 okB662
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 7 = true := blkChk_join _ _ _ _ _ 657 6 1 h5 okB663
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 657 8 = true := blkChk_join _ _ _ _ _ 657 7 1 h6 okB664
  exact h7
end E1.C382X
