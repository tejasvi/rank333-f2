module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6838 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 1 = true := by decide +kernel
theorem okB6839 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6839 1 = true := by decide +kernel
theorem okB6840 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6840 1 = true := by decide +kernel
theorem okB6841 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6841 1 = true := by decide +kernel
theorem okB6842 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6842 1 = true := by decide +kernel
theorem okB6843 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6843 1 = true := by decide +kernel
theorem okB6844 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6844 1 = true := by decide +kernel
theorem okB6845 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6845 1 = true := by decide +kernel
theorem okB6846 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6846 1 = true := by decide +kernel
theorem okG667 : glueChkR lits W 6838 9 = true := by decide +kernel
theorem okM667 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 1 = true := okB6838
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 2 = true := blkChk_join _ _ _ _ _ 6838 1 1 h0 okB6839
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 3 = true := blkChk_join _ _ _ _ _ 6838 2 1 h1 okB6840
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 4 = true := blkChk_join _ _ _ _ _ 6838 3 1 h2 okB6841
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 5 = true := blkChk_join _ _ _ _ _ 6838 4 1 h3 okB6842
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 6 = true := blkChk_join _ _ _ _ _ 6838 5 1 h4 okB6843
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 7 = true := blkChk_join _ _ _ _ _ 6838 6 1 h5 okB6844
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 8 = true := blkChk_join _ _ _ _ _ 6838 7 1 h6 okB6845
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6838 9 = true := blkChk_join _ _ _ _ _ 6838 8 1 h7 okB6846
  exact h8
end E1.C384X
