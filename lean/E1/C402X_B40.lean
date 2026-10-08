module
public import R22Port.U_d41d8cd98f00
public import E1.C402X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C402X
open E1S
theorem okB395 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 1 = true := by decide +kernel
theorem okB396 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 396 1 = true := by decide +kernel
theorem okB397 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 397 1 = true := by decide +kernel
theorem okB398 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 398 1 = true := by decide +kernel
theorem okB399 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 399 1 = true := by decide +kernel
theorem okB400 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 400 1 = true := by decide +kernel
theorem okB401 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 401 1 = true := by decide +kernel
theorem okB402 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 402 1 = true := by decide +kernel
theorem okG40 : glueChkR lits W 395 8 = true := by decide +kernel
theorem okM40 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 8 = true := by
  have h0 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 1 = true := okB395
  have h1 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 2 = true := blkChk_join _ _ _ _ _ 395 1 1 h0 okB396
  have h2 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 3 = true := blkChk_join _ _ _ _ _ 395 2 1 h1 okB397
  have h3 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 4 = true := blkChk_join _ _ _ _ _ 395 3 1 h2 okB398
  have h4 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 5 = true := blkChk_join _ _ _ _ _ 395 4 1 h3 okB399
  have h5 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 6 = true := blkChk_join _ _ _ _ _ 395 5 1 h4 okB400
  have h6 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 7 = true := blkChk_join _ _ _ _ _ 395 6 1 h5 okB401
  have h7 : blkChk E1.IP_e402.C E1.SL_e402.entry E1.IP_e402.UB E1.IP_e402.UBR lits 395 8 = true := blkChk_join _ _ _ _ _ 395 7 1 h6 okB402
  exact h7
end E1.C402X
