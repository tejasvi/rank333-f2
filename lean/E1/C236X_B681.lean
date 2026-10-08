module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7215 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7216 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7216 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7217 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7217 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7218 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7218 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7219 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7219 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7220 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7220 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7221 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7221 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7222 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7222 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7223 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7224 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG681 : glueChkR lits W 7215 10 = true := by
  rw [← glueChkRN_eq lits W 8596 7215 lenT]; decide +kernel
theorem okM681 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 1 = true := okB7215
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 2 = true := blkChk_join _ _ _ _ _ 7215 1 1 h0 okB7216
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 3 = true := blkChk_join _ _ _ _ _ 7215 2 1 h1 okB7217
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 4 = true := blkChk_join _ _ _ _ _ 7215 3 1 h2 okB7218
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 5 = true := blkChk_join _ _ _ _ _ 7215 4 1 h3 okB7219
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 6 = true := blkChk_join _ _ _ _ _ 7215 5 1 h4 okB7220
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 7 = true := blkChk_join _ _ _ _ _ 7215 6 1 h5 okB7221
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 8 = true := blkChk_join _ _ _ _ _ 7215 7 1 h6 okB7222
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 9 = true := blkChk_join _ _ _ _ _ 7215 8 1 h7 okB7223
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7215 10 = true := blkChk_join _ _ _ _ _ 7215 9 1 h8 okB7224
  exact h9
end E1.C236X
