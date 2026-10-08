module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6502 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6503 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6503 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6504 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6504 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6505 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6505 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6506 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6506 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6507 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6507 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6508 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6508 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6509 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6509 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6510 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6510 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6511 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6511 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6512 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6512 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6513 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6513 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6514 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6514 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6515 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6516 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG678 : glueChkR lits W 6502 15 = true := by
  rw [← glueChkRN_eq lits W 7747 6502 lenT]; decide +kernel
theorem okM678 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 15 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 1 = true := okB6502
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 2 = true := blkChk_join _ _ _ _ _ 6502 1 1 h0 okB6503
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 3 = true := blkChk_join _ _ _ _ _ 6502 2 1 h1 okB6504
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 4 = true := blkChk_join _ _ _ _ _ 6502 3 1 h2 okB6505
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 5 = true := blkChk_join _ _ _ _ _ 6502 4 1 h3 okB6506
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 6 = true := blkChk_join _ _ _ _ _ 6502 5 1 h4 okB6507
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 7 = true := blkChk_join _ _ _ _ _ 6502 6 1 h5 okB6508
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 8 = true := blkChk_join _ _ _ _ _ 6502 7 1 h6 okB6509
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 9 = true := blkChk_join _ _ _ _ _ 6502 8 1 h7 okB6510
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 10 = true := blkChk_join _ _ _ _ _ 6502 9 1 h8 okB6511
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 11 = true := blkChk_join _ _ _ _ _ 6502 10 1 h9 okB6512
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 12 = true := blkChk_join _ _ _ _ _ 6502 11 1 h10 okB6513
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 13 = true := blkChk_join _ _ _ _ _ 6502 12 1 h11 okB6514
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 14 = true := blkChk_join _ _ _ _ _ 6502 13 1 h12 okB6515
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6502 15 = true := blkChk_join _ _ _ _ _ 6502 14 1 h13 okB6516
  exact h14
end E1.C284X
