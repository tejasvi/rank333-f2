module
public import R22Port.U_d41d8cd98f00
public import E1.C394X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C394X
open E1S
theorem okB3968 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 1 = true := by decide +kernel
theorem okB3969 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3969 1 = true := by decide +kernel
theorem okB3970 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3970 1 = true := by decide +kernel
theorem okB3971 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3971 1 = true := by decide +kernel
theorem okB3972 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3972 1 = true := by decide +kernel
theorem okB3973 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3973 1 = true := by decide +kernel
theorem okB3974 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3974 1 = true := by decide +kernel
theorem okB3975 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3975 1 = true := by decide +kernel
theorem okG382 : glueChkR lits W 3968 8 = true := by decide +kernel
theorem okM382 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 8 = true := by
  have h0 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 1 = true := okB3968
  have h1 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 2 = true := blkChk_join _ _ _ _ _ 3968 1 1 h0 okB3969
  have h2 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 3 = true := blkChk_join _ _ _ _ _ 3968 2 1 h1 okB3970
  have h3 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 4 = true := blkChk_join _ _ _ _ _ 3968 3 1 h2 okB3971
  have h4 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 5 = true := blkChk_join _ _ _ _ _ 3968 4 1 h3 okB3972
  have h5 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 6 = true := blkChk_join _ _ _ _ _ 3968 5 1 h4 okB3973
  have h6 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 7 = true := blkChk_join _ _ _ _ _ 3968 6 1 h5 okB3974
  have h7 : blkChk E1.IP_e394.C E1.SL_e394.entry E1.IP_e394.UB E1.IP_e394.UBR lits 3968 8 = true := blkChk_join _ _ _ _ _ 3968 7 1 h6 okB3975
  exact h7
end E1.C394X
