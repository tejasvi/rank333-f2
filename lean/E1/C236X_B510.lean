module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5232 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5232 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5233 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5233 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5234 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5234 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5235 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5235 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5236 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5236 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG510 : glueChkR lits W 5232 5 = true := by
  rw [← glueChkRN_eq lits W 8596 5232 lenT]; decide +kernel
theorem okM510 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5232 5 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5232 1 = true := okB5232
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5232 2 = true := blkChk_join _ _ _ _ _ 5232 1 1 h0 okB5233
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5232 3 = true := blkChk_join _ _ _ _ _ 5232 2 1 h1 okB5234
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5232 4 = true := blkChk_join _ _ _ _ _ 5232 3 1 h2 okB5235
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5232 5 = true := blkChk_join _ _ _ _ _ 5232 4 1 h3 okB5236
  exact h4
end E1.C236X
