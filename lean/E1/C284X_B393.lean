module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3757 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3758 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3758 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3759 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3759 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3760 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3760 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3761 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3761 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3762 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3762 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3763 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3763 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3764 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3764 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3765 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3765 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3766 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3766 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG393 : glueChkR lits W 3757 10 = true := by
  rw [← glueChkRN_eq lits W 7747 3757 lenT]; decide +kernel
theorem okM393 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 1 = true := okB3757
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 2 = true := blkChk_join _ _ _ _ _ 3757 1 1 h0 okB3758
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 3 = true := blkChk_join _ _ _ _ _ 3757 2 1 h1 okB3759
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 4 = true := blkChk_join _ _ _ _ _ 3757 3 1 h2 okB3760
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 5 = true := blkChk_join _ _ _ _ _ 3757 4 1 h3 okB3761
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 6 = true := blkChk_join _ _ _ _ _ 3757 5 1 h4 okB3762
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 7 = true := blkChk_join _ _ _ _ _ 3757 6 1 h5 okB3763
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 8 = true := blkChk_join _ _ _ _ _ 3757 7 1 h6 okB3764
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 9 = true := blkChk_join _ _ _ _ _ 3757 8 1 h7 okB3765
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3757 10 = true := blkChk_join _ _ _ _ _ 3757 9 1 h8 okB3766
  exact h9
end E1.C284X
