module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 1 = true := by decide +kernel
theorem okB11 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 11 1 = true := by decide +kernel
theorem okB12 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 12 1 = true := by decide +kernel
theorem okB13 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 13 1 = true := by decide +kernel
theorem okB14 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 14 1 = true := by decide +kernel
theorem okB15 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 15 1 = true := by decide +kernel
theorem okB16 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 16 1 = true := by decide +kernel
theorem okB17 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 17 1 = true := by decide +kernel
theorem okB18 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 18 1 = true := by decide +kernel
theorem okB19 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 19 1 = true := by decide +kernel
theorem okB20 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 20 1 = true := by decide +kernel
theorem okG1 : glueChkR lits W 10 11 = true := by decide +kernel
theorem okM1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 11 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 1 = true := okB10
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 2 = true := blkChk_join _ _ _ _ _ 10 1 1 h0 okB11
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 3 = true := blkChk_join _ _ _ _ _ 10 2 1 h1 okB12
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 4 = true := blkChk_join _ _ _ _ _ 10 3 1 h2 okB13
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 5 = true := blkChk_join _ _ _ _ _ 10 4 1 h3 okB14
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 6 = true := blkChk_join _ _ _ _ _ 10 5 1 h4 okB15
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 7 = true := blkChk_join _ _ _ _ _ 10 6 1 h5 okB16
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 8 = true := blkChk_join _ _ _ _ _ 10 7 1 h6 okB17
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 9 = true := blkChk_join _ _ _ _ _ 10 8 1 h7 okB18
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 10 = true := blkChk_join _ _ _ _ _ 10 9 1 h8 okB19
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 10 11 = true := blkChk_join _ _ _ _ _ 10 10 1 h9 okB20
  exact h10
end E1.C213X
