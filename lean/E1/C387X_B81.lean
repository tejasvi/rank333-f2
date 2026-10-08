module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB876 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 1 = true := by decide +kernel
theorem okB877 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 877 1 = true := by decide +kernel
theorem okB878 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 878 1 = true := by decide +kernel
theorem okB879 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 879 1 = true := by decide +kernel
theorem okB880 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 880 1 = true := by decide +kernel
theorem okB881 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 881 1 = true := by decide +kernel
theorem okB882 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 882 1 = true := by decide +kernel
theorem okB883 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 883 1 = true := by decide +kernel
theorem okB884 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 884 1 = true := by decide +kernel
theorem okB885 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 885 1 = true := by decide +kernel
theorem okG81 : glueChkR lits W 876 10 = true := by decide +kernel
theorem okM81 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 1 = true := okB876
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 2 = true := blkChk_join _ _ _ _ _ 876 1 1 h0 okB877
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 3 = true := blkChk_join _ _ _ _ _ 876 2 1 h1 okB878
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 4 = true := blkChk_join _ _ _ _ _ 876 3 1 h2 okB879
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 5 = true := blkChk_join _ _ _ _ _ 876 4 1 h3 okB880
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 6 = true := blkChk_join _ _ _ _ _ 876 5 1 h4 okB881
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 7 = true := blkChk_join _ _ _ _ _ 876 6 1 h5 okB882
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 8 = true := blkChk_join _ _ _ _ _ 876 7 1 h6 okB883
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 9 = true := blkChk_join _ _ _ _ _ 876 8 1 h7 okB884
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 876 10 = true := blkChk_join _ _ _ _ _ 876 9 1 h8 okB885
  exact h9
end E1.C387X
