module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5489 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5490 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5490 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5491 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5491 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5492 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5492 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5493 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5493 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5494 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5494 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG535 : glueChkR lits W 5489 6 = true := by
  rw [← glueChkRN_eq lits W 8596 5489 lenT]; decide +kernel
theorem okM535 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 1 = true := okB5489
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 2 = true := blkChk_join _ _ _ _ _ 5489 1 1 h0 okB5490
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 3 = true := blkChk_join _ _ _ _ _ 5489 2 1 h1 okB5491
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 4 = true := blkChk_join _ _ _ _ _ 5489 3 1 h2 okB5492
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 5 = true := blkChk_join _ _ _ _ _ 5489 4 1 h3 okB5493
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5489 6 = true := blkChk_join _ _ _ _ _ 5489 5 1 h4 okB5494
  exact h5
end E1.C236X
