module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB634 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB635 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 635 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB636 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 636 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB637 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 637 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB638 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 638 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB639 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 639 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB640 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 640 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB641 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 641 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB642 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB643 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG60 : glueChkR lits W 634 10 = true := by
  rw [← glueChkRN_eq lits W 8596 634 lenT]; decide +kernel
theorem okM60 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 1 = true := okB634
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 2 = true := blkChk_join _ _ _ _ _ 634 1 1 h0 okB635
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 3 = true := blkChk_join _ _ _ _ _ 634 2 1 h1 okB636
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 4 = true := blkChk_join _ _ _ _ _ 634 3 1 h2 okB637
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 5 = true := blkChk_join _ _ _ _ _ 634 4 1 h3 okB638
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 6 = true := blkChk_join _ _ _ _ _ 634 5 1 h4 okB639
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 7 = true := blkChk_join _ _ _ _ _ 634 6 1 h5 okB640
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 8 = true := blkChk_join _ _ _ _ _ 634 7 1 h6 okB641
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 9 = true := blkChk_join _ _ _ _ _ 634 8 1 h7 okB642
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 634 10 = true := blkChk_join _ _ _ _ _ 634 9 1 h8 okB643
  exact h9
end E1.C236X
