module
public import R22Port.U_d41d8cd98f00
public import E1.C295X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C295X
open E1S
theorem okB87 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 1 = true := by decide +kernel
theorem okB88 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 88 1 = true := by decide +kernel
theorem okB89 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 89 1 = true := by decide +kernel
theorem okB90 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 90 1 = true := by decide +kernel
theorem okB91 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 91 1 = true := by decide +kernel
theorem okB92 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 92 1 = true := by decide +kernel
theorem okB93 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 93 1 = true := by decide +kernel
theorem okB94 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 94 1 = true := by decide +kernel
theorem okB95 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 95 1 = true := by decide +kernel
theorem okB96 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 96 1 = true := by decide +kernel
theorem okG8 : glueChkR lits W 87 10 = true := by decide +kernel
theorem okM8 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 10 = true := by
  have h0 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 1 = true := okB87
  have h1 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 2 = true := blkChk_join _ _ _ _ _ 87 1 1 h0 okB88
  have h2 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 3 = true := blkChk_join _ _ _ _ _ 87 2 1 h1 okB89
  have h3 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 4 = true := blkChk_join _ _ _ _ _ 87 3 1 h2 okB90
  have h4 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 5 = true := blkChk_join _ _ _ _ _ 87 4 1 h3 okB91
  have h5 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 6 = true := blkChk_join _ _ _ _ _ 87 5 1 h4 okB92
  have h6 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 7 = true := blkChk_join _ _ _ _ _ 87 6 1 h5 okB93
  have h7 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 8 = true := blkChk_join _ _ _ _ _ 87 7 1 h6 okB94
  have h8 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 9 = true := blkChk_join _ _ _ _ _ 87 8 1 h7 okB95
  have h9 : blkChk E1.IP_e295.C E1.SL_e295.entry E1.IP_e295.UB E1.IP_e295.UBR lits 87 10 = true := blkChk_join _ _ _ _ _ 87 9 1 h8 okB96
  exact h9
end E1.C295X
