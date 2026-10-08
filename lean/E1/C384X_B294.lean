module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3100 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 1 = true := by decide +kernel
theorem okB3101 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3101 1 = true := by decide +kernel
theorem okB3102 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3102 1 = true := by decide +kernel
theorem okB3103 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3103 1 = true := by decide +kernel
theorem okB3104 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3104 1 = true := by decide +kernel
theorem okB3105 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3105 1 = true := by decide +kernel
theorem okB3106 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3106 1 = true := by decide +kernel
theorem okB3107 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3107 1 = true := by decide +kernel
theorem okB3108 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3108 1 = true := by decide +kernel
theorem okB3109 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3109 1 = true := by decide +kernel
theorem okB3110 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3110 1 = true := by decide +kernel
theorem okG294 : glueChkR lits W 3100 11 = true := by decide +kernel
theorem okM294 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 1 = true := okB3100
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 2 = true := blkChk_join _ _ _ _ _ 3100 1 1 h0 okB3101
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 3 = true := blkChk_join _ _ _ _ _ 3100 2 1 h1 okB3102
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 4 = true := blkChk_join _ _ _ _ _ 3100 3 1 h2 okB3103
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 5 = true := blkChk_join _ _ _ _ _ 3100 4 1 h3 okB3104
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 6 = true := blkChk_join _ _ _ _ _ 3100 5 1 h4 okB3105
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 7 = true := blkChk_join _ _ _ _ _ 3100 6 1 h5 okB3106
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 8 = true := blkChk_join _ _ _ _ _ 3100 7 1 h6 okB3107
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 9 = true := blkChk_join _ _ _ _ _ 3100 8 1 h7 okB3108
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 10 = true := blkChk_join _ _ _ _ _ 3100 9 1 h8 okB3109
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3100 11 = true := blkChk_join _ _ _ _ _ 3100 10 1 h9 okB3110
  exact h10
end E1.C384X
