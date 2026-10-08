module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3187 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 1 = true := by decide +kernel
theorem okB3188 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3188 1 = true := by decide +kernel
theorem okB3189 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3189 1 = true := by decide +kernel
theorem okB3190 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3190 1 = true := by decide +kernel
theorem okB3191 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3191 1 = true := by decide +kernel
theorem okB3192 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3192 1 = true := by decide +kernel
theorem okB3193 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3193 1 = true := by decide +kernel
theorem okB3194 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3194 1 = true := by decide +kernel
theorem okB3195 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3195 1 = true := by decide +kernel
theorem okG303 : glueChkR lits W 3187 9 = true := by decide +kernel
theorem okM303 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 1 = true := okB3187
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 2 = true := blkChk_join _ _ _ _ _ 3187 1 1 h0 okB3188
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 3 = true := blkChk_join _ _ _ _ _ 3187 2 1 h1 okB3189
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 4 = true := blkChk_join _ _ _ _ _ 3187 3 1 h2 okB3190
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 5 = true := blkChk_join _ _ _ _ _ 3187 4 1 h3 okB3191
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 6 = true := blkChk_join _ _ _ _ _ 3187 5 1 h4 okB3192
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 7 = true := blkChk_join _ _ _ _ _ 3187 6 1 h5 okB3193
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 8 = true := blkChk_join _ _ _ _ _ 3187 7 1 h6 okB3194
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3187 9 = true := blkChk_join _ _ _ _ _ 3187 8 1 h7 okB3195
  exact h8
end E1.C384X
