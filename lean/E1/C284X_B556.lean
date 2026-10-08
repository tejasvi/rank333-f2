module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5221 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5222 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5223 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5224 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5225 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5225 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5226 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5226 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5227 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5227 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5228 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5228 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5229 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5229 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5230 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5230 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5231 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5231 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG556 : glueChkR lits W 5221 11 = true := by
  rw [← glueChkRN_eq lits W 7747 5221 lenT]; decide +kernel
theorem okM556 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 1 = true := okB5221
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 2 = true := blkChk_join _ _ _ _ _ 5221 1 1 h0 okB5222
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 3 = true := blkChk_join _ _ _ _ _ 5221 2 1 h1 okB5223
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 4 = true := blkChk_join _ _ _ _ _ 5221 3 1 h2 okB5224
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 5 = true := blkChk_join _ _ _ _ _ 5221 4 1 h3 okB5225
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 6 = true := blkChk_join _ _ _ _ _ 5221 5 1 h4 okB5226
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 7 = true := blkChk_join _ _ _ _ _ 5221 6 1 h5 okB5227
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 8 = true := blkChk_join _ _ _ _ _ 5221 7 1 h6 okB5228
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 9 = true := blkChk_join _ _ _ _ _ 5221 8 1 h7 okB5229
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 10 = true := blkChk_join _ _ _ _ _ 5221 9 1 h8 okB5230
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5221 11 = true := blkChk_join _ _ _ _ _ 5221 10 1 h9 okB5231
  exact h10
end E1.C284X
