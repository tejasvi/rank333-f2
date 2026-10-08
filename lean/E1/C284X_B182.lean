module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1675 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1675 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1676 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1676 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1677 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1677 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1678 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1678 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG182 : glueChkR lits W 1675 4 = true := by
  rw [← glueChkRN_eq lits W 7747 1675 lenT]; decide +kernel
theorem okM182 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1675 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1675 1 = true := okB1675
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1675 2 = true := blkChk_join _ _ _ _ _ 1675 1 1 h0 okB1676
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1675 3 = true := blkChk_join _ _ _ _ _ 1675 2 1 h1 okB1677
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1675 4 = true := blkChk_join _ _ _ _ _ 1675 3 1 h2 okB1678
  exact h3
end E1.C284X
