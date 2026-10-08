module
public import R22Port.U_d41d8cd98f00
public import E1.C402X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C402X
open E1S
theorem okB54 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 1 = true := by decide +kernel
theorem okB55 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 55 1 = true := by decide +kernel
theorem okB56 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 56 1 = true := by decide +kernel
theorem okB57 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 57 1 = true := by decide +kernel
theorem okB58 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 58 1 = true := by decide +kernel
theorem okB59 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 59 1 = true := by decide +kernel
theorem okB60 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 60 1 = true := by decide +kernel
theorem okB61 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 61 1 = true := by decide +kernel
theorem okG6 : glueChkR lits W 54 8 = true := by decide +kernel
theorem okM6 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 8 = true := by
  have h0 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 1 = true := okB54
  have h1 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 2 = true := blkChk_join _ _ _ _ _ 54 1 1 h0 okB55
  have h2 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 3 = true := blkChk_join _ _ _ _ _ 54 2 1 h1 okB56
  have h3 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 4 = true := blkChk_join _ _ _ _ _ 54 3 1 h2 okB57
  have h4 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 5 = true := blkChk_join _ _ _ _ _ 54 4 1 h3 okB58
  have h5 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 6 = true := blkChk_join _ _ _ _ _ 54 5 1 h4 okB59
  have h6 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 7 = true := blkChk_join _ _ _ _ _ 54 6 1 h5 okB60
  have h7 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 54 8 = true := blkChk_join _ _ _ _ _ 54 7 1 h6 okB61
  exact h7
end E1.C402X
