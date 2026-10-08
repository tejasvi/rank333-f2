module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5210 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5211 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5211 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5212 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5212 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5213 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5213 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5214 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5214 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5215 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5216 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5217 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5218 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5219 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG508 : glueChkR lits W 5210 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5210 lenT]; decide +kernel
theorem okM508 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 1 = true := okB5210
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 2 = true := blkChk_join _ _ _ _ _ 5210 1 1 h0 okB5211
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 3 = true := blkChk_join _ _ _ _ _ 5210 2 1 h1 okB5212
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 4 = true := blkChk_join _ _ _ _ _ 5210 3 1 h2 okB5213
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 5 = true := blkChk_join _ _ _ _ _ 5210 4 1 h3 okB5214
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 6 = true := blkChk_join _ _ _ _ _ 5210 5 1 h4 okB5215
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 7 = true := blkChk_join _ _ _ _ _ 5210 6 1 h5 okB5216
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 8 = true := blkChk_join _ _ _ _ _ 5210 7 1 h6 okB5217
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 9 = true := blkChk_join _ _ _ _ _ 5210 8 1 h7 okB5218
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5210 10 = true := blkChk_join _ _ _ _ _ 5210 9 1 h8 okB5219
  exact h9
end E1.C236X
