module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4142 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4143 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4144 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4145 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4146 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4146 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4147 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4147 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4148 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4148 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4149 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4149 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG440 : glueChkR lits W 4142 8 = true := by
  rw [← glueChkRN_eq lits W 7747 4142 lenT]; decide +kernel
theorem okM440 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 1 = true := okB4142
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 2 = true := blkChk_join _ _ _ _ _ 4142 1 1 h0 okB4143
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 3 = true := blkChk_join _ _ _ _ _ 4142 2 1 h1 okB4144
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 4 = true := blkChk_join _ _ _ _ _ 4142 3 1 h2 okB4145
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 5 = true := blkChk_join _ _ _ _ _ 4142 4 1 h3 okB4146
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 6 = true := blkChk_join _ _ _ _ _ 4142 5 1 h4 okB4147
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 7 = true := blkChk_join _ _ _ _ _ 4142 6 1 h5 okB4148
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4142 8 = true := blkChk_join _ _ _ _ _ 4142 7 1 h6 okB4149
  exact h7
end E1.C284X
