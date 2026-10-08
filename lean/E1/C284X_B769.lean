module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB7660 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7661 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7661 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7662 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7662 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7663 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7663 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7664 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7664 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7665 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7665 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7666 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7666 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7667 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7667 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7668 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7668 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7669 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7669 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7670 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7670 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG769 : glueChkR lits W 7660 11 = true := by
  rw [← glueChkRN_eq lits W 7747 7660 lenT]; decide +kernel
theorem okM769 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 1 = true := okB7660
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 2 = true := blkChk_join _ _ _ _ _ 7660 1 1 h0 okB7661
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 3 = true := blkChk_join _ _ _ _ _ 7660 2 1 h1 okB7662
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 4 = true := blkChk_join _ _ _ _ _ 7660 3 1 h2 okB7663
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 5 = true := blkChk_join _ _ _ _ _ 7660 4 1 h3 okB7664
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 6 = true := blkChk_join _ _ _ _ _ 7660 5 1 h4 okB7665
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 7 = true := blkChk_join _ _ _ _ _ 7660 6 1 h5 okB7666
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 8 = true := blkChk_join _ _ _ _ _ 7660 7 1 h6 okB7667
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 9 = true := blkChk_join _ _ _ _ _ 7660 8 1 h7 okB7668
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 10 = true := blkChk_join _ _ _ _ _ 7660 9 1 h8 okB7669
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 7660 11 = true := blkChk_join _ _ _ _ _ 7660 10 1 h9 okB7670
  exact h10
end E1.C284X
