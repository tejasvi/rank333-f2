module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB2910 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 1 = true := by decide +kernel
theorem okB2911 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2911 1 = true := by decide +kernel
theorem okB2912 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2912 1 = true := by decide +kernel
theorem okB2913 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2913 1 = true := by decide +kernel
theorem okB2914 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2914 1 = true := by decide +kernel
theorem okB2915 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2915 1 = true := by decide +kernel
theorem okB2916 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2916 1 = true := by decide +kernel
theorem okB2917 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2917 1 = true := by decide +kernel
theorem okB2918 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2918 1 = true := by decide +kernel
theorem okB2919 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2919 1 = true := by decide +kernel
theorem okG270 : glueChkR lits W 2910 10 = true := by decide +kernel
theorem okM270 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 1 = true := okB2910
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 2 = true := blkChk_join _ _ _ _ _ 2910 1 1 h0 okB2911
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 3 = true := blkChk_join _ _ _ _ _ 2910 2 1 h1 okB2912
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 4 = true := blkChk_join _ _ _ _ _ 2910 3 1 h2 okB2913
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 5 = true := blkChk_join _ _ _ _ _ 2910 4 1 h3 okB2914
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 6 = true := blkChk_join _ _ _ _ _ 2910 5 1 h4 okB2915
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 7 = true := blkChk_join _ _ _ _ _ 2910 6 1 h5 okB2916
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 8 = true := blkChk_join _ _ _ _ _ 2910 7 1 h6 okB2917
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 9 = true := blkChk_join _ _ _ _ _ 2910 8 1 h7 okB2918
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2910 10 = true := blkChk_join _ _ _ _ _ 2910 9 1 h8 okB2919
  exact h9
end E1.C213X
