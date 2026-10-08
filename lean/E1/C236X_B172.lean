module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1802 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1802 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1803 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1803 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1804 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1804 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG172 : glueChkR lits W 1802 3 = true := by
  rw [← glueChkRN_eq lits W 8596 1802 lenT]; decide +kernel
theorem okM172 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1802 3 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1802 1 = true := okB1802
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1802 2 = true := blkChk_join _ _ _ _ _ 1802 1 1 h0 okB1803
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1802 3 = true := blkChk_join _ _ _ _ _ 1802 2 1 h1 okB1804
  exact h2
end E1.C236X
