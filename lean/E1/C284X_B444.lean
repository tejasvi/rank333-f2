module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4182 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4183 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4183 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4184 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4184 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4185 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4185 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4186 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4186 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4187 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4187 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4188 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4188 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4189 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4189 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4190 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4190 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG444 : glueChkR lits W 4182 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4182 lenT]; decide +kernel
theorem okM444 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 1 = true := okB4182
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 2 = true := blkChk_join _ _ _ _ _ 4182 1 1 h0 okB4183
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 3 = true := blkChk_join _ _ _ _ _ 4182 2 1 h1 okB4184
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 4 = true := blkChk_join _ _ _ _ _ 4182 3 1 h2 okB4185
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 5 = true := blkChk_join _ _ _ _ _ 4182 4 1 h3 okB4186
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 6 = true := blkChk_join _ _ _ _ _ 4182 5 1 h4 okB4187
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 7 = true := blkChk_join _ _ _ _ _ 4182 6 1 h5 okB4188
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 8 = true := blkChk_join _ _ _ _ _ 4182 7 1 h6 okB4189
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4182 9 = true := blkChk_join _ _ _ _ _ 4182 8 1 h7 okB4190
  exact h8
end E1.C284X
