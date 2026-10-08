module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5068 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5069 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5070 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5071 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG538 : glueChkR lits W 5068 4 = true := by
  rw [← glueChkRN_eq lits W 7747 5068 lenT]; decide +kernel
theorem okM538 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5068 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5068 1 = true := okB5068
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5068 2 = true := blkChk_join _ _ _ _ _ 5068 1 1 h0 okB5069
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5068 3 = true := blkChk_join _ _ _ _ _ 5068 2 1 h1 okB5070
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5068 4 = true := blkChk_join _ _ _ _ _ 5068 3 1 h2 okB5071
  exact h3
end E1.C284X
