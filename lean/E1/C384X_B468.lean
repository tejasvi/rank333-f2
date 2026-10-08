module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4881 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 1 = true := by decide +kernel
theorem okB4882 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4882 1 = true := by decide +kernel
theorem okB4883 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4883 1 = true := by decide +kernel
theorem okB4884 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4884 1 = true := by decide +kernel
theorem okB4885 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4885 1 = true := by decide +kernel
theorem okB4886 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4886 1 = true := by decide +kernel
theorem okB4887 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4887 1 = true := by decide +kernel
theorem okB4888 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4888 1 = true := by decide +kernel
theorem okB4889 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4889 1 = true := by decide +kernel
theorem okG468 : glueChkR lits W 4881 9 = true := by decide +kernel
theorem okM468 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 1 = true := okB4881
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 2 = true := blkChk_join _ _ _ _ _ 4881 1 1 h0 okB4882
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 3 = true := blkChk_join _ _ _ _ _ 4881 2 1 h1 okB4883
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 4 = true := blkChk_join _ _ _ _ _ 4881 3 1 h2 okB4884
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 5 = true := blkChk_join _ _ _ _ _ 4881 4 1 h3 okB4885
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 6 = true := blkChk_join _ _ _ _ _ 4881 5 1 h4 okB4886
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 7 = true := blkChk_join _ _ _ _ _ 4881 6 1 h5 okB4887
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 8 = true := blkChk_join _ _ _ _ _ 4881 7 1 h6 okB4888
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4881 9 = true := blkChk_join _ _ _ _ _ 4881 8 1 h7 okB4889
  exact h8
end E1.C384X
