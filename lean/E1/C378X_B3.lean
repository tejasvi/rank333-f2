module
public import R22Port.U_d41d8cd98f00
public import E1.C378X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C378X
open E1S
theorem okB47 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 1 = true := by decide +kernel
theorem okB48 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 48 1 = true := by decide +kernel
theorem okB49 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 49 1 = true := by decide +kernel
theorem okB50 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 50 1 = true := by decide +kernel
theorem okB51 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 51 1 = true := by decide +kernel
theorem okB52 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 52 1 = true := by decide +kernel
theorem okB53 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 53 1 = true := by decide +kernel
theorem okB54 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 54 1 = true := by decide +kernel
theorem okG3 : glueChkR lits W 47 8 = true := by decide +kernel
theorem okM3 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 8 = true := by
  have h0 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 1 = true := okB47
  have h1 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 2 = true := blkChk_join _ _ _ _ _ 47 1 1 h0 okB48
  have h2 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 3 = true := blkChk_join _ _ _ _ _ 47 2 1 h1 okB49
  have h3 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 4 = true := blkChk_join _ _ _ _ _ 47 3 1 h2 okB50
  have h4 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 5 = true := blkChk_join _ _ _ _ _ 47 4 1 h3 okB51
  have h5 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 6 = true := blkChk_join _ _ _ _ _ 47 5 1 h4 okB52
  have h6 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 7 = true := blkChk_join _ _ _ _ _ 47 6 1 h5 okB53
  have h7 : blkChk E1.IP_e378.C E1.SL_e378.entry E1.IP_e378.UB E1.IP_e378.UBR lits 47 8 = true := blkChk_join _ _ _ _ _ 47 7 1 h6 okB54
  exact h7
end E1.C378X
