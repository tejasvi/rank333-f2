module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6395 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 1 = true := by decide +kernel
theorem okB6396 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6396 1 = true := by decide +kernel
theorem okB6397 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6397 1 = true := by decide +kernel
theorem okB6398 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6398 1 = true := by decide +kernel
theorem okB6399 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6399 1 = true := by decide +kernel
theorem okB6400 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6400 1 = true := by decide +kernel
theorem okB6401 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6401 1 = true := by decide +kernel
theorem okB6402 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6402 1 = true := by decide +kernel
theorem okB6403 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6403 1 = true := by decide +kernel
theorem okB6404 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6404 1 = true := by decide +kernel
theorem okG618 : glueChkR lits W 6395 10 = true := by decide +kernel
theorem okM618 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 1 = true := okB6395
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 2 = true := blkChk_join _ _ _ _ _ 6395 1 1 h0 okB6396
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 3 = true := blkChk_join _ _ _ _ _ 6395 2 1 h1 okB6397
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 4 = true := blkChk_join _ _ _ _ _ 6395 3 1 h2 okB6398
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 5 = true := blkChk_join _ _ _ _ _ 6395 4 1 h3 okB6399
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 6 = true := blkChk_join _ _ _ _ _ 6395 5 1 h4 okB6400
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 7 = true := blkChk_join _ _ _ _ _ 6395 6 1 h5 okB6401
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 8 = true := blkChk_join _ _ _ _ _ 6395 7 1 h6 okB6402
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 9 = true := blkChk_join _ _ _ _ _ 6395 8 1 h7 okB6403
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6395 10 = true := blkChk_join _ _ _ _ _ 6395 9 1 h8 okB6404
  exact h9
end E1.C384X
