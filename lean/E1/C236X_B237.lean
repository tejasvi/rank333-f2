module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2413 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2414 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2414 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2415 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2415 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2416 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2416 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2417 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2417 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2418 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2418 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2419 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2419 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2420 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2420 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2421 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2421 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG237 : glueChkR lits W 2413 9 = true := by
  rw [← glueChkRN_eq lits W 8596 2413 lenT]; decide +kernel
theorem okM237 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 1 = true := okB2413
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 2 = true := blkChk_join _ _ _ _ _ 2413 1 1 h0 okB2414
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 3 = true := blkChk_join _ _ _ _ _ 2413 2 1 h1 okB2415
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 4 = true := blkChk_join _ _ _ _ _ 2413 3 1 h2 okB2416
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 5 = true := blkChk_join _ _ _ _ _ 2413 4 1 h3 okB2417
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 6 = true := blkChk_join _ _ _ _ _ 2413 5 1 h4 okB2418
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 7 = true := blkChk_join _ _ _ _ _ 2413 6 1 h5 okB2419
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 8 = true := blkChk_join _ _ _ _ _ 2413 7 1 h6 okB2420
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2413 9 = true := blkChk_join _ _ _ _ _ 2413 8 1 h7 okB2421
  exact h8
end E1.C236X
