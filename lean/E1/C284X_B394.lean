module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3767 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3768 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3768 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3769 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3769 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3770 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3770 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3771 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3771 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3772 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3772 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3773 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3773 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3774 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3774 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3775 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3775 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3776 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3776 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3777 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3777 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3778 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3778 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG394 : glueChkR lits W 3767 12 = true := by
  rw [← glueChkRN_eq lits W 7747 3767 lenT]; decide +kernel
theorem okM394 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 12 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 1 = true := okB3767
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 2 = true := blkChk_join _ _ _ _ _ 3767 1 1 h0 okB3768
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 3 = true := blkChk_join _ _ _ _ _ 3767 2 1 h1 okB3769
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 4 = true := blkChk_join _ _ _ _ _ 3767 3 1 h2 okB3770
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 5 = true := blkChk_join _ _ _ _ _ 3767 4 1 h3 okB3771
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 6 = true := blkChk_join _ _ _ _ _ 3767 5 1 h4 okB3772
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 7 = true := blkChk_join _ _ _ _ _ 3767 6 1 h5 okB3773
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 8 = true := blkChk_join _ _ _ _ _ 3767 7 1 h6 okB3774
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 9 = true := blkChk_join _ _ _ _ _ 3767 8 1 h7 okB3775
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 10 = true := blkChk_join _ _ _ _ _ 3767 9 1 h8 okB3776
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 11 = true := blkChk_join _ _ _ _ _ 3767 10 1 h9 okB3777
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3767 12 = true := blkChk_join _ _ _ _ _ 3767 11 1 h10 okB3778
  exact h11
end E1.C284X
