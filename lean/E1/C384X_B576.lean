module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5979 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 1 = true := by decide +kernel
theorem okB5980 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5980 1 = true := by decide +kernel
theorem okB5981 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5981 1 = true := by decide +kernel
theorem okB5982 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5982 1 = true := by decide +kernel
theorem okB5983 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5983 1 = true := by decide +kernel
theorem okB5984 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5984 1 = true := by decide +kernel
theorem okB5985 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5985 1 = true := by decide +kernel
theorem okB5986 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5986 1 = true := by decide +kernel
theorem okB5987 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5987 1 = true := by decide +kernel
theorem okB5988 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5988 1 = true := by decide +kernel
theorem okG576 : glueChkR lits W 5979 10 = true := by decide +kernel
theorem okM576 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 1 = true := okB5979
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 2 = true := blkChk_join _ _ _ _ _ 5979 1 1 h0 okB5980
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 3 = true := blkChk_join _ _ _ _ _ 5979 2 1 h1 okB5981
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 4 = true := blkChk_join _ _ _ _ _ 5979 3 1 h2 okB5982
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 5 = true := blkChk_join _ _ _ _ _ 5979 4 1 h3 okB5983
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 6 = true := blkChk_join _ _ _ _ _ 5979 5 1 h4 okB5984
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 7 = true := blkChk_join _ _ _ _ _ 5979 6 1 h5 okB5985
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 8 = true := blkChk_join _ _ _ _ _ 5979 7 1 h6 okB5986
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 9 = true := blkChk_join _ _ _ _ _ 5979 8 1 h7 okB5987
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5979 10 = true := blkChk_join _ _ _ _ _ 5979 9 1 h8 okB5988
  exact h9
end E1.C384X
