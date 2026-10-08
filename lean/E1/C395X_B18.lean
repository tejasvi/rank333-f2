module
public import R22Port.U_d41d8cd98f00
public import E1.C395X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C395X
open E1S
theorem okB203 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 1 = true := by decide +kernel
theorem okB204 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 204 1 = true := by decide +kernel
theorem okB205 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 205 1 = true := by decide +kernel
theorem okB206 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 206 1 = true := by decide +kernel
theorem okB207 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 207 1 = true := by decide +kernel
theorem okB208 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 208 1 = true := by decide +kernel
theorem okB209 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 209 1 = true := by decide +kernel
theorem okB210 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 210 1 = true := by decide +kernel
theorem okB211 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 211 1 = true := by decide +kernel
theorem okB212 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 212 1 = true := by decide +kernel
theorem okG18 : glueChkR lits W 203 10 = true := by decide +kernel
theorem okM18 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 10 = true := by
  have h0 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 1 = true := okB203
  have h1 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 2 = true := blkChk_join _ _ _ _ _ 203 1 1 h0 okB204
  have h2 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 3 = true := blkChk_join _ _ _ _ _ 203 2 1 h1 okB205
  have h3 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 4 = true := blkChk_join _ _ _ _ _ 203 3 1 h2 okB206
  have h4 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 5 = true := blkChk_join _ _ _ _ _ 203 4 1 h3 okB207
  have h5 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 6 = true := blkChk_join _ _ _ _ _ 203 5 1 h4 okB208
  have h6 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 7 = true := blkChk_join _ _ _ _ _ 203 6 1 h5 okB209
  have h7 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 8 = true := blkChk_join _ _ _ _ _ 203 7 1 h6 okB210
  have h8 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 9 = true := blkChk_join _ _ _ _ _ 203 8 1 h7 okB211
  have h9 : blkChk E1.IP_e395.C E1.SL_e395.entry E1.IP_e395.UB E1.IP_e395.UBR lits 203 10 = true := blkChk_join _ _ _ _ _ 203 9 1 h8 okB212
  exact h9
end E1.C395X
