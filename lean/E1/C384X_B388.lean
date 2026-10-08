module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4050 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 1 = true := by decide +kernel
theorem okB4051 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4051 1 = true := by decide +kernel
theorem okB4052 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4052 1 = true := by decide +kernel
theorem okB4053 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4053 1 = true := by decide +kernel
theorem okB4054 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4054 1 = true := by decide +kernel
theorem okB4055 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4055 1 = true := by decide +kernel
theorem okB4056 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4056 1 = true := by decide +kernel
theorem okB4057 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4057 1 = true := by decide +kernel
theorem okB4058 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4058 1 = true := by decide +kernel
theorem okB4059 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4059 1 = true := by decide +kernel
theorem okG388 : glueChkR lits W 4050 10 = true := by decide +kernel
theorem okM388 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 1 = true := okB4050
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 2 = true := blkChk_join _ _ _ _ _ 4050 1 1 h0 okB4051
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 3 = true := blkChk_join _ _ _ _ _ 4050 2 1 h1 okB4052
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 4 = true := blkChk_join _ _ _ _ _ 4050 3 1 h2 okB4053
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 5 = true := blkChk_join _ _ _ _ _ 4050 4 1 h3 okB4054
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 6 = true := blkChk_join _ _ _ _ _ 4050 5 1 h4 okB4055
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 7 = true := blkChk_join _ _ _ _ _ 4050 6 1 h5 okB4056
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 8 = true := blkChk_join _ _ _ _ _ 4050 7 1 h6 okB4057
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 9 = true := blkChk_join _ _ _ _ _ 4050 8 1 h7 okB4058
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4050 10 = true := blkChk_join _ _ _ _ _ 4050 9 1 h8 okB4059
  exact h9
end E1.C384X
