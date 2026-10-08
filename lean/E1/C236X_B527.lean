module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5401 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5402 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5402 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5403 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5403 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5404 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5404 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5405 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5405 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5406 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5406 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5407 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5407 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5408 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5408 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5409 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5409 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5410 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5410 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG527 : glueChkR lits W 5401 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5401 lenT]; decide +kernel
theorem okM527 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 1 = true := okB5401
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 2 = true := blkChk_join _ _ _ _ _ 5401 1 1 h0 okB5402
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 3 = true := blkChk_join _ _ _ _ _ 5401 2 1 h1 okB5403
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 4 = true := blkChk_join _ _ _ _ _ 5401 3 1 h2 okB5404
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 5 = true := blkChk_join _ _ _ _ _ 5401 4 1 h3 okB5405
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 6 = true := blkChk_join _ _ _ _ _ 5401 5 1 h4 okB5406
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 7 = true := blkChk_join _ _ _ _ _ 5401 6 1 h5 okB5407
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 8 = true := blkChk_join _ _ _ _ _ 5401 7 1 h6 okB5408
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 9 = true := blkChk_join _ _ _ _ _ 5401 8 1 h7 okB5409
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5401 10 = true := blkChk_join _ _ _ _ _ 5401 9 1 h8 okB5410
  exact h9
end E1.C236X
