module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2741 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2742 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2742 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2743 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2743 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2744 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2744 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2745 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2745 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2746 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2746 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2747 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2747 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG298 : glueChkR lits W 2741 7 = true := by
  rw [← glueChkRN_eq lits W 7747 2741 lenT]; decide +kernel
theorem okM298 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 1 = true := okB2741
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 2 = true := blkChk_join _ _ _ _ _ 2741 1 1 h0 okB2742
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 3 = true := blkChk_join _ _ _ _ _ 2741 2 1 h1 okB2743
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 4 = true := blkChk_join _ _ _ _ _ 2741 3 1 h2 okB2744
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 5 = true := blkChk_join _ _ _ _ _ 2741 4 1 h3 okB2745
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 6 = true := blkChk_join _ _ _ _ _ 2741 5 1 h4 okB2746
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2741 7 = true := blkChk_join _ _ _ _ _ 2741 6 1 h5 okB2747
  exact h6
end E1.C284X
