module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3961 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 1 = true := by decide +kernel
theorem okB3962 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3962 1 = true := by decide +kernel
theorem okB3963 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3963 1 = true := by decide +kernel
theorem okB3964 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3964 1 = true := by decide +kernel
theorem okB3965 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3965 1 = true := by decide +kernel
theorem okB3966 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3966 1 = true := by decide +kernel
theorem okB3967 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3967 1 = true := by decide +kernel
theorem okB3968 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3968 1 = true := by decide +kernel
theorem okB3969 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3969 1 = true := by decide +kernel
theorem okB3970 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3970 1 = true := by decide +kernel
theorem okB3971 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3971 1 = true := by decide +kernel
theorem okB3972 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3972 1 = true := by decide +kernel
theorem okB3973 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3973 1 = true := by decide +kernel
theorem okB3974 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3974 1 = true := by decide +kernel
theorem okB3975 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3975 1 = true := by decide +kernel
theorem okB3976 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3976 1 = true := by decide +kernel
theorem okG380 : glueChkR lits W 3961 16 = true := by decide +kernel
theorem okM380 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 16 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 1 = true := okB3961
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 2 = true := blkChk_join _ _ _ _ _ 3961 1 1 h0 okB3962
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 3 = true := blkChk_join _ _ _ _ _ 3961 2 1 h1 okB3963
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 4 = true := blkChk_join _ _ _ _ _ 3961 3 1 h2 okB3964
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 5 = true := blkChk_join _ _ _ _ _ 3961 4 1 h3 okB3965
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 6 = true := blkChk_join _ _ _ _ _ 3961 5 1 h4 okB3966
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 7 = true := blkChk_join _ _ _ _ _ 3961 6 1 h5 okB3967
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 8 = true := blkChk_join _ _ _ _ _ 3961 7 1 h6 okB3968
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 9 = true := blkChk_join _ _ _ _ _ 3961 8 1 h7 okB3969
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 10 = true := blkChk_join _ _ _ _ _ 3961 9 1 h8 okB3970
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 11 = true := blkChk_join _ _ _ _ _ 3961 10 1 h9 okB3971
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 12 = true := blkChk_join _ _ _ _ _ 3961 11 1 h10 okB3972
  have h12 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 13 = true := blkChk_join _ _ _ _ _ 3961 12 1 h11 okB3973
  have h13 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 14 = true := blkChk_join _ _ _ _ _ 3961 13 1 h12 okB3974
  have h14 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 15 = true := blkChk_join _ _ _ _ _ 3961 14 1 h13 okB3975
  have h15 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3961 16 = true := blkChk_join _ _ _ _ _ 3961 15 1 h14 okB3976
  exact h15
end E1.C384X
