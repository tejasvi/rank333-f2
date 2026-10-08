module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5177 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 1 = true := by decide +kernel
theorem okB5178 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5178 1 = true := by decide +kernel
theorem okB5179 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5179 1 = true := by decide +kernel
theorem okB5180 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5180 1 = true := by decide +kernel
theorem okB5181 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5181 1 = true := by decide +kernel
theorem okB5182 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5182 1 = true := by decide +kernel
theorem okB5183 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5183 1 = true := by decide +kernel
theorem okB5184 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5184 1 = true := by decide +kernel
theorem okB5185 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5185 1 = true := by decide +kernel
theorem okB5186 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5186 1 = true := by decide +kernel
theorem okB5187 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5187 1 = true := by decide +kernel
theorem okB5188 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5188 1 = true := by decide +kernel
theorem okG495 : glueChkR lits W 5177 12 = true := by decide +kernel
theorem okM495 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 1 = true := okB5177
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 2 = true := blkChk_join _ _ _ _ _ 5177 1 1 h0 okB5178
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 3 = true := blkChk_join _ _ _ _ _ 5177 2 1 h1 okB5179
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 4 = true := blkChk_join _ _ _ _ _ 5177 3 1 h2 okB5180
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 5 = true := blkChk_join _ _ _ _ _ 5177 4 1 h3 okB5181
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 6 = true := blkChk_join _ _ _ _ _ 5177 5 1 h4 okB5182
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 7 = true := blkChk_join _ _ _ _ _ 5177 6 1 h5 okB5183
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 8 = true := blkChk_join _ _ _ _ _ 5177 7 1 h6 okB5184
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 9 = true := blkChk_join _ _ _ _ _ 5177 8 1 h7 okB5185
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 10 = true := blkChk_join _ _ _ _ _ 5177 9 1 h8 okB5186
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 11 = true := blkChk_join _ _ _ _ _ 5177 10 1 h9 okB5187
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5177 12 = true := blkChk_join _ _ _ _ _ 5177 11 1 h10 okB5188
  exact h11
end E1.C384X
