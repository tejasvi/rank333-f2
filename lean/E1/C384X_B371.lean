module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3873 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 1 = true := by decide +kernel
theorem okB3874 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3874 1 = true := by decide +kernel
theorem okB3875 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3875 1 = true := by decide +kernel
theorem okB3876 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3876 1 = true := by decide +kernel
theorem okB3877 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3877 1 = true := by decide +kernel
theorem okB3878 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3878 1 = true := by decide +kernel
theorem okB3879 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3879 1 = true := by decide +kernel
theorem okB3880 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3880 1 = true := by decide +kernel
theorem okB3881 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3881 1 = true := by decide +kernel
theorem okB3882 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3882 1 = true := by decide +kernel
theorem okB3883 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3883 1 = true := by decide +kernel
theorem okG371 : glueChkR lits W 3873 11 = true := by decide +kernel
theorem okM371 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 1 = true := okB3873
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 2 = true := blkChk_join _ _ _ _ _ 3873 1 1 h0 okB3874
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 3 = true := blkChk_join _ _ _ _ _ 3873 2 1 h1 okB3875
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 4 = true := blkChk_join _ _ _ _ _ 3873 3 1 h2 okB3876
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 5 = true := blkChk_join _ _ _ _ _ 3873 4 1 h3 okB3877
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 6 = true := blkChk_join _ _ _ _ _ 3873 5 1 h4 okB3878
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 7 = true := blkChk_join _ _ _ _ _ 3873 6 1 h5 okB3879
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 8 = true := blkChk_join _ _ _ _ _ 3873 7 1 h6 okB3880
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 9 = true := blkChk_join _ _ _ _ _ 3873 8 1 h7 okB3881
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 10 = true := blkChk_join _ _ _ _ _ 3873 9 1 h8 okB3882
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3873 11 = true := blkChk_join _ _ _ _ _ 3873 10 1 h9 okB3883
  exact h10
end E1.C384X
