module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB940 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 1 = true := by decide +kernel
theorem okB941 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 941 1 = true := by decide +kernel
theorem okB942 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 942 1 = true := by decide +kernel
theorem okB943 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 943 1 = true := by decide +kernel
theorem okB944 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 944 1 = true := by decide +kernel
theorem okB945 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 945 1 = true := by decide +kernel
theorem okB946 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 946 1 = true := by decide +kernel
theorem okB947 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 947 1 = true := by decide +kernel
theorem okB948 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 948 1 = true := by decide +kernel
theorem okB949 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 949 1 = true := by decide +kernel
theorem okG95 : glueChkR lits W 940 10 = true := by decide +kernel
theorem okM95 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 10 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 1 = true := okB940
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 2 = true := blkChk_join _ _ _ _ _ 940 1 1 h0 okB941
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 3 = true := blkChk_join _ _ _ _ _ 940 2 1 h1 okB942
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 4 = true := blkChk_join _ _ _ _ _ 940 3 1 h2 okB943
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 5 = true := blkChk_join _ _ _ _ _ 940 4 1 h3 okB944
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 6 = true := blkChk_join _ _ _ _ _ 940 5 1 h4 okB945
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 7 = true := blkChk_join _ _ _ _ _ 940 6 1 h5 okB946
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 8 = true := blkChk_join _ _ _ _ _ 940 7 1 h6 okB947
  have h8 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 9 = true := blkChk_join _ _ _ _ _ 940 8 1 h7 okB948
  have h9 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 940 10 = true := blkChk_join _ _ _ _ _ 940 9 1 h8 okB949
  exact h9
end E1.C394X
