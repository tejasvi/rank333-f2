module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3140 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3141 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3141 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3142 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3142 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3143 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3144 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3145 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3146 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3146 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3147 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3147 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3148 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3148 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3149 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3149 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3150 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3150 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG336 : glueChkR lits W 3140 11 = true := by
  rw [← glueChkRN_eq lits W 7747 3140 lenT]; decide +kernel
theorem okM336 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 1 = true := okB3140
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 2 = true := blkChk_join _ _ _ _ _ 3140 1 1 h0 okB3141
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 3 = true := blkChk_join _ _ _ _ _ 3140 2 1 h1 okB3142
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 4 = true := blkChk_join _ _ _ _ _ 3140 3 1 h2 okB3143
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 5 = true := blkChk_join _ _ _ _ _ 3140 4 1 h3 okB3144
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 6 = true := blkChk_join _ _ _ _ _ 3140 5 1 h4 okB3145
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 7 = true := blkChk_join _ _ _ _ _ 3140 6 1 h5 okB3146
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 8 = true := blkChk_join _ _ _ _ _ 3140 7 1 h6 okB3147
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 9 = true := blkChk_join _ _ _ _ _ 3140 8 1 h7 okB3148
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 10 = true := blkChk_join _ _ _ _ _ 3140 9 1 h8 okB3149
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3140 11 = true := blkChk_join _ _ _ _ _ 3140 10 1 h9 okB3150
  exact h10
end E1.C284X
