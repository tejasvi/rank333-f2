module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1810 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1811 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1811 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1812 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1812 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1813 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1813 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1814 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1815 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1816 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1817 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG174 : glueChkR lits W 1810 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1810 lenT]; decide +kernel
theorem okM174 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 1 = true := okB1810
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 2 = true := blkChk_join _ _ _ _ _ 1810 1 1 h0 okB1811
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 3 = true := blkChk_join _ _ _ _ _ 1810 2 1 h1 okB1812
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 4 = true := blkChk_join _ _ _ _ _ 1810 3 1 h2 okB1813
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 5 = true := blkChk_join _ _ _ _ _ 1810 4 1 h3 okB1814
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 6 = true := blkChk_join _ _ _ _ _ 1810 5 1 h4 okB1815
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 7 = true := blkChk_join _ _ _ _ _ 1810 6 1 h5 okB1816
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1810 8 = true := blkChk_join _ _ _ _ _ 1810 7 1 h6 okB1817
  exact h7
end E1.C236X
