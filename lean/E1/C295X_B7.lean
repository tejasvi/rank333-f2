module
public import R22Port.U_d41d8cd98f00
public import E1.C295X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C295X
open E1S
theorem okB79 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 1 = true := by decide +kernel
theorem okB80 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 80 1 = true := by decide +kernel
theorem okB81 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 81 1 = true := by decide +kernel
theorem okB82 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 82 1 = true := by decide +kernel
theorem okB83 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 83 1 = true := by decide +kernel
theorem okB84 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 84 1 = true := by decide +kernel
theorem okB85 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 85 1 = true := by decide +kernel
theorem okB86 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 86 1 = true := by decide +kernel
theorem okG7 : glueChkR lits W 79 8 = true := by decide +kernel
theorem okM7 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 8 = true := by
  have h0 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 1 = true := okB79
  have h1 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 2 = true := blkChk_join _ _ _ _ _ 79 1 1 h0 okB80
  have h2 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 3 = true := blkChk_join _ _ _ _ _ 79 2 1 h1 okB81
  have h3 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 4 = true := blkChk_join _ _ _ _ _ 79 3 1 h2 okB82
  have h4 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 5 = true := blkChk_join _ _ _ _ _ 79 4 1 h3 okB83
  have h5 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 6 = true := blkChk_join _ _ _ _ _ 79 5 1 h4 okB84
  have h6 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 7 = true := blkChk_join _ _ _ _ _ 79 6 1 h5 okB85
  have h7 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 79 8 = true := blkChk_join _ _ _ _ _ 79 7 1 h6 okB86
  exact h7
end E1.C295X
