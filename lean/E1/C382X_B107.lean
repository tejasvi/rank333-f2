module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1223 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 1 = true := by decide +kernel
theorem okB1224 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1224 1 = true := by decide +kernel
theorem okB1225 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1225 1 = true := by decide +kernel
theorem okB1226 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1226 1 = true := by decide +kernel
theorem okB1227 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1227 1 = true := by decide +kernel
theorem okB1228 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1228 1 = true := by decide +kernel
theorem okB1229 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1229 1 = true := by decide +kernel
theorem okG107 : glueChkR lits W 1223 7 = true := by decide +kernel
theorem okM107 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 7 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 1 = true := okB1223
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 2 = true := blkChk_join _ _ _ _ _ 1223 1 1 h0 okB1224
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 3 = true := blkChk_join _ _ _ _ _ 1223 2 1 h1 okB1225
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 4 = true := blkChk_join _ _ _ _ _ 1223 3 1 h2 okB1226
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 5 = true := blkChk_join _ _ _ _ _ 1223 4 1 h3 okB1227
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 6 = true := blkChk_join _ _ _ _ _ 1223 5 1 h4 okB1228
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1223 7 = true := blkChk_join _ _ _ _ _ 1223 6 1 h5 okB1229
  exact h6
end E1.C382X
