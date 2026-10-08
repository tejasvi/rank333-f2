module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5047 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 1 = true := by decide +kernel
theorem okB5048 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5048 1 = true := by decide +kernel
theorem okB5049 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5049 1 = true := by decide +kernel
theorem okB5050 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5050 1 = true := by decide +kernel
theorem okB5051 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5051 1 = true := by decide +kernel
theorem okB5052 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5052 1 = true := by decide +kernel
theorem okB5053 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5053 1 = true := by decide +kernel
theorem okB5054 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5054 1 = true := by decide +kernel
theorem okB5055 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5055 1 = true := by decide +kernel
theorem okB5056 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5056 1 = true := by decide +kernel
theorem okB5057 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5057 1 = true := by decide +kernel
theorem okG483 : glueChkR lits W 5047 11 = true := by decide +kernel
theorem okM483 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 1 = true := okB5047
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 2 = true := blkChk_join _ _ _ _ _ 5047 1 1 h0 okB5048
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 3 = true := blkChk_join _ _ _ _ _ 5047 2 1 h1 okB5049
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 4 = true := blkChk_join _ _ _ _ _ 5047 3 1 h2 okB5050
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 5 = true := blkChk_join _ _ _ _ _ 5047 4 1 h3 okB5051
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 6 = true := blkChk_join _ _ _ _ _ 5047 5 1 h4 okB5052
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 7 = true := blkChk_join _ _ _ _ _ 5047 6 1 h5 okB5053
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 8 = true := blkChk_join _ _ _ _ _ 5047 7 1 h6 okB5054
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 9 = true := blkChk_join _ _ _ _ _ 5047 8 1 h7 okB5055
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 10 = true := blkChk_join _ _ _ _ _ 5047 9 1 h8 okB5056
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5047 11 = true := blkChk_join _ _ _ _ _ 5047 10 1 h9 okB5057
  exact h10
end E1.C384X
