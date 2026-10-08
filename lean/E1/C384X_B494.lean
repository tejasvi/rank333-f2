module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5168 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 1 = true := by decide +kernel
theorem okB5169 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5169 1 = true := by decide +kernel
theorem okB5170 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5170 1 = true := by decide +kernel
theorem okB5171 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5171 1 = true := by decide +kernel
theorem okB5172 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5172 1 = true := by decide +kernel
theorem okB5173 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5173 1 = true := by decide +kernel
theorem okB5174 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5174 1 = true := by decide +kernel
theorem okB5175 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5175 1 = true := by decide +kernel
theorem okB5176 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5176 1 = true := by decide +kernel
theorem okG494 : glueChkR lits W 5168 9 = true := by decide +kernel
theorem okM494 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 1 = true := okB5168
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 2 = true := blkChk_join _ _ _ _ _ 5168 1 1 h0 okB5169
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 3 = true := blkChk_join _ _ _ _ _ 5168 2 1 h1 okB5170
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 4 = true := blkChk_join _ _ _ _ _ 5168 3 1 h2 okB5171
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 5 = true := blkChk_join _ _ _ _ _ 5168 4 1 h3 okB5172
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 6 = true := blkChk_join _ _ _ _ _ 5168 5 1 h4 okB5173
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 7 = true := blkChk_join _ _ _ _ _ 5168 6 1 h5 okB5174
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 8 = true := blkChk_join _ _ _ _ _ 5168 7 1 h6 okB5175
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5168 9 = true := blkChk_join _ _ _ _ _ 5168 8 1 h7 okB5176
  exact h8
end E1.C384X
