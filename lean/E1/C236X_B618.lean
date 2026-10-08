module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6511 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6512 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6512 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6513 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6513 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6514 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6514 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6515 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6515 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6516 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6516 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6517 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6517 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6518 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6519 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6520 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6521 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG618 : glueChkR lits W 6511 11 = true := by
  rw [← glueChkRN_eq lits W 8596 6511 lenT]; decide +kernel
theorem okM618 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 1 = true := okB6511
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 2 = true := blkChk_join _ _ _ _ _ 6511 1 1 h0 okB6512
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 3 = true := blkChk_join _ _ _ _ _ 6511 2 1 h1 okB6513
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 4 = true := blkChk_join _ _ _ _ _ 6511 3 1 h2 okB6514
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 5 = true := blkChk_join _ _ _ _ _ 6511 4 1 h3 okB6515
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 6 = true := blkChk_join _ _ _ _ _ 6511 5 1 h4 okB6516
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 7 = true := blkChk_join _ _ _ _ _ 6511 6 1 h5 okB6517
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 8 = true := blkChk_join _ _ _ _ _ 6511 7 1 h6 okB6518
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 9 = true := blkChk_join _ _ _ _ _ 6511 8 1 h7 okB6519
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 10 = true := blkChk_join _ _ _ _ _ 6511 9 1 h8 okB6520
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6511 11 = true := blkChk_join _ _ _ _ _ 6511 10 1 h9 okB6521
  exact h10
end E1.C236X
