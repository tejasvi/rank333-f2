module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB53 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 1 = true := by decide +kernel
theorem okB54 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 54 1 = true := by decide +kernel
theorem okB55 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 55 1 = true := by decide +kernel
theorem okB56 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 56 1 = true := by decide +kernel
theorem okB57 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 57 1 = true := by decide +kernel
theorem okB58 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 58 1 = true := by decide +kernel
theorem okB59 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 59 1 = true := by decide +kernel
theorem okB60 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 60 1 = true := by decide +kernel
theorem okB61 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 61 1 = true := by decide +kernel
theorem okB62 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 62 1 = true := by decide +kernel
theorem okB63 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 63 1 = true := by decide +kernel
theorem okB64 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 64 1 = true := by decide +kernel
theorem okB65 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 65 1 = true := by decide +kernel
theorem okG5 : glueChkR lits W 53 13 = true := by decide +kernel
theorem okM5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 13 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 1 = true := okB53
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 2 = true := blkChk_join _ _ _ _ _ 53 1 1 h0 okB54
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 3 = true := blkChk_join _ _ _ _ _ 53 2 1 h1 okB55
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 4 = true := blkChk_join _ _ _ _ _ 53 3 1 h2 okB56
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 5 = true := blkChk_join _ _ _ _ _ 53 4 1 h3 okB57
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 6 = true := blkChk_join _ _ _ _ _ 53 5 1 h4 okB58
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 7 = true := blkChk_join _ _ _ _ _ 53 6 1 h5 okB59
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 8 = true := blkChk_join _ _ _ _ _ 53 7 1 h6 okB60
  have h8 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 9 = true := blkChk_join _ _ _ _ _ 53 8 1 h7 okB61
  have h9 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 10 = true := blkChk_join _ _ _ _ _ 53 9 1 h8 okB62
  have h10 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 11 = true := blkChk_join _ _ _ _ _ 53 10 1 h9 okB63
  have h11 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 12 = true := blkChk_join _ _ _ _ _ 53 11 1 h10 okB64
  have h12 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 53 13 = true := blkChk_join _ _ _ _ _ 53 12 1 h11 okB65
  exact h12
end E1.C395X
