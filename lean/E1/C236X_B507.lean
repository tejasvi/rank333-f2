module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5200 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5201 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5201 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5202 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5202 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5203 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5203 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5204 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5204 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5205 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5205 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5206 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5206 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5207 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5207 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5208 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5208 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5209 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5209 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG507 : glueChkR lits W 5200 10 = true := by
  rw [← glueChkRN_eq lits W 8596 5200 lenT]; decide +kernel
theorem okM507 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 1 = true := okB5200
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 2 = true := blkChk_join _ _ _ _ _ 5200 1 1 h0 okB5201
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 3 = true := blkChk_join _ _ _ _ _ 5200 2 1 h1 okB5202
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 4 = true := blkChk_join _ _ _ _ _ 5200 3 1 h2 okB5203
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 5 = true := blkChk_join _ _ _ _ _ 5200 4 1 h3 okB5204
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 6 = true := blkChk_join _ _ _ _ _ 5200 5 1 h4 okB5205
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 7 = true := blkChk_join _ _ _ _ _ 5200 6 1 h5 okB5206
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 8 = true := blkChk_join _ _ _ _ _ 5200 7 1 h6 okB5207
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 9 = true := blkChk_join _ _ _ _ _ 5200 8 1 h7 okB5208
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5200 10 = true := blkChk_join _ _ _ _ _ 5200 9 1 h8 okB5209
  exact h9
end E1.C236X
