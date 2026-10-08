module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2715 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2716 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2716 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2717 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2717 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2718 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2718 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2719 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2719 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2720 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2720 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2721 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2721 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2722 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2722 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG295 : glueChkR lits W 2715 8 = true := by
  rw [← glueChkRN_eq lits W 7747 2715 lenT]; decide +kernel
theorem okM295 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 1 = true := okB2715
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 2 = true := blkChk_join _ _ _ _ _ 2715 1 1 h0 okB2716
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 3 = true := blkChk_join _ _ _ _ _ 2715 2 1 h1 okB2717
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 4 = true := blkChk_join _ _ _ _ _ 2715 3 1 h2 okB2718
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 5 = true := blkChk_join _ _ _ _ _ 2715 4 1 h3 okB2719
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 6 = true := blkChk_join _ _ _ _ _ 2715 5 1 h4 okB2720
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 7 = true := blkChk_join _ _ _ _ _ 2715 6 1 h5 okB2721
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2715 8 = true := blkChk_join _ _ _ _ _ 2715 7 1 h6 okB2722
  exact h7
end E1.C284X
