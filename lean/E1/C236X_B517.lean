module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5294 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5295 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5295 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5296 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5296 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5297 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5297 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5298 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5298 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5299 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5299 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5300 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5300 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG517 : glueChkR lits W 5294 7 = true := by
  rw [← glueChkRN_eq lits W 8596 5294 lenT]; decide +kernel
theorem okM517 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 1 = true := okB5294
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 2 = true := blkChk_join _ _ _ _ _ 5294 1 1 h0 okB5295
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 3 = true := blkChk_join _ _ _ _ _ 5294 2 1 h1 okB5296
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 4 = true := blkChk_join _ _ _ _ _ 5294 3 1 h2 okB5297
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 5 = true := blkChk_join _ _ _ _ _ 5294 4 1 h3 okB5298
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 6 = true := blkChk_join _ _ _ _ _ 5294 5 1 h4 okB5299
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5294 7 = true := blkChk_join _ _ _ _ _ 5294 6 1 h5 okB5300
  exact h6
end E1.C236X
