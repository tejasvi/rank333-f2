module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1729 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1730 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1730 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1731 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1731 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1732 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1732 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1733 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1733 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1734 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1734 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG189 : glueChkR lits W 1729 6 = true := by
  rw [← glueChkRN_eq lits W 7747 1729 lenT]; decide +kernel
theorem okM189 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 1 = true := okB1729
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 2 = true := blkChk_join _ _ _ _ _ 1729 1 1 h0 okB1730
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 3 = true := blkChk_join _ _ _ _ _ 1729 2 1 h1 okB1731
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 4 = true := blkChk_join _ _ _ _ _ 1729 3 1 h2 okB1732
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 5 = true := blkChk_join _ _ _ _ _ 1729 4 1 h3 okB1733
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1729 6 = true := blkChk_join _ _ _ _ _ 1729 5 1 h4 okB1734
  exact h5
end E1.C284X
