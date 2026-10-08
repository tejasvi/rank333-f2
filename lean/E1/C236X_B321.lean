module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3267 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3267 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3268 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3268 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3269 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3269 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3270 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3270 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG321 : glueChkR lits W 3267 4 = true := by
  rw [← glueChkRN_eq lits W 8596 3267 lenT]; decide +kernel
theorem okM321 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3267 4 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3267 1 = true := okB3267
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3267 2 = true := blkChk_join _ _ _ _ _ 3267 1 1 h0 okB3268
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3267 3 = true := blkChk_join _ _ _ _ _ 3267 2 1 h1 okB3269
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3267 4 = true := blkChk_join _ _ _ _ _ 3267 3 1 h2 okB3270
  exact h3
end E1.C236X
