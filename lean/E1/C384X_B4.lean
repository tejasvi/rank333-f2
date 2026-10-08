module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB44 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 1 = true := by decide +kernel
theorem okB45 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 45 1 = true := by decide +kernel
theorem okB46 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 46 1 = true := by decide +kernel
theorem okB47 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 47 1 = true := by decide +kernel
theorem okB48 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 48 1 = true := by decide +kernel
theorem okB49 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 49 1 = true := by decide +kernel
theorem okB50 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 50 1 = true := by decide +kernel
theorem okB51 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 51 1 = true := by decide +kernel
theorem okG4 : glueChkR lits W 44 8 = true := by decide +kernel
theorem okM4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 1 = true := okB44
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 2 = true := blkChk_join _ _ _ _ _ 44 1 1 h0 okB45
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 3 = true := blkChk_join _ _ _ _ _ 44 2 1 h1 okB46
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 4 = true := blkChk_join _ _ _ _ _ 44 3 1 h2 okB47
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 5 = true := blkChk_join _ _ _ _ _ 44 4 1 h3 okB48
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 6 = true := blkChk_join _ _ _ _ _ 44 5 1 h4 okB49
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 7 = true := blkChk_join _ _ _ _ _ 44 6 1 h5 okB50
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 44 8 = true := blkChk_join _ _ _ _ _ 44 7 1 h6 okB51
  exact h7
end E1.C384X
