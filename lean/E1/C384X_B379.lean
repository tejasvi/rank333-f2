module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3951 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 1 = true := by decide +kernel
theorem okB3952 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3952 1 = true := by decide +kernel
theorem okB3953 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3953 1 = true := by decide +kernel
theorem okB3954 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3954 1 = true := by decide +kernel
theorem okB3955 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3955 1 = true := by decide +kernel
theorem okB3956 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3956 1 = true := by decide +kernel
theorem okB3957 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3957 1 = true := by decide +kernel
theorem okB3958 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3958 1 = true := by decide +kernel
theorem okB3959 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3959 1 = true := by decide +kernel
theorem okB3960 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3960 1 = true := by decide +kernel
theorem okG379 : glueChkR lits W 3951 10 = true := by decide +kernel
theorem okM379 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 1 = true := okB3951
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 2 = true := blkChk_join _ _ _ _ _ 3951 1 1 h0 okB3952
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 3 = true := blkChk_join _ _ _ _ _ 3951 2 1 h1 okB3953
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 4 = true := blkChk_join _ _ _ _ _ 3951 3 1 h2 okB3954
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 5 = true := blkChk_join _ _ _ _ _ 3951 4 1 h3 okB3955
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 6 = true := blkChk_join _ _ _ _ _ 3951 5 1 h4 okB3956
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 7 = true := blkChk_join _ _ _ _ _ 3951 6 1 h5 okB3957
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 8 = true := blkChk_join _ _ _ _ _ 3951 7 1 h6 okB3958
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 9 = true := blkChk_join _ _ _ _ _ 3951 8 1 h7 okB3959
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3951 10 = true := blkChk_join _ _ _ _ _ 3951 9 1 h8 okB3960
  exact h9
end E1.C384X
