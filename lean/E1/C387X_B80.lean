module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB865 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 1 = true := by decide +kernel
theorem okB866 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 866 1 = true := by decide +kernel
theorem okB867 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 867 1 = true := by decide +kernel
theorem okB868 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 868 1 = true := by decide +kernel
theorem okB869 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 869 1 = true := by decide +kernel
theorem okB870 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 870 1 = true := by decide +kernel
theorem okB871 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 871 1 = true := by decide +kernel
theorem okB872 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 872 1 = true := by decide +kernel
theorem okB873 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 873 1 = true := by decide +kernel
theorem okB874 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 874 1 = true := by decide +kernel
theorem okB875 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 875 1 = true := by decide +kernel
theorem okG80 : glueChkR lits W 865 11 = true := by decide +kernel
theorem okM80 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 11 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 1 = true := okB865
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 2 = true := blkChk_join _ _ _ _ _ 865 1 1 h0 okB866
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 3 = true := blkChk_join _ _ _ _ _ 865 2 1 h1 okB867
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 4 = true := blkChk_join _ _ _ _ _ 865 3 1 h2 okB868
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 5 = true := blkChk_join _ _ _ _ _ 865 4 1 h3 okB869
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 6 = true := blkChk_join _ _ _ _ _ 865 5 1 h4 okB870
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 7 = true := blkChk_join _ _ _ _ _ 865 6 1 h5 okB871
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 8 = true := blkChk_join _ _ _ _ _ 865 7 1 h6 okB872
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 9 = true := blkChk_join _ _ _ _ _ 865 8 1 h7 okB873
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 10 = true := blkChk_join _ _ _ _ _ 865 9 1 h8 okB874
  have h10 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 865 11 = true := blkChk_join _ _ _ _ _ 865 10 1 h9 okB875
  exact h10
end E1.C387X
