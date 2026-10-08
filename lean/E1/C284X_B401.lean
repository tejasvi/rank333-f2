module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3827 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3827 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3828 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3828 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3829 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3829 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3830 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3830 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3831 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3831 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG401 : glueChkR lits W 3827 5 = true := by
  rw [← glueChkRN_eq lits W 7747 3827 lenT]; decide +kernel
theorem okM401 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3827 5 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3827 1 = true := okB3827
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3827 2 = true := blkChk_join _ _ _ _ _ 3827 1 1 h0 okB3828
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3827 3 = true := blkChk_join _ _ _ _ _ 3827 2 1 h1 okB3829
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3827 4 = true := blkChk_join _ _ _ _ _ 3827 3 1 h2 okB3830
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3827 5 = true := blkChk_join _ _ _ _ _ 3827 4 1 h3 okB3831
  exact h4
end E1.C284X
