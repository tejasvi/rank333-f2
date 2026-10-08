module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1727 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1728 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1728 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1729 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1729 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1730 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1730 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1731 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1731 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1732 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1732 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1733 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1733 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1734 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1734 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG164 : glueChkR lits W 1727 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1727 lenT]; decide +kernel
theorem okM164 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 1 = true := okB1727
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 2 = true := blkChk_join _ _ _ _ _ 1727 1 1 h0 okB1728
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 3 = true := blkChk_join _ _ _ _ _ 1727 2 1 h1 okB1729
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 4 = true := blkChk_join _ _ _ _ _ 1727 3 1 h2 okB1730
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 5 = true := blkChk_join _ _ _ _ _ 1727 4 1 h3 okB1731
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 6 = true := blkChk_join _ _ _ _ _ 1727 5 1 h4 okB1732
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 7 = true := blkChk_join _ _ _ _ _ 1727 6 1 h5 okB1733
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1727 8 = true := blkChk_join _ _ _ _ _ 1727 7 1 h6 okB1734
  exact h7
end E1.C236X
