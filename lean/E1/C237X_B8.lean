module
public import R22Port.U_d41d8cd98f00
public import E1.C237X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C237X
open E1S
theorem okB86 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 1 = true := by decide +kernel
theorem okB87 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 87 1 = true := by decide +kernel
theorem okB88 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 88 1 = true := by decide +kernel
theorem okB89 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 89 1 = true := by decide +kernel
theorem okB90 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 90 1 = true := by decide +kernel
theorem okB91 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 91 1 = true := by decide +kernel
theorem okB92 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 92 1 = true := by decide +kernel
theorem okB93 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 93 1 = true := by decide +kernel
theorem okG8 : glueChkR lits W 86 8 = true := by decide +kernel
theorem okM8 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 8 = true := by
  have h0 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 1 = true := okB86
  have h1 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 2 = true := blkChk_join _ _ _ _ _ 86 1 1 h0 okB87
  have h2 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 3 = true := blkChk_join _ _ _ _ _ 86 2 1 h1 okB88
  have h3 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 4 = true := blkChk_join _ _ _ _ _ 86 3 1 h2 okB89
  have h4 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 5 = true := blkChk_join _ _ _ _ _ 86 4 1 h3 okB90
  have h5 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 6 = true := blkChk_join _ _ _ _ _ 86 5 1 h4 okB91
  have h6 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 7 = true := blkChk_join _ _ _ _ _ 86 6 1 h5 okB92
  have h7 : blkChk E1.IP_e237.C E1.SL_e237.entry E1.IP_e237.UB E1.IP_e237.UBR lits 86 8 = true := blkChk_join _ _ _ _ _ 86 7 1 h6 okB93
  exact h7
end E1.C237X
