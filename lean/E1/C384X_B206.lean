module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2210 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 1 = true := by decide +kernel
theorem okB2211 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2211 1 = true := by decide +kernel
theorem okB2212 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2212 1 = true := by decide +kernel
theorem okB2213 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2213 1 = true := by decide +kernel
theorem okB2214 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2214 1 = true := by decide +kernel
theorem okB2215 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2215 1 = true := by decide +kernel
theorem okB2216 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2216 1 = true := by decide +kernel
theorem okB2217 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2217 1 = true := by decide +kernel
theorem okB2218 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2218 1 = true := by decide +kernel
theorem okB2219 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2219 1 = true := by decide +kernel
theorem okB2220 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2220 1 = true := by decide +kernel
theorem okG206 : glueChkR lits W 2210 11 = true := by decide +kernel
theorem okM206 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 1 = true := okB2210
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 2 = true := blkChk_join _ _ _ _ _ 2210 1 1 h0 okB2211
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 3 = true := blkChk_join _ _ _ _ _ 2210 2 1 h1 okB2212
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 4 = true := blkChk_join _ _ _ _ _ 2210 3 1 h2 okB2213
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 5 = true := blkChk_join _ _ _ _ _ 2210 4 1 h3 okB2214
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 6 = true := blkChk_join _ _ _ _ _ 2210 5 1 h4 okB2215
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 7 = true := blkChk_join _ _ _ _ _ 2210 6 1 h5 okB2216
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 8 = true := blkChk_join _ _ _ _ _ 2210 7 1 h6 okB2217
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 9 = true := blkChk_join _ _ _ _ _ 2210 8 1 h7 okB2218
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 10 = true := blkChk_join _ _ _ _ _ 2210 9 1 h8 okB2219
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2210 11 = true := blkChk_join _ _ _ _ _ 2210 10 1 h9 okB2220
  exact h10
end E1.C384X
