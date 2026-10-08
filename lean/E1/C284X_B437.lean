module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4109 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4110 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4110 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4111 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4111 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4112 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4112 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4113 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4113 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4114 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4114 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4115 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4115 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4116 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4116 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4117 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4117 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4118 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4118 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4119 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4119 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG437 : glueChkR lits W 4109 11 = true := by
  rw [← glueChkRN_eq lits W 7747 4109 lenT]; decide +kernel
theorem okM437 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 1 = true := okB4109
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 2 = true := blkChk_join _ _ _ _ _ 4109 1 1 h0 okB4110
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 3 = true := blkChk_join _ _ _ _ _ 4109 2 1 h1 okB4111
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 4 = true := blkChk_join _ _ _ _ _ 4109 3 1 h2 okB4112
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 5 = true := blkChk_join _ _ _ _ _ 4109 4 1 h3 okB4113
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 6 = true := blkChk_join _ _ _ _ _ 4109 5 1 h4 okB4114
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 7 = true := blkChk_join _ _ _ _ _ 4109 6 1 h5 okB4115
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 8 = true := blkChk_join _ _ _ _ _ 4109 7 1 h6 okB4116
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 9 = true := blkChk_join _ _ _ _ _ 4109 8 1 h7 okB4117
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 10 = true := blkChk_join _ _ _ _ _ 4109 9 1 h8 okB4118
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4109 11 = true := blkChk_join _ _ _ _ _ 4109 10 1 h9 okB4119
  exact h10
end E1.C284X
