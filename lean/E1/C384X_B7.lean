module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB71 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 1 = true := by decide +kernel
theorem okB72 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 72 1 = true := by decide +kernel
theorem okB73 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 73 1 = true := by decide +kernel
theorem okB74 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 74 1 = true := by decide +kernel
theorem okB75 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 75 1 = true := by decide +kernel
theorem okB76 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 76 1 = true := by decide +kernel
theorem okB77 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 77 1 = true := by decide +kernel
theorem okB78 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 78 1 = true := by decide +kernel
theorem okG7 : glueChkR lits W 71 8 = true := by decide +kernel
theorem okM7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 1 = true := okB71
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 2 = true := blkChk_join _ _ _ _ _ 71 1 1 h0 okB72
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 3 = true := blkChk_join _ _ _ _ _ 71 2 1 h1 okB73
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 4 = true := blkChk_join _ _ _ _ _ 71 3 1 h2 okB74
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 5 = true := blkChk_join _ _ _ _ _ 71 4 1 h3 okB75
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 6 = true := blkChk_join _ _ _ _ _ 71 5 1 h4 okB76
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 7 = true := blkChk_join _ _ _ _ _ 71 6 1 h5 okB77
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 71 8 = true := blkChk_join _ _ _ _ _ 71 7 1 h6 okB78
  exact h7
end E1.C384X
