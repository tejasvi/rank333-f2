module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4311 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4312 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4312 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4313 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4313 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4314 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4314 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4315 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4315 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4316 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4316 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG423 : glueChkR lits W 4311 6 = true := by
  rw [← glueChkRN_eq lits W 8596 4311 lenT]; decide +kernel
theorem okM423 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 1 = true := okB4311
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 2 = true := blkChk_join _ _ _ _ _ 4311 1 1 h0 okB4312
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 3 = true := blkChk_join _ _ _ _ _ 4311 2 1 h1 okB4313
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 4 = true := blkChk_join _ _ _ _ _ 4311 3 1 h2 okB4314
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 5 = true := blkChk_join _ _ _ _ _ 4311 4 1 h3 okB4315
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4311 6 = true := blkChk_join _ _ _ _ _ 4311 5 1 h4 okB4316
  exact h5
end E1.C236X
