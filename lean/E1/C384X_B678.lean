module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6935 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 1 = true := by decide +kernel
theorem okB6936 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6936 1 = true := by decide +kernel
theorem okB6937 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6937 1 = true := by decide +kernel
theorem okB6938 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6938 1 = true := by decide +kernel
theorem okB6939 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6939 1 = true := by decide +kernel
theorem okB6940 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6940 1 = true := by decide +kernel
theorem okB6941 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6941 1 = true := by decide +kernel
theorem okB6942 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6942 1 = true := by decide +kernel
theorem okB6943 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6943 1 = true := by decide +kernel
theorem okB6944 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6944 1 = true := by decide +kernel
theorem okG678 : glueChkR lits W 6935 10 = true := by decide +kernel
theorem okM678 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 1 = true := okB6935
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 2 = true := blkChk_join _ _ _ _ _ 6935 1 1 h0 okB6936
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 3 = true := blkChk_join _ _ _ _ _ 6935 2 1 h1 okB6937
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 4 = true := blkChk_join _ _ _ _ _ 6935 3 1 h2 okB6938
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 5 = true := blkChk_join _ _ _ _ _ 6935 4 1 h3 okB6939
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 6 = true := blkChk_join _ _ _ _ _ 6935 5 1 h4 okB6940
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 7 = true := blkChk_join _ _ _ _ _ 6935 6 1 h5 okB6941
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 8 = true := blkChk_join _ _ _ _ _ 6935 7 1 h6 okB6942
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 9 = true := blkChk_join _ _ _ _ _ 6935 8 1 h7 okB6943
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6935 10 = true := blkChk_join _ _ _ _ _ 6935 9 1 h8 okB6944
  exact h9
end E1.C384X
