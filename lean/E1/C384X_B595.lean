module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6175 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 1 = true := by decide +kernel
theorem okB6176 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6176 1 = true := by decide +kernel
theorem okB6177 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6177 1 = true := by decide +kernel
theorem okB6178 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6178 1 = true := by decide +kernel
theorem okB6179 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6179 1 = true := by decide +kernel
theorem okB6180 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6180 1 = true := by decide +kernel
theorem okB6181 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6181 1 = true := by decide +kernel
theorem okB6182 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6182 1 = true := by decide +kernel
theorem okG595 : glueChkR lits W 6175 8 = true := by decide +kernel
theorem okM595 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 1 = true := okB6175
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 2 = true := blkChk_join _ _ _ _ _ 6175 1 1 h0 okB6176
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 3 = true := blkChk_join _ _ _ _ _ 6175 2 1 h1 okB6177
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 4 = true := blkChk_join _ _ _ _ _ 6175 3 1 h2 okB6178
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 5 = true := blkChk_join _ _ _ _ _ 6175 4 1 h3 okB6179
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 6 = true := blkChk_join _ _ _ _ _ 6175 5 1 h4 okB6180
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 7 = true := blkChk_join _ _ _ _ _ 6175 6 1 h5 okB6181
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6175 8 = true := blkChk_join _ _ _ _ _ 6175 7 1 h6 okB6182
  exact h7
end E1.C384X
