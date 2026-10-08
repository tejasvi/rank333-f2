module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB321 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 1 = true := by decide +kernel
theorem okB322 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 322 1 = true := by decide +kernel
theorem okB323 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 323 1 = true := by decide +kernel
theorem okB324 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 324 1 = true := by decide +kernel
theorem okB325 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 325 1 = true := by decide +kernel
theorem okB326 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 326 1 = true := by decide +kernel
theorem okB327 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 327 1 = true := by decide +kernel
theorem okB328 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 328 1 = true := by decide +kernel
theorem okB329 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 329 1 = true := by decide +kernel
theorem okB330 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 330 1 = true := by decide +kernel
theorem okG32 : glueChkR lits W 321 10 = true := by decide +kernel
theorem okM32 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 1 = true := okB321
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 2 = true := blkChk_join _ _ _ _ _ 321 1 1 h0 okB322
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 3 = true := blkChk_join _ _ _ _ _ 321 2 1 h1 okB323
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 4 = true := blkChk_join _ _ _ _ _ 321 3 1 h2 okB324
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 5 = true := blkChk_join _ _ _ _ _ 321 4 1 h3 okB325
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 6 = true := blkChk_join _ _ _ _ _ 321 5 1 h4 okB326
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 7 = true := blkChk_join _ _ _ _ _ 321 6 1 h5 okB327
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 8 = true := blkChk_join _ _ _ _ _ 321 7 1 h6 okB328
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 9 = true := blkChk_join _ _ _ _ _ 321 8 1 h7 okB329
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 321 10 = true := blkChk_join _ _ _ _ _ 321 9 1 h8 okB330
  exact h9
end E1.C384X
