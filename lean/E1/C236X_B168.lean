module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1767 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1768 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1768 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1769 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1769 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1770 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1770 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1771 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1771 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1772 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1772 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1773 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1773 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1774 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1774 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG168 : glueChkR lits W 1767 8 = true := by
  rw [← glueChkRN_eq lits W 8596 1767 lenT]; decide +kernel
theorem okM168 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 1 = true := okB1767
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 2 = true := blkChk_join _ _ _ _ _ 1767 1 1 h0 okB1768
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 3 = true := blkChk_join _ _ _ _ _ 1767 2 1 h1 okB1769
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 4 = true := blkChk_join _ _ _ _ _ 1767 3 1 h2 okB1770
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 5 = true := blkChk_join _ _ _ _ _ 1767 4 1 h3 okB1771
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 6 = true := blkChk_join _ _ _ _ _ 1767 5 1 h4 okB1772
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 7 = true := blkChk_join _ _ _ _ _ 1767 6 1 h5 okB1773
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1767 8 = true := blkChk_join _ _ _ _ _ 1767 7 1 h6 okB1774
  exact h7
end E1.C236X
