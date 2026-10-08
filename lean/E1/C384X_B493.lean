module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5160 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 1 = true := by decide +kernel
theorem okB5161 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5161 1 = true := by decide +kernel
theorem okB5162 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5162 1 = true := by decide +kernel
theorem okB5163 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5163 1 = true := by decide +kernel
theorem okB5164 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5164 1 = true := by decide +kernel
theorem okB5165 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5165 1 = true := by decide +kernel
theorem okB5166 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5166 1 = true := by decide +kernel
theorem okB5167 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5167 1 = true := by decide +kernel
theorem okG493 : glueChkR lits W 5160 8 = true := by decide +kernel
theorem okM493 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 1 = true := okB5160
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 2 = true := blkChk_join _ _ _ _ _ 5160 1 1 h0 okB5161
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 3 = true := blkChk_join _ _ _ _ _ 5160 2 1 h1 okB5162
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 4 = true := blkChk_join _ _ _ _ _ 5160 3 1 h2 okB5163
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 5 = true := blkChk_join _ _ _ _ _ 5160 4 1 h3 okB5164
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 6 = true := blkChk_join _ _ _ _ _ 5160 5 1 h4 okB5165
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 7 = true := blkChk_join _ _ _ _ _ 5160 6 1 h5 okB5166
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5160 8 = true := blkChk_join _ _ _ _ _ 5160 7 1 h6 okB5167
  exact h7
end E1.C384X
