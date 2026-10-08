module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3688 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3689 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3689 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3690 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3690 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3691 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3691 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3692 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3692 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3693 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3693 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3694 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3694 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3695 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3695 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3696 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3696 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3697 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3697 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3698 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3698 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG388 : glueChkR lits W 3688 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3688 lenT]; decide +kernel
theorem okM388 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 1 = true := okB3688
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 2 = true := blkChk_join _ _ _ _ _ 3688 1 1 h0 okB3689
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 3 = true := blkChk_join _ _ _ _ _ 3688 2 1 h1 okB3690
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 4 = true := blkChk_join _ _ _ _ _ 3688 3 1 h2 okB3691
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 5 = true := blkChk_join _ _ _ _ _ 3688 4 1 h3 okB3692
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 6 = true := blkChk_join _ _ _ _ _ 3688 5 1 h4 okB3693
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 7 = true := blkChk_join _ _ _ _ _ 3688 6 1 h5 okB3694
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 8 = true := blkChk_join _ _ _ _ _ 3688 7 1 h6 okB3695
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 9 = true := blkChk_join _ _ _ _ _ 3688 8 1 h7 okB3696
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 10 = true := blkChk_join _ _ _ _ _ 3688 9 1 h8 okB3697
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3688 11 = true := blkChk_join _ _ _ _ _ 3688 10 1 h9 okB3698
  exact h10
end E1.C284X
