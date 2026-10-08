module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4236 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4237 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4237 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4238 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4238 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4239 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4239 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4240 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4240 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4241 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4241 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4242 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4242 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4243 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4243 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4244 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4244 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG451 : glueChkR lits W 4236 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4236 lenT]; decide +kernel
theorem okM451 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 1 = true := okB4236
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 2 = true := blkChk_join _ _ _ _ _ 4236 1 1 h0 okB4237
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 3 = true := blkChk_join _ _ _ _ _ 4236 2 1 h1 okB4238
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 4 = true := blkChk_join _ _ _ _ _ 4236 3 1 h2 okB4239
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 5 = true := blkChk_join _ _ _ _ _ 4236 4 1 h3 okB4240
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 6 = true := blkChk_join _ _ _ _ _ 4236 5 1 h4 okB4241
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 7 = true := blkChk_join _ _ _ _ _ 4236 6 1 h5 okB4242
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 8 = true := blkChk_join _ _ _ _ _ 4236 7 1 h6 okB4243
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4236 9 = true := blkChk_join _ _ _ _ _ 4236 8 1 h7 okB4244
  exact h8
end E1.C284X
