module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3001 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 1 = true := by decide +kernel
theorem okB3002 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3002 1 = true := by decide +kernel
theorem okB3003 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3003 1 = true := by decide +kernel
theorem okB3004 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3004 1 = true := by decide +kernel
theorem okB3005 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3005 1 = true := by decide +kernel
theorem okB3006 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3006 1 = true := by decide +kernel
theorem okB3007 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3007 1 = true := by decide +kernel
theorem okB3008 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3008 1 = true := by decide +kernel
theorem okB3009 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3009 1 = true := by decide +kernel
theorem okB3010 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3010 1 = true := by decide +kernel
theorem okB3011 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3011 1 = true := by decide +kernel
theorem okG285 : glueChkR lits W 3001 11 = true := by decide +kernel
theorem okM285 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 1 = true := okB3001
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 2 = true := blkChk_join _ _ _ _ _ 3001 1 1 h0 okB3002
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 3 = true := blkChk_join _ _ _ _ _ 3001 2 1 h1 okB3003
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 4 = true := blkChk_join _ _ _ _ _ 3001 3 1 h2 okB3004
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 5 = true := blkChk_join _ _ _ _ _ 3001 4 1 h3 okB3005
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 6 = true := blkChk_join _ _ _ _ _ 3001 5 1 h4 okB3006
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 7 = true := blkChk_join _ _ _ _ _ 3001 6 1 h5 okB3007
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 8 = true := blkChk_join _ _ _ _ _ 3001 7 1 h6 okB3008
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 9 = true := blkChk_join _ _ _ _ _ 3001 8 1 h7 okB3009
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 10 = true := blkChk_join _ _ _ _ _ 3001 9 1 h8 okB3010
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3001 11 = true := blkChk_join _ _ _ _ _ 3001 10 1 h9 okB3011
  exact h10
end E1.C384X
