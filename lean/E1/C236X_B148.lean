module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1578 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1579 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1579 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1580 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1580 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1581 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1581 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1582 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1582 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1583 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1583 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1584 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1584 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1585 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1585 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1586 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1586 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1587 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1587 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG148 : glueChkR lits W 1578 10 = true := by
  rw [← glueChkRN_eq lits W 8596 1578 lenT]; decide +kernel
theorem okM148 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 1 = true := okB1578
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 2 = true := blkChk_join _ _ _ _ _ 1578 1 1 h0 okB1579
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 3 = true := blkChk_join _ _ _ _ _ 1578 2 1 h1 okB1580
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 4 = true := blkChk_join _ _ _ _ _ 1578 3 1 h2 okB1581
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 5 = true := blkChk_join _ _ _ _ _ 1578 4 1 h3 okB1582
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 6 = true := blkChk_join _ _ _ _ _ 1578 5 1 h4 okB1583
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 7 = true := blkChk_join _ _ _ _ _ 1578 6 1 h5 okB1584
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 8 = true := blkChk_join _ _ _ _ _ 1578 7 1 h6 okB1585
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 9 = true := blkChk_join _ _ _ _ _ 1578 8 1 h7 okB1586
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1578 10 = true := blkChk_join _ _ _ _ _ 1578 9 1 h8 okB1587
  exact h9
end E1.C236X
