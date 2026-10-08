module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB2880 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 1 = true := by decide +kernel
theorem okB2881 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2881 1 = true := by decide +kernel
theorem okB2882 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2882 1 = true := by decide +kernel
theorem okB2883 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2883 1 = true := by decide +kernel
theorem okB2884 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2884 1 = true := by decide +kernel
theorem okB2885 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2885 1 = true := by decide +kernel
theorem okB2886 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2886 1 = true := by decide +kernel
theorem okB2887 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2887 1 = true := by decide +kernel
theorem okB2888 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2888 1 = true := by decide +kernel
theorem okG267 : glueChkR lits W 2880 9 = true := by decide +kernel
theorem okM267 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 9 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 1 = true := okB2880
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 2 = true := blkChk_join _ _ _ _ _ 2880 1 1 h0 okB2881
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 3 = true := blkChk_join _ _ _ _ _ 2880 2 1 h1 okB2882
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 4 = true := blkChk_join _ _ _ _ _ 2880 3 1 h2 okB2883
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 5 = true := blkChk_join _ _ _ _ _ 2880 4 1 h3 okB2884
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 6 = true := blkChk_join _ _ _ _ _ 2880 5 1 h4 okB2885
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 7 = true := blkChk_join _ _ _ _ _ 2880 6 1 h5 okB2886
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 8 = true := blkChk_join _ _ _ _ _ 2880 7 1 h6 okB2887
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 2880 9 = true := blkChk_join _ _ _ _ _ 2880 8 1 h7 okB2888
  exact h8
end E1.C213X
