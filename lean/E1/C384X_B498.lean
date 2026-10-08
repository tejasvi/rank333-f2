module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5207 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 1 = true := by decide +kernel
theorem okB5208 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5208 1 = true := by decide +kernel
theorem okB5209 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5209 1 = true := by decide +kernel
theorem okB5210 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5210 1 = true := by decide +kernel
theorem okB5211 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5211 1 = true := by decide +kernel
theorem okB5212 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5212 1 = true := by decide +kernel
theorem okB5213 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5213 1 = true := by decide +kernel
theorem okB5214 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5214 1 = true := by decide +kernel
theorem okB5215 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5215 1 = true := by decide +kernel
theorem okB5216 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5216 1 = true := by decide +kernel
theorem okG498 : glueChkR lits W 5207 10 = true := by decide +kernel
theorem okM498 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 1 = true := okB5207
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 2 = true := blkChk_join _ _ _ _ _ 5207 1 1 h0 okB5208
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 3 = true := blkChk_join _ _ _ _ _ 5207 2 1 h1 okB5209
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 4 = true := blkChk_join _ _ _ _ _ 5207 3 1 h2 okB5210
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 5 = true := blkChk_join _ _ _ _ _ 5207 4 1 h3 okB5211
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 6 = true := blkChk_join _ _ _ _ _ 5207 5 1 h4 okB5212
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 7 = true := blkChk_join _ _ _ _ _ 5207 6 1 h5 okB5213
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 8 = true := blkChk_join _ _ _ _ _ 5207 7 1 h6 okB5214
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 9 = true := blkChk_join _ _ _ _ _ 5207 8 1 h7 okB5215
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5207 10 = true := blkChk_join _ _ _ _ _ 5207 9 1 h8 okB5216
  exact h9
end E1.C384X
