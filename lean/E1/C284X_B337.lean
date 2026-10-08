module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3151 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3152 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3152 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3153 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3153 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3154 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3154 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3155 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3155 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3156 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3156 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3157 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3157 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3158 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3158 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG337 : glueChkR lits W 3151 8 = true := by
  rw [← glueChkRN_eq lits W 7747 3151 lenT]; decide +kernel
theorem okM337 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 1 = true := okB3151
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 2 = true := blkChk_join _ _ _ _ _ 3151 1 1 h0 okB3152
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 3 = true := blkChk_join _ _ _ _ _ 3151 2 1 h1 okB3153
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 4 = true := blkChk_join _ _ _ _ _ 3151 3 1 h2 okB3154
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 5 = true := blkChk_join _ _ _ _ _ 3151 4 1 h3 okB3155
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 6 = true := blkChk_join _ _ _ _ _ 3151 5 1 h4 okB3156
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 7 = true := blkChk_join _ _ _ _ _ 3151 6 1 h5 okB3157
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3151 8 = true := blkChk_join _ _ _ _ _ 3151 7 1 h6 okB3158
  exact h7
end E1.C284X
