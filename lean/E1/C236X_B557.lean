module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5747 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5748 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5748 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5749 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5749 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5750 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5750 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5751 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5751 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5752 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5752 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5753 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5753 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG557 : glueChkR lits W 5747 7 = true := by
  rw [← glueChkRN_eq lits W 8596 5747 lenT]; decide +kernel
theorem okM557 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 1 = true := okB5747
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 2 = true := blkChk_join _ _ _ _ _ 5747 1 1 h0 okB5748
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 3 = true := blkChk_join _ _ _ _ _ 5747 2 1 h1 okB5749
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 4 = true := blkChk_join _ _ _ _ _ 5747 3 1 h2 okB5750
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 5 = true := blkChk_join _ _ _ _ _ 5747 4 1 h3 okB5751
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 6 = true := blkChk_join _ _ _ _ _ 5747 5 1 h4 okB5752
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5747 7 = true := blkChk_join _ _ _ _ _ 5747 6 1 h5 okB5753
  exact h6
end E1.C236X
