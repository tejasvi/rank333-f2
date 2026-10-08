module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1761 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1762 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1762 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1763 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1763 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1764 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1764 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1765 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1765 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1766 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1766 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1767 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1767 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1768 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1768 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1769 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1769 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG193 : glueChkR lits W 1761 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1761 lenT]; decide +kernel
theorem okM193 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 1 = true := okB1761
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 2 = true := blkChk_join _ _ _ _ _ 1761 1 1 h0 okB1762
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 3 = true := blkChk_join _ _ _ _ _ 1761 2 1 h1 okB1763
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 4 = true := blkChk_join _ _ _ _ _ 1761 3 1 h2 okB1764
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 5 = true := blkChk_join _ _ _ _ _ 1761 4 1 h3 okB1765
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 6 = true := blkChk_join _ _ _ _ _ 1761 5 1 h4 okB1766
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 7 = true := blkChk_join _ _ _ _ _ 1761 6 1 h5 okB1767
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 8 = true := blkChk_join _ _ _ _ _ 1761 7 1 h6 okB1768
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1761 9 = true := blkChk_join _ _ _ _ _ 1761 8 1 h7 okB1769
  exact h8
end E1.C284X
