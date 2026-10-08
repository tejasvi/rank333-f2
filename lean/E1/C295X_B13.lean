module
public import R22Port.U_d41d8cd98f00
public import E1.C295X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C295X
open E1S
theorem okB138 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 1 = true := by decide +kernel
theorem okB139 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 139 1 = true := by decide +kernel
theorem okB140 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 140 1 = true := by decide +kernel
theorem okB141 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 141 1 = true := by decide +kernel
theorem okB142 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 142 1 = true := by decide +kernel
theorem okB143 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 143 1 = true := by decide +kernel
theorem okB144 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 144 1 = true := by decide +kernel
theorem okB145 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 145 1 = true := by decide +kernel
theorem okB146 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 146 1 = true := by decide +kernel
theorem okG13 : glueChkR lits W 138 9 = true := by decide +kernel
theorem okM13 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 9 = true := by
  have h0 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 1 = true := okB138
  have h1 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 2 = true := blkChk_join _ _ _ _ _ 138 1 1 h0 okB139
  have h2 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 3 = true := blkChk_join _ _ _ _ _ 138 2 1 h1 okB140
  have h3 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 4 = true := blkChk_join _ _ _ _ _ 138 3 1 h2 okB141
  have h4 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 5 = true := blkChk_join _ _ _ _ _ 138 4 1 h3 okB142
  have h5 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 6 = true := blkChk_join _ _ _ _ _ 138 5 1 h4 okB143
  have h6 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 7 = true := blkChk_join _ _ _ _ _ 138 6 1 h5 okB144
  have h7 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 8 = true := blkChk_join _ _ _ _ _ 138 7 1 h6 okB145
  have h8 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 138 9 = true := blkChk_join _ _ _ _ _ 138 8 1 h7 okB146
  exact h8
end E1.C295X
