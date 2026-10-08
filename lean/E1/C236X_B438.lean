module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4463 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4464 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4464 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4465 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4465 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4466 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4466 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4467 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4467 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4468 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4468 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4469 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4469 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4470 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4470 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG438 : glueChkR lits W 4463 8 = true := by
  rw [← glueChkRN_eq lits W 8596 4463 lenT]; decide +kernel
theorem okM438 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 1 = true := okB4463
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 2 = true := blkChk_join _ _ _ _ _ 4463 1 1 h0 okB4464
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 3 = true := blkChk_join _ _ _ _ _ 4463 2 1 h1 okB4465
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 4 = true := blkChk_join _ _ _ _ _ 4463 3 1 h2 okB4466
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 5 = true := blkChk_join _ _ _ _ _ 4463 4 1 h3 okB4467
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 6 = true := blkChk_join _ _ _ _ _ 4463 5 1 h4 okB4468
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 7 = true := blkChk_join _ _ _ _ _ 4463 6 1 h5 okB4469
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4463 8 = true := blkChk_join _ _ _ _ _ 4463 7 1 h6 okB4470
  exact h7
end E1.C236X
