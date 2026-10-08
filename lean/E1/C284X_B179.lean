module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1662 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1662 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1663 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1663 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1664 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1664 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1665 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1665 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG179 : glueChkR lits W 1662 4 = true := by
  rw [← glueChkRN_eq lits W 7747 1662 lenT]; decide +kernel
theorem okM179 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1662 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1662 1 = true := okB1662
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1662 2 = true := blkChk_join _ _ _ _ _ 1662 1 1 h0 okB1663
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1662 3 = true := blkChk_join _ _ _ _ _ 1662 2 1 h1 okB1664
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1662 4 = true := blkChk_join _ _ _ _ _ 1662 3 1 h2 okB1665
  exact h3
end E1.C284X
