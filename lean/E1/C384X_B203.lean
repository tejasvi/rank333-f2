module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2176 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 1 = true := by decide +kernel
theorem okB2177 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2177 1 = true := by decide +kernel
theorem okB2178 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2178 1 = true := by decide +kernel
theorem okB2179 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2179 1 = true := by decide +kernel
theorem okB2180 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2180 1 = true := by decide +kernel
theorem okB2181 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2181 1 = true := by decide +kernel
theorem okB2182 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2182 1 = true := by decide +kernel
theorem okB2183 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2183 1 = true := by decide +kernel
theorem okB2184 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2184 1 = true := by decide +kernel
theorem okB2185 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2185 1 = true := by decide +kernel
theorem okG203 : glueChkR lits W 2176 10 = true := by decide +kernel
theorem okM203 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 1 = true := okB2176
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 2 = true := blkChk_join _ _ _ _ _ 2176 1 1 h0 okB2177
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 3 = true := blkChk_join _ _ _ _ _ 2176 2 1 h1 okB2178
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 4 = true := blkChk_join _ _ _ _ _ 2176 3 1 h2 okB2179
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 5 = true := blkChk_join _ _ _ _ _ 2176 4 1 h3 okB2180
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 6 = true := blkChk_join _ _ _ _ _ 2176 5 1 h4 okB2181
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 7 = true := blkChk_join _ _ _ _ _ 2176 6 1 h5 okB2182
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 8 = true := blkChk_join _ _ _ _ _ 2176 7 1 h6 okB2183
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 9 = true := blkChk_join _ _ _ _ _ 2176 8 1 h7 okB2184
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2176 10 = true := blkChk_join _ _ _ _ _ 2176 9 1 h8 okB2185
  exact h9
end E1.C384X
