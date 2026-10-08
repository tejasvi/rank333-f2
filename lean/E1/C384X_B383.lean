module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4001 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 1 = true := by decide +kernel
theorem okB4002 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4002 1 = true := by decide +kernel
theorem okB4003 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4003 1 = true := by decide +kernel
theorem okB4004 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4004 1 = true := by decide +kernel
theorem okB4005 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4005 1 = true := by decide +kernel
theorem okB4006 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4006 1 = true := by decide +kernel
theorem okB4007 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4007 1 = true := by decide +kernel
theorem okB4008 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4008 1 = true := by decide +kernel
theorem okB4009 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4009 1 = true := by decide +kernel
theorem okG383 : glueChkR lits W 4001 9 = true := by decide +kernel
theorem okM383 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 1 = true := okB4001
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 2 = true := blkChk_join _ _ _ _ _ 4001 1 1 h0 okB4002
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 3 = true := blkChk_join _ _ _ _ _ 4001 2 1 h1 okB4003
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 4 = true := blkChk_join _ _ _ _ _ 4001 3 1 h2 okB4004
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 5 = true := blkChk_join _ _ _ _ _ 4001 4 1 h3 okB4005
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 6 = true := blkChk_join _ _ _ _ _ 4001 5 1 h4 okB4006
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 7 = true := blkChk_join _ _ _ _ _ 4001 6 1 h5 okB4007
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 8 = true := blkChk_join _ _ _ _ _ 4001 7 1 h6 okB4008
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4001 9 = true := blkChk_join _ _ _ _ _ 4001 8 1 h7 okB4009
  exact h8
end E1.C384X
