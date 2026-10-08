module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4167 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 1 = true := by decide +kernel
theorem okB4168 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4168 1 = true := by decide +kernel
theorem okB4169 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4169 1 = true := by decide +kernel
theorem okB4170 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4170 1 = true := by decide +kernel
theorem okB4171 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4171 1 = true := by decide +kernel
theorem okB4172 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4172 1 = true := by decide +kernel
theorem okB4173 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4173 1 = true := by decide +kernel
theorem okB4174 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4174 1 = true := by decide +kernel
theorem okB4175 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4175 1 = true := by decide +kernel
theorem okG398 : glueChkR lits W 4167 9 = true := by decide +kernel
theorem okM398 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 1 = true := okB4167
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 2 = true := blkChk_join _ _ _ _ _ 4167 1 1 h0 okB4168
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 3 = true := blkChk_join _ _ _ _ _ 4167 2 1 h1 okB4169
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 4 = true := blkChk_join _ _ _ _ _ 4167 3 1 h2 okB4170
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 5 = true := blkChk_join _ _ _ _ _ 4167 4 1 h3 okB4171
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 6 = true := blkChk_join _ _ _ _ _ 4167 5 1 h4 okB4172
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 7 = true := blkChk_join _ _ _ _ _ 4167 6 1 h5 okB4173
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 8 = true := blkChk_join _ _ _ _ _ 4167 7 1 h6 okB4174
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4167 9 = true := blkChk_join _ _ _ _ _ 4167 8 1 h7 okB4175
  exact h8
end E1.C384X
