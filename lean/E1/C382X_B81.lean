module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB896 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 1 = true := by decide +kernel
theorem okB897 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 897 1 = true := by decide +kernel
theorem okB898 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 898 1 = true := by decide +kernel
theorem okB899 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 899 1 = true := by decide +kernel
theorem okB900 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 900 1 = true := by decide +kernel
theorem okB901 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 901 1 = true := by decide +kernel
theorem okB902 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 902 1 = true := by decide +kernel
theorem okB903 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 903 1 = true := by decide +kernel
theorem okG81 : glueChkR lits W 896 8 = true := by decide +kernel
theorem okM81 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 1 = true := okB896
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 2 = true := blkChk_join _ _ _ _ _ 896 1 1 h0 okB897
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 3 = true := blkChk_join _ _ _ _ _ 896 2 1 h1 okB898
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 4 = true := blkChk_join _ _ _ _ _ 896 3 1 h2 okB899
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 5 = true := blkChk_join _ _ _ _ _ 896 4 1 h3 okB900
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 6 = true := blkChk_join _ _ _ _ _ 896 5 1 h4 okB901
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 7 = true := blkChk_join _ _ _ _ _ 896 6 1 h5 okB902
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 896 8 = true := blkChk_join _ _ _ _ _ 896 7 1 h6 okB903
  exact h7
end E1.C382X
