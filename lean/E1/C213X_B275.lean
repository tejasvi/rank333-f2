module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB2962 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 1 = true := by decide +kernel
theorem okB2963 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2963 1 = true := by decide +kernel
theorem okB2964 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2964 1 = true := by decide +kernel
theorem okB2965 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2965 1 = true := by decide +kernel
theorem okB2966 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2966 1 = true := by decide +kernel
theorem okB2967 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2967 1 = true := by decide +kernel
theorem okB2968 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2968 1 = true := by decide +kernel
theorem okB2969 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2969 1 = true := by decide +kernel
theorem okB2970 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2970 1 = true := by decide +kernel
theorem okB2971 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2971 1 = true := by decide +kernel
theorem okG275 : glueChkR lits W 2962 10 = true := by decide +kernel
theorem okM275 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 1 = true := okB2962
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 2 = true := blkChk_join _ _ _ _ _ 2962 1 1 h0 okB2963
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 3 = true := blkChk_join _ _ _ _ _ 2962 2 1 h1 okB2964
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 4 = true := blkChk_join _ _ _ _ _ 2962 3 1 h2 okB2965
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 5 = true := blkChk_join _ _ _ _ _ 2962 4 1 h3 okB2966
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 6 = true := blkChk_join _ _ _ _ _ 2962 5 1 h4 okB2967
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 7 = true := blkChk_join _ _ _ _ _ 2962 6 1 h5 okB2968
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 8 = true := blkChk_join _ _ _ _ _ 2962 7 1 h6 okB2969
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 9 = true := blkChk_join _ _ _ _ _ 2962 8 1 h7 okB2970
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2962 10 = true := blkChk_join _ _ _ _ _ 2962 9 1 h8 okB2971
  exact h9
end E1.C213X
