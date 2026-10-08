module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1518 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1519 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1519 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1520 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1520 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1521 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1521 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1522 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1522 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1523 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1523 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1524 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1524 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG140 : glueChkR lits W 1518 7 = true := by
  rw [← glueChkRN_eq lits W 8596 1518 lenT]; decide +kernel
theorem okM140 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 1 = true := okB1518
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 2 = true := blkChk_join _ _ _ _ _ 1518 1 1 h0 okB1519
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 3 = true := blkChk_join _ _ _ _ _ 1518 2 1 h1 okB1520
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 4 = true := blkChk_join _ _ _ _ _ 1518 3 1 h2 okB1521
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 5 = true := blkChk_join _ _ _ _ _ 1518 4 1 h3 okB1522
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 6 = true := blkChk_join _ _ _ _ _ 1518 5 1 h4 okB1523
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1518 7 = true := blkChk_join _ _ _ _ _ 1518 6 1 h5 okB1524
  exact h6
end E1.C236X
