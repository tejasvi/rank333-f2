module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1063 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1064 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1065 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1066 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1067 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1068 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1069 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG115 : glueChkR lits W 1063 7 = true := by
  rw [← glueChkRN_eq lits W 7747 1063 lenT]; decide +kernel
theorem okM115 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 1 = true := okB1063
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 2 = true := blkChk_join _ _ _ _ _ 1063 1 1 h0 okB1064
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 3 = true := blkChk_join _ _ _ _ _ 1063 2 1 h1 okB1065
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 4 = true := blkChk_join _ _ _ _ _ 1063 3 1 h2 okB1066
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 5 = true := blkChk_join _ _ _ _ _ 1063 4 1 h3 okB1067
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 6 = true := blkChk_join _ _ _ _ _ 1063 5 1 h4 okB1068
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1063 7 = true := blkChk_join _ _ _ _ _ 1063 6 1 h5 okB1069
  exact h6
end E1.C284X
