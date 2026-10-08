module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB50 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 1 = true := by decide +kernel
theorem okB51 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 51 1 = true := by decide +kernel
theorem okB52 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 52 1 = true := by decide +kernel
theorem okB53 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 53 1 = true := by decide +kernel
theorem okB54 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 54 1 = true := by decide +kernel
theorem okB55 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 55 1 = true := by decide +kernel
theorem okB56 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 56 1 = true := by decide +kernel
theorem okB57 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 57 1 = true := by decide +kernel
theorem okB58 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 58 1 = true := by decide +kernel
theorem okG4 : glueChkR lits W 50 9 = true := by decide +kernel
theorem okM4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 9 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 1 = true := okB50
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 2 = true := blkChk_join _ _ _ _ _ 50 1 1 h0 okB51
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 3 = true := blkChk_join _ _ _ _ _ 50 2 1 h1 okB52
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 4 = true := blkChk_join _ _ _ _ _ 50 3 1 h2 okB53
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 5 = true := blkChk_join _ _ _ _ _ 50 4 1 h3 okB54
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 6 = true := blkChk_join _ _ _ _ _ 50 5 1 h4 okB55
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 7 = true := blkChk_join _ _ _ _ _ 50 6 1 h5 okB56
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 8 = true := blkChk_join _ _ _ _ _ 50 7 1 h6 okB57
  have h8 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 50 9 = true := blkChk_join _ _ _ _ _ 50 8 1 h7 okB58
  exact h8
end E1.C267X
