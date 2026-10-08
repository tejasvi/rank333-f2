module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5755 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5756 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5756 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5757 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5757 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5758 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5758 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5759 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5759 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5760 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5760 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5761 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5761 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5762 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5762 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG607 : glueChkR lits W 5755 8 = true := by
  rw [← glueChkRN_eq lits W 7747 5755 lenT]; decide +kernel
theorem okM607 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 1 = true := okB5755
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 2 = true := blkChk_join _ _ _ _ _ 5755 1 1 h0 okB5756
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 3 = true := blkChk_join _ _ _ _ _ 5755 2 1 h1 okB5757
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 4 = true := blkChk_join _ _ _ _ _ 5755 3 1 h2 okB5758
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 5 = true := blkChk_join _ _ _ _ _ 5755 4 1 h3 okB5759
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 6 = true := blkChk_join _ _ _ _ _ 5755 5 1 h4 okB5760
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 7 = true := blkChk_join _ _ _ _ _ 5755 6 1 h5 okB5761
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5755 8 = true := blkChk_join _ _ _ _ _ 5755 7 1 h6 okB5762
  exact h7
end E1.C284X
