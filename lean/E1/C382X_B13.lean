module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB139 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 1 = true := by decide +kernel
theorem okB140 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 140 1 = true := by decide +kernel
theorem okB141 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 141 1 = true := by decide +kernel
theorem okB142 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 142 1 = true := by decide +kernel
theorem okB143 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 143 1 = true := by decide +kernel
theorem okB144 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 144 1 = true := by decide +kernel
theorem okB145 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 145 1 = true := by decide +kernel
theorem okB146 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 146 1 = true := by decide +kernel
theorem okB147 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 147 1 = true := by decide +kernel
theorem okB148 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 148 1 = true := by decide +kernel
theorem okG13 : glueChkR lits W 139 10 = true := by decide +kernel
theorem okM13 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 1 = true := okB139
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 2 = true := blkChk_join _ _ _ _ _ 139 1 1 h0 okB140
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 3 = true := blkChk_join _ _ _ _ _ 139 2 1 h1 okB141
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 4 = true := blkChk_join _ _ _ _ _ 139 3 1 h2 okB142
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 5 = true := blkChk_join _ _ _ _ _ 139 4 1 h3 okB143
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 6 = true := blkChk_join _ _ _ _ _ 139 5 1 h4 okB144
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 7 = true := blkChk_join _ _ _ _ _ 139 6 1 h5 okB145
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 8 = true := blkChk_join _ _ _ _ _ 139 7 1 h6 okB146
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 9 = true := blkChk_join _ _ _ _ _ 139 8 1 h7 okB147
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 139 10 = true := blkChk_join _ _ _ _ _ 139 9 1 h8 okB148
  exact h9
end E1.C382X
