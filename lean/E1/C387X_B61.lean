module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB670 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 1 = true := by decide +kernel
theorem okB671 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 671 1 = true := by decide +kernel
theorem okB672 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 672 1 = true := by decide +kernel
theorem okB673 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 673 1 = true := by decide +kernel
theorem okB674 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 674 1 = true := by decide +kernel
theorem okB675 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 675 1 = true := by decide +kernel
theorem okB676 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 676 1 = true := by decide +kernel
theorem okB677 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 677 1 = true := by decide +kernel
theorem okB678 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 678 1 = true := by decide +kernel
theorem okB679 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 679 1 = true := by decide +kernel
theorem okB680 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 680 1 = true := by decide +kernel
theorem okG61 : glueChkR lits W 670 11 = true := by decide +kernel
theorem okM61 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 11 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 1 = true := okB670
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 2 = true := blkChk_join _ _ _ _ _ 670 1 1 h0 okB671
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 3 = true := blkChk_join _ _ _ _ _ 670 2 1 h1 okB672
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 4 = true := blkChk_join _ _ _ _ _ 670 3 1 h2 okB673
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 5 = true := blkChk_join _ _ _ _ _ 670 4 1 h3 okB674
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 6 = true := blkChk_join _ _ _ _ _ 670 5 1 h4 okB675
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 7 = true := blkChk_join _ _ _ _ _ 670 6 1 h5 okB676
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 8 = true := blkChk_join _ _ _ _ _ 670 7 1 h6 okB677
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 9 = true := blkChk_join _ _ _ _ _ 670 8 1 h7 okB678
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 10 = true := blkChk_join _ _ _ _ _ 670 9 1 h8 okB679
  have h10 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 670 11 = true := blkChk_join _ _ _ _ _ 670 10 1 h9 okB680
  exact h10
end E1.C387X
