module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 1 = true := by decide +kernel
theorem okB12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 12 1 = true := by decide +kernel
theorem okB13 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 13 1 = true := by decide +kernel
theorem okB14 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 14 1 = true := by decide +kernel
theorem okB15 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 15 1 = true := by decide +kernel
theorem okB16 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 16 1 = true := by decide +kernel
theorem okB17 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 17 1 = true := by decide +kernel
theorem okB18 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 18 1 = true := by decide +kernel
theorem okB19 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 19 1 = true := by decide +kernel
theorem okB20 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 20 1 = true := by decide +kernel
theorem okG1 : glueChkR lits W 11 10 = true := by decide +kernel
theorem okM1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 1 = true := okB11
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 2 = true := blkChk_join _ _ _ _ _ 11 1 1 h0 okB12
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 3 = true := blkChk_join _ _ _ _ _ 11 2 1 h1 okB13
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 4 = true := blkChk_join _ _ _ _ _ 11 3 1 h2 okB14
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 5 = true := blkChk_join _ _ _ _ _ 11 4 1 h3 okB15
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 6 = true := blkChk_join _ _ _ _ _ 11 5 1 h4 okB16
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 7 = true := blkChk_join _ _ _ _ _ 11 6 1 h5 okB17
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 8 = true := blkChk_join _ _ _ _ _ 11 7 1 h6 okB18
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 9 = true := blkChk_join _ _ _ _ _ 11 8 1 h7 okB19
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 11 10 = true := blkChk_join _ _ _ _ _ 11 9 1 h8 okB20
  exact h9
end E1.C384X
