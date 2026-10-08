module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB635 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB636 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 636 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB637 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 637 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB638 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 638 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB639 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 639 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB640 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 640 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB641 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 641 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB642 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 642 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB643 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 643 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB644 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 644 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG71 : glueChkR lits W 635 10 = true := by
  rw [← glueChkRN_eq lits W 7747 635 lenT]; decide +kernel
theorem okM71 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 1 = true := okB635
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 2 = true := blkChk_join _ _ _ _ _ 635 1 1 h0 okB636
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 3 = true := blkChk_join _ _ _ _ _ 635 2 1 h1 okB637
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 4 = true := blkChk_join _ _ _ _ _ 635 3 1 h2 okB638
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 5 = true := blkChk_join _ _ _ _ _ 635 4 1 h3 okB639
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 6 = true := blkChk_join _ _ _ _ _ 635 5 1 h4 okB640
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 7 = true := blkChk_join _ _ _ _ _ 635 6 1 h5 okB641
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 8 = true := blkChk_join _ _ _ _ _ 635 7 1 h6 okB642
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 9 = true := blkChk_join _ _ _ _ _ 635 8 1 h7 okB643
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 635 10 = true := blkChk_join _ _ _ _ _ 635 9 1 h8 okB644
  exact h9
end E1.C284X
