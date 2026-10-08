module
public import R22Port.U_d41d8cd98f00
public import E1.C237X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C237X
open E1S
theorem okB68 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 1 = true := by decide +kernel
theorem okB69 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 69 1 = true := by decide +kernel
theorem okB70 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 70 1 = true := by decide +kernel
theorem okB71 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 71 1 = true := by decide +kernel
theorem okB72 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 72 1 = true := by decide +kernel
theorem okB73 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 73 1 = true := by decide +kernel
theorem okB74 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 74 1 = true := by decide +kernel
theorem okB75 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 75 1 = true := by decide +kernel
theorem okG6 : glueChkR lits W 68 8 = true := by decide +kernel
theorem okM6 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 8 = true := by
  have h0 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 1 = true := okB68
  have h1 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 2 = true := blkChk_join _ _ _ _ _ 68 1 1 h0 okB69
  have h2 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 3 = true := blkChk_join _ _ _ _ _ 68 2 1 h1 okB70
  have h3 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 4 = true := blkChk_join _ _ _ _ _ 68 3 1 h2 okB71
  have h4 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 5 = true := blkChk_join _ _ _ _ _ 68 4 1 h3 okB72
  have h5 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 6 = true := blkChk_join _ _ _ _ _ 68 5 1 h4 okB73
  have h6 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 7 = true := blkChk_join _ _ _ _ _ 68 6 1 h5 okB74
  have h7 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 68 8 = true := blkChk_join _ _ _ _ _ 68 7 1 h6 okB75
  exact h7
end E1.C237X
