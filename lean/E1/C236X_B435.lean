module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4428 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4429 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4429 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4430 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4430 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4431 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4431 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4432 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4432 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4433 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4433 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4434 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4434 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4435 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4435 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4436 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4436 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG435 : glueChkR lits W 4428 9 = true := by
  rw [← glueChkRN_eq lits W 8596 4428 lenT]; decide +kernel
theorem okM435 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 1 = true := okB4428
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 2 = true := blkChk_join _ _ _ _ _ 4428 1 1 h0 okB4429
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 3 = true := blkChk_join _ _ _ _ _ 4428 2 1 h1 okB4430
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 4 = true := blkChk_join _ _ _ _ _ 4428 3 1 h2 okB4431
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 5 = true := blkChk_join _ _ _ _ _ 4428 4 1 h3 okB4432
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 6 = true := blkChk_join _ _ _ _ _ 4428 5 1 h4 okB4433
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 7 = true := blkChk_join _ _ _ _ _ 4428 6 1 h5 okB4434
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 8 = true := blkChk_join _ _ _ _ _ 4428 7 1 h6 okB4435
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4428 9 = true := blkChk_join _ _ _ _ _ 4428 8 1 h7 okB4436
  exact h8
end E1.C236X
