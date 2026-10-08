module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB234 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 1 = true := by decide +kernel
theorem okB235 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 235 1 = true := by decide +kernel
theorem okB236 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 236 1 = true := by decide +kernel
theorem okB237 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 237 1 = true := by decide +kernel
theorem okB238 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 238 1 = true := by decide +kernel
theorem okB239 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 239 1 = true := by decide +kernel
theorem okB240 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 240 1 = true := by decide +kernel
theorem okB241 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 241 1 = true := by decide +kernel
theorem okB242 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 242 1 = true := by decide +kernel
theorem okB243 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 243 1 = true := by decide +kernel
theorem okB244 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 244 1 = true := by decide +kernel
theorem okB245 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 245 1 = true := by decide +kernel
theorem okB246 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 246 1 = true := by decide +kernel
theorem okG23 : glueChkR lits W 234 13 = true := by decide +kernel
theorem okM23 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 13 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 1 = true := okB234
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 2 = true := blkChk_join _ _ _ _ _ 234 1 1 h0 okB235
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 3 = true := blkChk_join _ _ _ _ _ 234 2 1 h1 okB236
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 4 = true := blkChk_join _ _ _ _ _ 234 3 1 h2 okB237
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 5 = true := blkChk_join _ _ _ _ _ 234 4 1 h3 okB238
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 6 = true := blkChk_join _ _ _ _ _ 234 5 1 h4 okB239
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 7 = true := blkChk_join _ _ _ _ _ 234 6 1 h5 okB240
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 8 = true := blkChk_join _ _ _ _ _ 234 7 1 h6 okB241
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 9 = true := blkChk_join _ _ _ _ _ 234 8 1 h7 okB242
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 10 = true := blkChk_join _ _ _ _ _ 234 9 1 h8 okB243
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 11 = true := blkChk_join _ _ _ _ _ 234 10 1 h9 okB244
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 12 = true := blkChk_join _ _ _ _ _ 234 11 1 h10 okB245
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 234 13 = true := blkChk_join _ _ _ _ _ 234 12 1 h11 okB246
  exact h12
end E1.C384X
