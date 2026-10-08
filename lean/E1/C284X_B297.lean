module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2732 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2733 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2733 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2734 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2734 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2735 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2735 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2736 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2736 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2737 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2737 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2738 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2738 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2739 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2739 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2740 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2740 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG297 : glueChkR lits W 2732 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2732 lenT]; decide +kernel
theorem okM297 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 1 = true := okB2732
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 2 = true := blkChk_join _ _ _ _ _ 2732 1 1 h0 okB2733
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 3 = true := blkChk_join _ _ _ _ _ 2732 2 1 h1 okB2734
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 4 = true := blkChk_join _ _ _ _ _ 2732 3 1 h2 okB2735
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 5 = true := blkChk_join _ _ _ _ _ 2732 4 1 h3 okB2736
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 6 = true := blkChk_join _ _ _ _ _ 2732 5 1 h4 okB2737
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 7 = true := blkChk_join _ _ _ _ _ 2732 6 1 h5 okB2738
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 8 = true := blkChk_join _ _ _ _ _ 2732 7 1 h6 okB2739
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2732 9 = true := blkChk_join _ _ _ _ _ 2732 8 1 h7 okB2740
  exact h8
end E1.C284X
