module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB252 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 1 = true := by decide +kernel
theorem okB253 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 253 1 = true := by decide +kernel
theorem okB254 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 254 1 = true := by decide +kernel
theorem okB255 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 255 1 = true := by decide +kernel
theorem okB256 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 256 1 = true := by decide +kernel
theorem okB257 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 257 1 = true := by decide +kernel
theorem okB258 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 258 1 = true := by decide +kernel
theorem okB259 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 259 1 = true := by decide +kernel
theorem okB260 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 260 1 = true := by decide +kernel
theorem okG23 : glueChkR lits W 252 9 = true := by decide +kernel
theorem okM23 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 9 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 1 = true := okB252
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 2 = true := blkChk_join _ _ _ _ _ 252 1 1 h0 okB253
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 3 = true := blkChk_join _ _ _ _ _ 252 2 1 h1 okB254
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 4 = true := blkChk_join _ _ _ _ _ 252 3 1 h2 okB255
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 5 = true := blkChk_join _ _ _ _ _ 252 4 1 h3 okB256
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 6 = true := blkChk_join _ _ _ _ _ 252 5 1 h4 okB257
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 7 = true := blkChk_join _ _ _ _ _ 252 6 1 h5 okB258
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 8 = true := blkChk_join _ _ _ _ _ 252 7 1 h6 okB259
  have h8 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 252 9 = true := blkChk_join _ _ _ _ _ 252 8 1 h7 okB260
  exact h8
end E1.C382X
