module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5310 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5311 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5312 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5312 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5313 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5313 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5314 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5314 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5315 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5315 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5316 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5316 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5317 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5317 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG519 : glueChkR lits W 5310 8 = true := by
  rw [← glueChkRN_eq lits W 8596 5310 lenT]; decide +kernel
theorem okM519 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 1 = true := okB5310
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 2 = true := blkChk_join _ _ _ _ _ 5310 1 1 h0 okB5311
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 3 = true := blkChk_join _ _ _ _ _ 5310 2 1 h1 okB5312
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 4 = true := blkChk_join _ _ _ _ _ 5310 3 1 h2 okB5313
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 5 = true := blkChk_join _ _ _ _ _ 5310 4 1 h3 okB5314
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 6 = true := blkChk_join _ _ _ _ _ 5310 5 1 h4 okB5315
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 7 = true := blkChk_join _ _ _ _ _ 5310 6 1 h5 okB5316
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5310 8 = true := blkChk_join _ _ _ _ _ 5310 7 1 h6 okB5317
  exact h7
end E1.C236X
