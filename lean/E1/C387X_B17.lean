module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB187 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 1 = true := by decide +kernel
theorem okB188 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 188 1 = true := by decide +kernel
theorem okB189 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 189 1 = true := by decide +kernel
theorem okB190 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 190 1 = true := by decide +kernel
theorem okB191 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 191 1 = true := by decide +kernel
theorem okB192 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 192 1 = true := by decide +kernel
theorem okB193 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 193 1 = true := by decide +kernel
theorem okB194 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 194 1 = true := by decide +kernel
theorem okB195 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 195 1 = true := by decide +kernel
theorem okB196 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 196 1 = true := by decide +kernel
theorem okG17 : glueChkR lits W 187 10 = true := by decide +kernel
theorem okM17 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 1 = true := okB187
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 2 = true := blkChk_join _ _ _ _ _ 187 1 1 h0 okB188
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 3 = true := blkChk_join _ _ _ _ _ 187 2 1 h1 okB189
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 4 = true := blkChk_join _ _ _ _ _ 187 3 1 h2 okB190
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 5 = true := blkChk_join _ _ _ _ _ 187 4 1 h3 okB191
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 6 = true := blkChk_join _ _ _ _ _ 187 5 1 h4 okB192
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 7 = true := blkChk_join _ _ _ _ _ 187 6 1 h5 okB193
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 8 = true := blkChk_join _ _ _ _ _ 187 7 1 h6 okB194
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 9 = true := blkChk_join _ _ _ _ _ 187 8 1 h7 okB195
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 187 10 = true := blkChk_join _ _ _ _ _ 187 9 1 h8 okB196
  exact h9
end E1.C387X
