module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7289 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7290 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7290 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7291 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7291 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7292 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7292 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7293 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7293 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7294 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG688 : glueChkR lits W 7289 6 = true := by
  rw [← glueChkRN_eq lits W 8596 7289 lenT]; decide +kernel
theorem okM688 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 1 = true := okB7289
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 2 = true := blkChk_join _ _ _ _ _ 7289 1 1 h0 okB7290
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 3 = true := blkChk_join _ _ _ _ _ 7289 2 1 h1 okB7291
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 4 = true := blkChk_join _ _ _ _ _ 7289 3 1 h2 okB7292
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 5 = true := blkChk_join _ _ _ _ _ 7289 4 1 h3 okB7293
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7289 6 = true := blkChk_join _ _ _ _ _ 7289 5 1 h4 okB7294
  exact h5
end E1.C236X
