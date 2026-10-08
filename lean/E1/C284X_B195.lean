module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1778 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1779 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1779 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1780 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1780 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1781 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1781 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1782 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1782 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1783 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1783 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1784 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1784 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG195 : glueChkR lits W 1778 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1778 lenT]; decide +kernel
theorem okM195 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 1 = true := okB1778
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 2 = true := blkChk_join _ _ _ _ _ 1778 1 1 h0 okB1779
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 3 = true := blkChk_join _ _ _ _ _ 1778 2 1 h1 okB1780
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 4 = true := blkChk_join _ _ _ _ _ 1778 3 1 h2 okB1781
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 5 = true := blkChk_join _ _ _ _ _ 1778 4 1 h3 okB1782
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 6 = true := blkChk_join _ _ _ _ _ 1778 5 1 h4 okB1783
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1778 7 = true := blkChk_join _ _ _ _ _ 1778 6 1 h5 okB1784
  exact h6
end E1.C284X
