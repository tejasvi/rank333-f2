module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4187 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 1 = true := by decide +kernel
theorem okB4188 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4188 1 = true := by decide +kernel
theorem okB4189 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4189 1 = true := by decide +kernel
theorem okB4190 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4190 1 = true := by decide +kernel
theorem okB4191 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4191 1 = true := by decide +kernel
theorem okB4192 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4192 1 = true := by decide +kernel
theorem okB4193 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4193 1 = true := by decide +kernel
theorem okB4194 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4194 1 = true := by decide +kernel
theorem okB4195 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4195 1 = true := by decide +kernel
theorem okB4196 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4196 1 = true := by decide +kernel
theorem okB4197 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4197 1 = true := by decide +kernel
theorem okB4198 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4198 1 = true := by decide +kernel
theorem okG400 : glueChkR lits W 4187 12 = true := by decide +kernel
theorem okM400 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 1 = true := okB4187
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 2 = true := blkChk_join _ _ _ _ _ 4187 1 1 h0 okB4188
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 3 = true := blkChk_join _ _ _ _ _ 4187 2 1 h1 okB4189
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 4 = true := blkChk_join _ _ _ _ _ 4187 3 1 h2 okB4190
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 5 = true := blkChk_join _ _ _ _ _ 4187 4 1 h3 okB4191
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 6 = true := blkChk_join _ _ _ _ _ 4187 5 1 h4 okB4192
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 7 = true := blkChk_join _ _ _ _ _ 4187 6 1 h5 okB4193
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 8 = true := blkChk_join _ _ _ _ _ 4187 7 1 h6 okB4194
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 9 = true := blkChk_join _ _ _ _ _ 4187 8 1 h7 okB4195
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 10 = true := blkChk_join _ _ _ _ _ 4187 9 1 h8 okB4196
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 11 = true := blkChk_join _ _ _ _ _ 4187 10 1 h9 okB4197
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4187 12 = true := blkChk_join _ _ _ _ _ 4187 11 1 h10 okB4198
  exact h11
end E1.C384X
