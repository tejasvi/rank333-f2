module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB3960 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 1 = true := by decide +kernel
theorem okB3961 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3961 1 = true := by decide +kernel
theorem okB3962 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3962 1 = true := by decide +kernel
theorem okB3963 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3963 1 = true := by decide +kernel
theorem okB3964 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3964 1 = true := by decide +kernel
theorem okB3965 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3965 1 = true := by decide +kernel
theorem okB3966 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3966 1 = true := by decide +kernel
theorem okB3967 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3967 1 = true := by decide +kernel
theorem okG381 : glueChkR lits W 3960 8 = true := by decide +kernel
theorem okM381 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 8 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 1 = true := okB3960
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 2 = true := blkChk_join _ _ _ _ _ 3960 1 1 h0 okB3961
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 3 = true := blkChk_join _ _ _ _ _ 3960 2 1 h1 okB3962
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 4 = true := blkChk_join _ _ _ _ _ 3960 3 1 h2 okB3963
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 5 = true := blkChk_join _ _ _ _ _ 3960 4 1 h3 okB3964
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 6 = true := blkChk_join _ _ _ _ _ 3960 5 1 h4 okB3965
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 7 = true := blkChk_join _ _ _ _ _ 3960 6 1 h5 okB3966
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3960 8 = true := blkChk_join _ _ _ _ _ 3960 7 1 h6 okB3967
  exact h7
end E1.C394X
