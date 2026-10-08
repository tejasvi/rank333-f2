module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1050 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1050 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1051 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1051 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1052 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1052 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1053 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1053 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG113 : glueChkR lits W 1050 4 = true := by
  rw [← glueChkRN_eq lits W 7747 1050 lenT]; decide +kernel
theorem okM113 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1050 4 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1050 1 = true := okB1050
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1050 2 = true := blkChk_join _ _ _ _ _ 1050 1 1 h0 okB1051
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1050 3 = true := blkChk_join _ _ _ _ _ 1050 2 1 h1 okB1052
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1050 4 = true := blkChk_join _ _ _ _ _ 1050 3 1 h2 okB1053
  exact h3
end E1.C284X
