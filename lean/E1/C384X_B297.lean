module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3127 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 1 = true := by decide +kernel
theorem okB3128 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3128 1 = true := by decide +kernel
theorem okB3129 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3129 1 = true := by decide +kernel
theorem okB3130 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3130 1 = true := by decide +kernel
theorem okB3131 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3131 1 = true := by decide +kernel
theorem okB3132 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3132 1 = true := by decide +kernel
theorem okB3133 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3133 1 = true := by decide +kernel
theorem okB3134 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3134 1 = true := by decide +kernel
theorem okB3135 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3135 1 = true := by decide +kernel
theorem okB3136 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3136 1 = true := by decide +kernel
theorem okB3137 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3137 1 = true := by decide +kernel
theorem okB3138 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3138 1 = true := by decide +kernel
theorem okG297 : glueChkR lits W 3127 12 = true := by decide +kernel
theorem okM297 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 1 = true := okB3127
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 2 = true := blkChk_join _ _ _ _ _ 3127 1 1 h0 okB3128
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 3 = true := blkChk_join _ _ _ _ _ 3127 2 1 h1 okB3129
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 4 = true := blkChk_join _ _ _ _ _ 3127 3 1 h2 okB3130
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 5 = true := blkChk_join _ _ _ _ _ 3127 4 1 h3 okB3131
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 6 = true := blkChk_join _ _ _ _ _ 3127 5 1 h4 okB3132
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 7 = true := blkChk_join _ _ _ _ _ 3127 6 1 h5 okB3133
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 8 = true := blkChk_join _ _ _ _ _ 3127 7 1 h6 okB3134
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 9 = true := blkChk_join _ _ _ _ _ 3127 8 1 h7 okB3135
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 10 = true := blkChk_join _ _ _ _ _ 3127 9 1 h8 okB3136
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 11 = true := blkChk_join _ _ _ _ _ 3127 10 1 h9 okB3137
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3127 12 = true := blkChk_join _ _ _ _ _ 3127 11 1 h10 okB3138
  exact h11
end E1.C384X
