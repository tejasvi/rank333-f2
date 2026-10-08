module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3699 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3700 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3700 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3701 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3701 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3702 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3702 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3703 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3703 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3704 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3705 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3706 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3709 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3710 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3711 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG389 : glueChkR lits W 3699 13 = true := by
  rw [← glueChkRN_eq lits W 7747 3699 lenT]; decide +kernel
theorem okM389 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 1 = true := okB3699
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 2 = true := blkChk_join _ _ _ _ _ 3699 1 1 h0 okB3700
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 3 = true := blkChk_join _ _ _ _ _ 3699 2 1 h1 okB3701
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 4 = true := blkChk_join _ _ _ _ _ 3699 3 1 h2 okB3702
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 5 = true := blkChk_join _ _ _ _ _ 3699 4 1 h3 okB3703
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 6 = true := blkChk_join _ _ _ _ _ 3699 5 1 h4 okB3704
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 7 = true := blkChk_join _ _ _ _ _ 3699 6 1 h5 okB3705
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 8 = true := blkChk_join _ _ _ _ _ 3699 7 1 h6 okB3706
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 9 = true := blkChk_join _ _ _ _ _ 3699 8 1 h7 okB3707
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 10 = true := blkChk_join _ _ _ _ _ 3699 9 1 h8 okB3708
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 11 = true := blkChk_join _ _ _ _ _ 3699 10 1 h9 okB3709
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 12 = true := blkChk_join _ _ _ _ _ 3699 11 1 h10 okB3710
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3699 13 = true := blkChk_join _ _ _ _ _ 3699 12 1 h11 okB3711
  exact h12
end E1.C284X
