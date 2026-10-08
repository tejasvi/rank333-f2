module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB3952 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 1 = true := by decide +kernel
theorem okB3953 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3953 1 = true := by decide +kernel
theorem okB3954 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3954 1 = true := by decide +kernel
theorem okB3955 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3955 1 = true := by decide +kernel
theorem okB3956 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3956 1 = true := by decide +kernel
theorem okB3957 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3957 1 = true := by decide +kernel
theorem okB3958 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3958 1 = true := by decide +kernel
theorem okB3959 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3959 1 = true := by decide +kernel
theorem okG380 : glueChkR lits W 3952 8 = true := by decide +kernel
theorem okM380 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 8 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 1 = true := okB3952
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 2 = true := blkChk_join _ _ _ _ _ 3952 1 1 h0 okB3953
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 3 = true := blkChk_join _ _ _ _ _ 3952 2 1 h1 okB3954
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 4 = true := blkChk_join _ _ _ _ _ 3952 3 1 h2 okB3955
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 5 = true := blkChk_join _ _ _ _ _ 3952 4 1 h3 okB3956
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 6 = true := blkChk_join _ _ _ _ _ 3952 5 1 h4 okB3957
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 7 = true := blkChk_join _ _ _ _ _ 3952 6 1 h5 okB3958
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3952 8 = true := blkChk_join _ _ _ _ _ 3952 7 1 h6 okB3959
  exact h7
end E1.C394X
