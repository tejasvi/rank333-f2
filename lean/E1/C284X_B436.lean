module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4102 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4103 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4103 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4104 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4104 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4105 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4105 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4106 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4106 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4107 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4107 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4108 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4108 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG436 : glueChkR lits W 4102 7 = true := by
  rw [← glueChkRN_eq lits W 7747 4102 lenT]; decide +kernel
theorem okM436 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 1 = true := okB4102
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 2 = true := blkChk_join _ _ _ _ _ 4102 1 1 h0 okB4103
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 3 = true := blkChk_join _ _ _ _ _ 4102 2 1 h1 okB4104
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 4 = true := blkChk_join _ _ _ _ _ 4102 3 1 h2 okB4105
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 5 = true := blkChk_join _ _ _ _ _ 4102 4 1 h3 okB4106
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 6 = true := blkChk_join _ _ _ _ _ 4102 5 1 h4 okB4107
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4102 7 = true := blkChk_join _ _ _ _ _ 4102 6 1 h5 okB4108
  exact h6
end E1.C284X
