module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB305 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 1 = true := by decide +kernel
theorem okB306 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 306 1 = true := by decide +kernel
theorem okB307 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 307 1 = true := by decide +kernel
theorem okB308 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 308 1 = true := by decide +kernel
theorem okB309 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 309 1 = true := by decide +kernel
theorem okB310 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 310 1 = true := by decide +kernel
theorem okB311 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 311 1 = true := by decide +kernel
theorem okB312 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 312 1 = true := by decide +kernel
theorem okG30 : glueChkR lits W 305 8 = true := by decide +kernel
theorem okM30 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 1 = true := okB305
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 2 = true := blkChk_join _ _ _ _ _ 305 1 1 h0 okB306
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 3 = true := blkChk_join _ _ _ _ _ 305 2 1 h1 okB307
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 4 = true := blkChk_join _ _ _ _ _ 305 3 1 h2 okB308
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 5 = true := blkChk_join _ _ _ _ _ 305 4 1 h3 okB309
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 6 = true := blkChk_join _ _ _ _ _ 305 5 1 h4 okB310
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 7 = true := blkChk_join _ _ _ _ _ 305 6 1 h5 okB311
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 305 8 = true := blkChk_join _ _ _ _ _ 305 7 1 h6 okB312
  exact h7
end E1.C384X
