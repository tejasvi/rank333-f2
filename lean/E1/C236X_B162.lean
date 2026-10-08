module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1704 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1705 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1705 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1706 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1706 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1707 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1707 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1708 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1708 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1709 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1709 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1710 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1710 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1711 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1711 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1712 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1712 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1713 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1713 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1714 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1714 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1715 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1715 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG162 : glueChkR lits W 1704 12 = true := by
  rw [← glueChkRN_eq lits W 8596 1704 lenT]; decide +kernel
theorem okM162 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 1 = true := okB1704
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 2 = true := blkChk_join _ _ _ _ _ 1704 1 1 h0 okB1705
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 3 = true := blkChk_join _ _ _ _ _ 1704 2 1 h1 okB1706
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 4 = true := blkChk_join _ _ _ _ _ 1704 3 1 h2 okB1707
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 5 = true := blkChk_join _ _ _ _ _ 1704 4 1 h3 okB1708
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 6 = true := blkChk_join _ _ _ _ _ 1704 5 1 h4 okB1709
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 7 = true := blkChk_join _ _ _ _ _ 1704 6 1 h5 okB1710
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 8 = true := blkChk_join _ _ _ _ _ 1704 7 1 h6 okB1711
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 9 = true := blkChk_join _ _ _ _ _ 1704 8 1 h7 okB1712
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 10 = true := blkChk_join _ _ _ _ _ 1704 9 1 h8 okB1713
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 11 = true := blkChk_join _ _ _ _ _ 1704 10 1 h9 okB1714
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1704 12 = true := blkChk_join _ _ _ _ _ 1704 11 1 h10 okB1715
  exact h11
end E1.C236X
