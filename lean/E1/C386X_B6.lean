module
public import R22Port.U_d41d8cd98f00
public import E1.C386X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C386X
open E1S
theorem okB67 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 1 = true := by decide +kernel
theorem okB68 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 68 1 = true := by decide +kernel
theorem okB69 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 69 1 = true := by decide +kernel
theorem okB70 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 70 1 = true := by decide +kernel
theorem okB71 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 71 1 = true := by decide +kernel
theorem okB72 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 72 1 = true := by decide +kernel
theorem okB73 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 73 1 = true := by decide +kernel
theorem okB74 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 74 1 = true := by decide +kernel
theorem okB75 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 75 1 = true := by decide +kernel
theorem okB76 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 76 1 = true := by decide +kernel
theorem okG6 : glueChkR lits W 67 10 = true := by decide +kernel
theorem okM6 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 10 = true := by
  have h0 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 1 = true := okB67
  have h1 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 2 = true := blkChk_join _ _ _ _ _ 67 1 1 h0 okB68
  have h2 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 3 = true := blkChk_join _ _ _ _ _ 67 2 1 h1 okB69
  have h3 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 4 = true := blkChk_join _ _ _ _ _ 67 3 1 h2 okB70
  have h4 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 5 = true := blkChk_join _ _ _ _ _ 67 4 1 h3 okB71
  have h5 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 6 = true := blkChk_join _ _ _ _ _ 67 5 1 h4 okB72
  have h6 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 7 = true := blkChk_join _ _ _ _ _ 67 6 1 h5 okB73
  have h7 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 8 = true := blkChk_join _ _ _ _ _ 67 7 1 h6 okB74
  have h8 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 9 = true := blkChk_join _ _ _ _ _ 67 8 1 h7 okB75
  have h9 : blkChk E1.IP_e386.C E1.SL_e386.entry E1.IP_e386.UB E1.IP_e386.UBR lits 67 10 = true := blkChk_join _ _ _ _ _ 67 9 1 h8 okB76
  exact h9
end E1.C386X
