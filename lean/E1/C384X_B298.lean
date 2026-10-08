module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3139 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 1 = true := by decide +kernel
theorem okB3140 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3140 1 = true := by decide +kernel
theorem okB3141 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3141 1 = true := by decide +kernel
theorem okB3142 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3142 1 = true := by decide +kernel
theorem okB3143 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3143 1 = true := by decide +kernel
theorem okB3144 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3144 1 = true := by decide +kernel
theorem okB3145 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3145 1 = true := by decide +kernel
theorem okB3146 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3146 1 = true := by decide +kernel
theorem okB3147 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3147 1 = true := by decide +kernel
theorem okB3148 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3148 1 = true := by decide +kernel
theorem okG298 : glueChkR lits W 3139 10 = true := by decide +kernel
theorem okM298 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 1 = true := okB3139
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 2 = true := blkChk_join _ _ _ _ _ 3139 1 1 h0 okB3140
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 3 = true := blkChk_join _ _ _ _ _ 3139 2 1 h1 okB3141
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 4 = true := blkChk_join _ _ _ _ _ 3139 3 1 h2 okB3142
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 5 = true := blkChk_join _ _ _ _ _ 3139 4 1 h3 okB3143
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 6 = true := blkChk_join _ _ _ _ _ 3139 5 1 h4 okB3144
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 7 = true := blkChk_join _ _ _ _ _ 3139 6 1 h5 okB3145
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 8 = true := blkChk_join _ _ _ _ _ 3139 7 1 h6 okB3146
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 9 = true := blkChk_join _ _ _ _ _ 3139 8 1 h7 okB3147
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3139 10 = true := blkChk_join _ _ _ _ _ 3139 9 1 h8 okB3148
  exact h9
end E1.C384X
