module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB904 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 1 = true := by decide +kernel
theorem okB905 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 905 1 = true := by decide +kernel
theorem okB906 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 906 1 = true := by decide +kernel
theorem okB907 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 907 1 = true := by decide +kernel
theorem okB908 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 908 1 = true := by decide +kernel
theorem okB909 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 909 1 = true := by decide +kernel
theorem okB910 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 910 1 = true := by decide +kernel
theorem okB911 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 911 1 = true := by decide +kernel
theorem okB912 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 912 1 = true := by decide +kernel
theorem okB913 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 913 1 = true := by decide +kernel
theorem okG82 : glueChkR lits W 904 10 = true := by decide +kernel
theorem okM82 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 10 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 1 = true := okB904
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 2 = true := blkChk_join _ _ _ _ _ 904 1 1 h0 okB905
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 3 = true := blkChk_join _ _ _ _ _ 904 2 1 h1 okB906
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 4 = true := blkChk_join _ _ _ _ _ 904 3 1 h2 okB907
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 5 = true := blkChk_join _ _ _ _ _ 904 4 1 h3 okB908
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 6 = true := blkChk_join _ _ _ _ _ 904 5 1 h4 okB909
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 7 = true := blkChk_join _ _ _ _ _ 904 6 1 h5 okB910
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 8 = true := blkChk_join _ _ _ _ _ 904 7 1 h6 okB911
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 9 = true := blkChk_join _ _ _ _ _ 904 8 1 h7 okB912
  have h9 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 904 10 = true := blkChk_join _ _ _ _ _ 904 9 1 h8 okB913
  exact h9
end E1.C382X
