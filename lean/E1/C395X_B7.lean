module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB80 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 1 = true := by decide +kernel
theorem okB81 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 81 1 = true := by decide +kernel
theorem okB82 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 82 1 = true := by decide +kernel
theorem okB83 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 83 1 = true := by decide +kernel
theorem okB84 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 84 1 = true := by decide +kernel
theorem okB85 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 85 1 = true := by decide +kernel
theorem okB86 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 86 1 = true := by decide +kernel
theorem okB87 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 87 1 = true := by decide +kernel
theorem okB88 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 88 1 = true := by decide +kernel
theorem okG7 : glueChkR lits W 80 9 = true := by decide +kernel
theorem okM7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 9 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 1 = true := okB80
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 2 = true := blkChk_join _ _ _ _ _ 80 1 1 h0 okB81
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 3 = true := blkChk_join _ _ _ _ _ 80 2 1 h1 okB82
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 4 = true := blkChk_join _ _ _ _ _ 80 3 1 h2 okB83
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 5 = true := blkChk_join _ _ _ _ _ 80 4 1 h3 okB84
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 6 = true := blkChk_join _ _ _ _ _ 80 5 1 h4 okB85
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 7 = true := blkChk_join _ _ _ _ _ 80 6 1 h5 okB86
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 8 = true := blkChk_join _ _ _ _ _ 80 7 1 h6 okB87
  have h8 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 80 9 = true := blkChk_join _ _ _ _ _ 80 8 1 h7 okB88
  exact h8
end E1.C395X
