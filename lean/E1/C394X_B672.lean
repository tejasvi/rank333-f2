module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB7040 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 1 = true := by decide +kernel
theorem okB7041 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7041 1 = true := by decide +kernel
theorem okB7042 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7042 1 = true := by decide +kernel
theorem okB7043 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7043 1 = true := by decide +kernel
theorem okB7044 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7044 1 = true := by decide +kernel
theorem okB7045 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7045 1 = true := by decide +kernel
theorem okB7046 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7046 1 = true := by decide +kernel
theorem okB7047 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7047 1 = true := by decide +kernel
theorem okB7048 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7048 1 = true := by decide +kernel
theorem okB7049 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7049 1 = true := by decide +kernel
theorem okB7050 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7050 1 = true := by decide +kernel
theorem okG672 : glueChkR lits W 7040 11 = true := by decide +kernel
theorem okM672 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 11 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 1 = true := okB7040
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 2 = true := blkChk_join _ _ _ _ _ 7040 1 1 h0 okB7041
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 3 = true := blkChk_join _ _ _ _ _ 7040 2 1 h1 okB7042
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 4 = true := blkChk_join _ _ _ _ _ 7040 3 1 h2 okB7043
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 5 = true := blkChk_join _ _ _ _ _ 7040 4 1 h3 okB7044
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 6 = true := blkChk_join _ _ _ _ _ 7040 5 1 h4 okB7045
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 7 = true := blkChk_join _ _ _ _ _ 7040 6 1 h5 okB7046
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 8 = true := blkChk_join _ _ _ _ _ 7040 7 1 h6 okB7047
  have h8 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 9 = true := blkChk_join _ _ _ _ _ 7040 8 1 h7 okB7048
  have h9 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 10 = true := blkChk_join _ _ _ _ _ 7040 9 1 h8 okB7049
  have h10 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 7040 11 = true := blkChk_join _ _ _ _ _ 7040 10 1 h9 okB7050
  exact h10
end E1.C394X
