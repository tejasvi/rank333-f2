module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB900 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 1 = true := by decide +kernel
theorem okB901 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 901 1 = true := by decide +kernel
theorem okB902 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 902 1 = true := by decide +kernel
theorem okB903 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 903 1 = true := by decide +kernel
theorem okB904 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 904 1 = true := by decide +kernel
theorem okB905 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 905 1 = true := by decide +kernel
theorem okB906 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 906 1 = true := by decide +kernel
theorem okB907 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 907 1 = true := by decide +kernel
theorem okB908 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 908 1 = true := by decide +kernel
theorem okB909 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 909 1 = true := by decide +kernel
theorem okG86 : glueChkR lits W 900 10 = true := by decide +kernel
theorem okM86 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 1 = true := okB900
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 2 = true := blkChk_join _ _ _ _ _ 900 1 1 h0 okB901
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 3 = true := blkChk_join _ _ _ _ _ 900 2 1 h1 okB902
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 4 = true := blkChk_join _ _ _ _ _ 900 3 1 h2 okB903
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 5 = true := blkChk_join _ _ _ _ _ 900 4 1 h3 okB904
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 6 = true := blkChk_join _ _ _ _ _ 900 5 1 h4 okB905
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 7 = true := blkChk_join _ _ _ _ _ 900 6 1 h5 okB906
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 8 = true := blkChk_join _ _ _ _ _ 900 7 1 h6 okB907
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 9 = true := blkChk_join _ _ _ _ _ 900 8 1 h7 okB908
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 900 10 = true := blkChk_join _ _ _ _ _ 900 9 1 h8 okB909
  exact h9
end E1.C384X
