module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6882 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 1 = true := by decide +kernel
theorem okB6883 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6883 1 = true := by decide +kernel
theorem okB6884 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6884 1 = true := by decide +kernel
theorem okB6885 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6885 1 = true := by decide +kernel
theorem okB6886 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6886 1 = true := by decide +kernel
theorem okB6887 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6887 1 = true := by decide +kernel
theorem okB6888 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6888 1 = true := by decide +kernel
theorem okB6889 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6889 1 = true := by decide +kernel
theorem okG672 : glueChkR lits W 6882 8 = true := by decide +kernel
theorem okM672 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 1 = true := okB6882
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 2 = true := blkChk_join _ _ _ _ _ 6882 1 1 h0 okB6883
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 3 = true := blkChk_join _ _ _ _ _ 6882 2 1 h1 okB6884
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 4 = true := blkChk_join _ _ _ _ _ 6882 3 1 h2 okB6885
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 5 = true := blkChk_join _ _ _ _ _ 6882 4 1 h3 okB6886
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 6 = true := blkChk_join _ _ _ _ _ 6882 5 1 h4 okB6887
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 7 = true := blkChk_join _ _ _ _ _ 6882 6 1 h5 okB6888
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6882 8 = true := blkChk_join _ _ _ _ _ 6882 7 1 h6 okB6889
  exact h7
end E1.C384X
