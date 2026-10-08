module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB3066 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 1 = true := by decide +kernel
theorem okB3067 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3067 1 = true := by decide +kernel
theorem okB3068 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3068 1 = true := by decide +kernel
theorem okB3069 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3069 1 = true := by decide +kernel
theorem okB3070 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3070 1 = true := by decide +kernel
theorem okB3071 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3071 1 = true := by decide +kernel
theorem okB3072 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3072 1 = true := by decide +kernel
theorem okB3073 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3073 1 = true := by decide +kernel
theorem okB3074 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3074 1 = true := by decide +kernel
theorem okG287 : glueChkR lits W 3066 9 = true := by decide +kernel
theorem okM287 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 9 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 1 = true := okB3066
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 2 = true := blkChk_join _ _ _ _ _ 3066 1 1 h0 okB3067
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 3 = true := blkChk_join _ _ _ _ _ 3066 2 1 h1 okB3068
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 4 = true := blkChk_join _ _ _ _ _ 3066 3 1 h2 okB3069
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 5 = true := blkChk_join _ _ _ _ _ 3066 4 1 h3 okB3070
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 6 = true := blkChk_join _ _ _ _ _ 3066 5 1 h4 okB3071
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 7 = true := blkChk_join _ _ _ _ _ 3066 6 1 h5 okB3072
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 8 = true := blkChk_join _ _ _ _ _ 3066 7 1 h6 okB3073
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3066 9 = true := blkChk_join _ _ _ _ _ 3066 8 1 h7 okB3074
  exact h8
end E1.C213X
