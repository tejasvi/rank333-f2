module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1078 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1079 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1080 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1081 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1082 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1082 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1083 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1083 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1084 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1084 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1085 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1085 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG117 : glueChkR lits W 1078 8 = true := by
  rw [← glueChkRN_eq lits W 7747 1078 lenT]; decide +kernel
theorem okM117 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 1 = true := okB1078
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 2 = true := blkChk_join _ _ _ _ _ 1078 1 1 h0 okB1079
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 3 = true := blkChk_join _ _ _ _ _ 1078 2 1 h1 okB1080
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 4 = true := blkChk_join _ _ _ _ _ 1078 3 1 h2 okB1081
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 5 = true := blkChk_join _ _ _ _ _ 1078 4 1 h3 okB1082
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 6 = true := blkChk_join _ _ _ _ _ 1078 5 1 h4 okB1083
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 7 = true := blkChk_join _ _ _ _ _ 1078 6 1 h5 okB1084
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1078 8 = true := blkChk_join _ _ _ _ _ 1078 7 1 h6 okB1085
  exact h7
end E1.C284X
