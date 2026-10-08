module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB213 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 1 = true := by decide +kernel
theorem okB214 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 214 1 = true := by decide +kernel
theorem okB215 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 215 1 = true := by decide +kernel
theorem okB216 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 216 1 = true := by decide +kernel
theorem okB217 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 217 1 = true := by decide +kernel
theorem okB218 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 218 1 = true := by decide +kernel
theorem okB219 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 219 1 = true := by decide +kernel
theorem okB220 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 220 1 = true := by decide +kernel
theorem okB221 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 221 1 = true := by decide +kernel
theorem okG21 : glueChkR lits W 213 9 = true := by decide +kernel
theorem okM21 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 1 = true := okB213
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 2 = true := blkChk_join _ _ _ _ _ 213 1 1 h0 okB214
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 3 = true := blkChk_join _ _ _ _ _ 213 2 1 h1 okB215
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 4 = true := blkChk_join _ _ _ _ _ 213 3 1 h2 okB216
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 5 = true := blkChk_join _ _ _ _ _ 213 4 1 h3 okB217
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 6 = true := blkChk_join _ _ _ _ _ 213 5 1 h4 okB218
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 7 = true := blkChk_join _ _ _ _ _ 213 6 1 h5 okB219
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 8 = true := blkChk_join _ _ _ _ _ 213 7 1 h6 okB220
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 213 9 = true := blkChk_join _ _ _ _ _ 213 8 1 h7 okB221
  exact h8
end E1.C384X
