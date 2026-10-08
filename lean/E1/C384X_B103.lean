module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1106 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 1 = true := by decide +kernel
theorem okB1107 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1107 1 = true := by decide +kernel
theorem okB1108 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1108 1 = true := by decide +kernel
theorem okB1109 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1109 1 = true := by decide +kernel
theorem okB1110 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1110 1 = true := by decide +kernel
theorem okB1111 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1111 1 = true := by decide +kernel
theorem okB1112 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1112 1 = true := by decide +kernel
theorem okB1113 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1113 1 = true := by decide +kernel
theorem okB1114 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1114 1 = true := by decide +kernel
theorem okB1115 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1115 1 = true := by decide +kernel
theorem okG103 : glueChkR lits W 1106 10 = true := by decide +kernel
theorem okM103 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 1 = true := okB1106
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 2 = true := blkChk_join _ _ _ _ _ 1106 1 1 h0 okB1107
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 3 = true := blkChk_join _ _ _ _ _ 1106 2 1 h1 okB1108
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 4 = true := blkChk_join _ _ _ _ _ 1106 3 1 h2 okB1109
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 5 = true := blkChk_join _ _ _ _ _ 1106 4 1 h3 okB1110
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 6 = true := blkChk_join _ _ _ _ _ 1106 5 1 h4 okB1111
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 7 = true := blkChk_join _ _ _ _ _ 1106 6 1 h5 okB1112
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 8 = true := blkChk_join _ _ _ _ _ 1106 7 1 h6 okB1113
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 9 = true := blkChk_join _ _ _ _ _ 1106 8 1 h7 okB1114
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1106 10 = true := blkChk_join _ _ _ _ _ 1106 9 1 h8 okB1115
  exact h9
end E1.C384X
