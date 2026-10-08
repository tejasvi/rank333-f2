module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB665 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 1 = true := by decide +kernel
theorem okB666 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 666 1 = true := by decide +kernel
theorem okB667 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 667 1 = true := by decide +kernel
theorem okB668 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 668 1 = true := by decide +kernel
theorem okB669 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 669 1 = true := by decide +kernel
theorem okB670 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 670 1 = true := by decide +kernel
theorem okB671 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 671 1 = true := by decide +kernel
theorem okB672 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 672 1 = true := by decide +kernel
theorem okB673 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 673 1 = true := by decide +kernel
theorem okB674 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 674 1 = true := by decide +kernel
theorem okB675 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 675 1 = true := by decide +kernel
theorem okB676 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 676 1 = true := by decide +kernel
theorem okB677 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 677 1 = true := by decide +kernel
theorem okG61 : glueChkR lits W 665 13 = true := by decide +kernel
theorem okM61 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 13 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 1 = true := okB665
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 2 = true := blkChk_join _ _ _ _ _ 665 1 1 h0 okB666
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 3 = true := blkChk_join _ _ _ _ _ 665 2 1 h1 okB667
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 4 = true := blkChk_join _ _ _ _ _ 665 3 1 h2 okB668
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 5 = true := blkChk_join _ _ _ _ _ 665 4 1 h3 okB669
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 6 = true := blkChk_join _ _ _ _ _ 665 5 1 h4 okB670
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 7 = true := blkChk_join _ _ _ _ _ 665 6 1 h5 okB671
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 8 = true := blkChk_join _ _ _ _ _ 665 7 1 h6 okB672
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 9 = true := blkChk_join _ _ _ _ _ 665 8 1 h7 okB673
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 10 = true := blkChk_join _ _ _ _ _ 665 9 1 h8 okB674
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 11 = true := blkChk_join _ _ _ _ _ 665 10 1 h9 okB675
  have h11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 12 = true := blkChk_join _ _ _ _ _ 665 11 1 h10 okB676
  have h12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 665 13 = true := blkChk_join _ _ _ _ _ 665 12 1 h11 okB677
  exact h12
end E1.C382X
