module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB604 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB605 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 605 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB606 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 606 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB607 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 607 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB608 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 608 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB609 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 609 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB610 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 610 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB611 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 611 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB612 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 612 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB613 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 613 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB614 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 614 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB615 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 615 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG68 : glueChkR lits W 604 12 = true := by
  rw [← glueChkRN_eq lits W 7747 604 lenT]; decide +kernel
theorem okM68 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 1 = true := okB604
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 2 = true := blkChk_join _ _ _ _ _ 604 1 1 h0 okB605
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 3 = true := blkChk_join _ _ _ _ _ 604 2 1 h1 okB606
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 4 = true := blkChk_join _ _ _ _ _ 604 3 1 h2 okB607
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 5 = true := blkChk_join _ _ _ _ _ 604 4 1 h3 okB608
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 6 = true := blkChk_join _ _ _ _ _ 604 5 1 h4 okB609
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 7 = true := blkChk_join _ _ _ _ _ 604 6 1 h5 okB610
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 8 = true := blkChk_join _ _ _ _ _ 604 7 1 h6 okB611
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 9 = true := blkChk_join _ _ _ _ _ 604 8 1 h7 okB612
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 10 = true := blkChk_join _ _ _ _ _ 604 9 1 h8 okB613
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 11 = true := blkChk_join _ _ _ _ _ 604 10 1 h9 okB614
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 604 12 = true := blkChk_join _ _ _ _ _ 604 11 1 h10 okB615
  exact h11
end E1.C284X
