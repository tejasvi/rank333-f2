module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB642 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 1 = true := by decide +kernel
theorem okB643 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 643 1 = true := by decide +kernel
theorem okB644 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 644 1 = true := by decide +kernel
theorem okB645 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 645 1 = true := by decide +kernel
theorem okB646 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 646 1 = true := by decide +kernel
theorem okB647 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 647 1 = true := by decide +kernel
theorem okB648 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 648 1 = true := by decide +kernel
theorem okB649 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 649 1 = true := by decide +kernel
theorem okB650 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 650 1 = true := by decide +kernel
theorem okB651 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 651 1 = true := by decide +kernel
theorem okB652 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 652 1 = true := by decide +kernel
theorem okB653 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 653 1 = true := by decide +kernel
theorem okB654 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 654 1 = true := by decide +kernel
theorem okG62 : glueChkR lits W 642 13 = true := by decide +kernel
theorem okM62 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 1 = true := okB642
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 2 = true := blkChk_join _ _ _ _ _ 642 1 1 h0 okB643
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 3 = true := blkChk_join _ _ _ _ _ 642 2 1 h1 okB644
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 4 = true := blkChk_join _ _ _ _ _ 642 3 1 h2 okB645
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 5 = true := blkChk_join _ _ _ _ _ 642 4 1 h3 okB646
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 6 = true := blkChk_join _ _ _ _ _ 642 5 1 h4 okB647
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 7 = true := blkChk_join _ _ _ _ _ 642 6 1 h5 okB648
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 8 = true := blkChk_join _ _ _ _ _ 642 7 1 h6 okB649
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 9 = true := blkChk_join _ _ _ _ _ 642 8 1 h7 okB650
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 10 = true := blkChk_join _ _ _ _ _ 642 9 1 h8 okB651
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 11 = true := blkChk_join _ _ _ _ _ 642 10 1 h9 okB652
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 12 = true := blkChk_join _ _ _ _ _ 642 11 1 h10 okB653
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 642 13 = true := blkChk_join _ _ _ _ _ 642 12 1 h11 okB654
  exact h12
end E1.C384X
