module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB870 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 1 = true := by decide +kernel
theorem okB871 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 871 1 = true := by decide +kernel
theorem okB872 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 872 1 = true := by decide +kernel
theorem okB873 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 873 1 = true := by decide +kernel
theorem okB874 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 874 1 = true := by decide +kernel
theorem okB875 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 875 1 = true := by decide +kernel
theorem okB876 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 876 1 = true := by decide +kernel
theorem okB877 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 877 1 = true := by decide +kernel
theorem okB878 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 878 1 = true := by decide +kernel
theorem okB879 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 879 1 = true := by decide +kernel
theorem okB880 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 880 1 = true := by decide +kernel
theorem okB881 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 881 1 = true := by decide +kernel
theorem okG74 : glueChkR lits W 870 12 = true := by decide +kernel
theorem okM74 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 12 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 1 = true := okB870
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 2 = true := blkChk_join _ _ _ _ _ 870 1 1 h0 okB871
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 3 = true := blkChk_join _ _ _ _ _ 870 2 1 h1 okB872
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 4 = true := blkChk_join _ _ _ _ _ 870 3 1 h2 okB873
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 5 = true := blkChk_join _ _ _ _ _ 870 4 1 h3 okB874
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 6 = true := blkChk_join _ _ _ _ _ 870 5 1 h4 okB875
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 7 = true := blkChk_join _ _ _ _ _ 870 6 1 h5 okB876
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 8 = true := blkChk_join _ _ _ _ _ 870 7 1 h6 okB877
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 9 = true := blkChk_join _ _ _ _ _ 870 8 1 h7 okB878
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 10 = true := blkChk_join _ _ _ _ _ 870 9 1 h8 okB879
  have h10 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 11 = true := blkChk_join _ _ _ _ _ 870 10 1 h9 okB880
  have h11 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 870 12 = true := blkChk_join _ _ _ _ _ 870 11 1 h10 okB881
  exact h11
end E1.C213X
