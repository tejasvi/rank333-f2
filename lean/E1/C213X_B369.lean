module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB3870 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 1 = true := by decide +kernel
theorem okB3871 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3871 1 = true := by decide +kernel
theorem okB3872 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3872 1 = true := by decide +kernel
theorem okB3873 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3873 1 = true := by decide +kernel
theorem okB3874 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3874 1 = true := by decide +kernel
theorem okB3875 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3875 1 = true := by decide +kernel
theorem okB3876 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3876 1 = true := by decide +kernel
theorem okB3877 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3877 1 = true := by decide +kernel
theorem okB3878 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3878 1 = true := by decide +kernel
theorem okB3879 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3879 1 = true := by decide +kernel
theorem okB3880 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3880 1 = true := by decide +kernel
theorem okG369 : glueChkR lits W 3870 11 = true := by decide +kernel
theorem okM369 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 11 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 1 = true := okB3870
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 2 = true := blkChk_join _ _ _ _ _ 3870 1 1 h0 okB3871
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 3 = true := blkChk_join _ _ _ _ _ 3870 2 1 h1 okB3872
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 4 = true := blkChk_join _ _ _ _ _ 3870 3 1 h2 okB3873
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 5 = true := blkChk_join _ _ _ _ _ 3870 4 1 h3 okB3874
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 6 = true := blkChk_join _ _ _ _ _ 3870 5 1 h4 okB3875
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 7 = true := blkChk_join _ _ _ _ _ 3870 6 1 h5 okB3876
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 8 = true := blkChk_join _ _ _ _ _ 3870 7 1 h6 okB3877
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 9 = true := blkChk_join _ _ _ _ _ 3870 8 1 h7 okB3878
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 10 = true := blkChk_join _ _ _ _ _ 3870 9 1 h8 okB3879
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3870 11 = true := blkChk_join _ _ _ _ _ 3870 10 1 h9 okB3880
  exact h10
end E1.C213X
