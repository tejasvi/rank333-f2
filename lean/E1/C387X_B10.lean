module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB113 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 1 = true := by decide +kernel
theorem okB114 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 114 1 = true := by decide +kernel
theorem okB115 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 115 1 = true := by decide +kernel
theorem okB116 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 116 1 = true := by decide +kernel
theorem okB117 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 117 1 = true := by decide +kernel
theorem okB118 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 118 1 = true := by decide +kernel
theorem okB119 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 119 1 = true := by decide +kernel
theorem okB120 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 120 1 = true := by decide +kernel
theorem okB121 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 121 1 = true := by decide +kernel
theorem okB122 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 122 1 = true := by decide +kernel
theorem okG10 : glueChkR lits W 113 10 = true := by decide +kernel
theorem okM10 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 1 = true := okB113
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 2 = true := blkChk_join _ _ _ _ _ 113 1 1 h0 okB114
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 3 = true := blkChk_join _ _ _ _ _ 113 2 1 h1 okB115
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 4 = true := blkChk_join _ _ _ _ _ 113 3 1 h2 okB116
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 5 = true := blkChk_join _ _ _ _ _ 113 4 1 h3 okB117
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 6 = true := blkChk_join _ _ _ _ _ 113 5 1 h4 okB118
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 7 = true := blkChk_join _ _ _ _ _ 113 6 1 h5 okB119
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 8 = true := blkChk_join _ _ _ _ _ 113 7 1 h6 okB120
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 9 = true := blkChk_join _ _ _ _ _ 113 8 1 h7 okB121
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 113 10 = true := blkChk_join _ _ _ _ _ 113 9 1 h8 okB122
  exact h9
end E1.C387X
