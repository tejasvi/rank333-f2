module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1725 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1725 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1726 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1726 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1727 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1727 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1728 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1728 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG188 : glueChkR lits W 1725 4 = true := by
  rw [← glueChkRN_eq lits W 7747 1725 lenT]; decide +kernel
theorem okM188 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1725 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1725 1 = true := okB1725
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1725 2 = true := blkChk_join _ _ _ _ _ 1725 1 1 h0 okB1726
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1725 3 = true := blkChk_join _ _ _ _ _ 1725 2 1 h1 okB1727
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1725 4 = true := blkChk_join _ _ _ _ _ 1725 3 1 h2 okB1728
  exact h3
end E1.C284X
