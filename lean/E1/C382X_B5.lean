module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB52 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 1 = true := by decide +kernel
theorem okB53 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 53 1 = true := by decide +kernel
theorem okB54 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 54 1 = true := by decide +kernel
theorem okB55 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 55 1 = true := by decide +kernel
theorem okB56 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 56 1 = true := by decide +kernel
theorem okB57 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 57 1 = true := by decide +kernel
theorem okB58 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 58 1 = true := by decide +kernel
theorem okB59 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 59 1 = true := by decide +kernel
theorem okB60 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 60 1 = true := by decide +kernel
theorem okG5 : glueChkR lits W 52 9 = true := by decide +kernel
theorem okM5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 1 = true := okB52
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 2 = true := blkChk_join _ _ _ _ _ 52 1 1 h0 okB53
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 3 = true := blkChk_join _ _ _ _ _ 52 2 1 h1 okB54
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 4 = true := blkChk_join _ _ _ _ _ 52 3 1 h2 okB55
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 5 = true := blkChk_join _ _ _ _ _ 52 4 1 h3 okB56
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 6 = true := blkChk_join _ _ _ _ _ 52 5 1 h4 okB57
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 7 = true := blkChk_join _ _ _ _ _ 52 6 1 h5 okB58
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 8 = true := blkChk_join _ _ _ _ _ 52 7 1 h6 okB59
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 52 9 = true := blkChk_join _ _ _ _ _ 52 8 1 h7 okB60
  exact h8
end E1.C382X
