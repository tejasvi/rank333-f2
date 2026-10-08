module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 1 = true := by decide +kernel
theorem okB10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 10 1 = true := by decide +kernel
theorem okB11 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 11 1 = true := by decide +kernel
theorem okB12 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 12 1 = true := by decide +kernel
theorem okB13 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 13 1 = true := by decide +kernel
theorem okB14 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 14 1 = true := by decide +kernel
theorem okB15 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 15 1 = true := by decide +kernel
theorem okB16 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 16 1 = true := by decide +kernel
theorem okB17 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 17 1 = true := by decide +kernel
theorem okB18 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 18 1 = true := by decide +kernel
theorem okB19 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 19 1 = true := by decide +kernel
theorem okG1 : glueChkR lits W 9 11 = true := by decide +kernel
theorem okM1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 11 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 1 = true := okB9
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 2 = true := blkChk_join _ _ _ _ _ 9 1 1 h0 okB10
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 3 = true := blkChk_join _ _ _ _ _ 9 2 1 h1 okB11
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 4 = true := blkChk_join _ _ _ _ _ 9 3 1 h2 okB12
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 5 = true := blkChk_join _ _ _ _ _ 9 4 1 h3 okB13
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 6 = true := blkChk_join _ _ _ _ _ 9 5 1 h4 okB14
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 7 = true := blkChk_join _ _ _ _ _ 9 6 1 h5 okB15
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 8 = true := blkChk_join _ _ _ _ _ 9 7 1 h6 okB16
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 9 = true := blkChk_join _ _ _ _ _ 9 8 1 h7 okB17
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 10 = true := blkChk_join _ _ _ _ _ 9 9 1 h8 okB18
  have h10 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 9 11 = true := blkChk_join _ _ _ _ _ 9 10 1 h9 okB19
  exact h10
end E1.C382X
