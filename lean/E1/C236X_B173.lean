module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB1805 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1805 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1806 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1806 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1807 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1807 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1808 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1808 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1809 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1809 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG173 : glueChkR lits W 1805 5 = true := by
  rw [← glueChkRN_eq lits W 8596 1805 lenT]; decide +kernel
theorem okM173 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1805 5 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1805 1 = true := okB1805
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1805 2 = true := blkChk_join _ _ _ _ _ 1805 1 1 h0 okB1806
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1805 3 = true := blkChk_join _ _ _ _ _ 1805 2 1 h1 okB1807
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1805 4 = true := blkChk_join _ _ _ _ _ 1805 3 1 h2 okB1808
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 1805 5 = true := blkChk_join _ _ _ _ _ 1805 4 1 h3 okB1809
  exact h4
end E1.C236X
