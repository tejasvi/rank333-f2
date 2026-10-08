module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4323 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4324 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4324 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4325 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4325 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4326 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4326 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4327 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4327 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4328 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4328 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4329 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4329 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4330 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4330 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4331 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4331 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG425 : glueChkR lits W 4323 9 = true := by
  rw [← glueChkRN_eq lits W 8596 4323 lenT]; decide +kernel
theorem okM425 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 1 = true := okB4323
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 2 = true := blkChk_join _ _ _ _ _ 4323 1 1 h0 okB4324
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 3 = true := blkChk_join _ _ _ _ _ 4323 2 1 h1 okB4325
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 4 = true := blkChk_join _ _ _ _ _ 4323 3 1 h2 okB4326
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 5 = true := blkChk_join _ _ _ _ _ 4323 4 1 h3 okB4327
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 6 = true := blkChk_join _ _ _ _ _ 4323 5 1 h4 okB4328
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 7 = true := blkChk_join _ _ _ _ _ 4323 6 1 h5 okB4329
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 8 = true := blkChk_join _ _ _ _ _ 4323 7 1 h6 okB4330
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4323 9 = true := blkChk_join _ _ _ _ _ 4323 8 1 h7 okB4331
  exact h8
end E1.C236X
