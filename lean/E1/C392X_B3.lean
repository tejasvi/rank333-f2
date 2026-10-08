module
public import R22Port.U_d41d8cd98f00
public import E1.C392X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C392X
open E1S
theorem okB36 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 1 = true := by decide +kernel
theorem okB37 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 37 1 = true := by decide +kernel
theorem okB38 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 38 1 = true := by decide +kernel
theorem okB39 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 39 1 = true := by decide +kernel
theorem okB40 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 40 1 = true := by decide +kernel
theorem okB41 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 41 1 = true := by decide +kernel
theorem okB42 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 42 1 = true := by decide +kernel
theorem okB43 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 43 1 = true := by decide +kernel
theorem okB44 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 44 1 = true := by decide +kernel
theorem okB45 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 45 1 = true := by decide +kernel
theorem okB46 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 46 1 = true := by decide +kernel
theorem okB47 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 47 1 = true := by decide +kernel
theorem okB48 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 48 1 = true := by decide +kernel
theorem okG3 : glueChkR lits W 36 13 = true := by decide +kernel
theorem okM3 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 13 = true := by
  have h0 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 1 = true := okB36
  have h1 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 2 = true := blkChk_join _ _ _ _ _ 36 1 1 h0 okB37
  have h2 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 3 = true := blkChk_join _ _ _ _ _ 36 2 1 h1 okB38
  have h3 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 4 = true := blkChk_join _ _ _ _ _ 36 3 1 h2 okB39
  have h4 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 5 = true := blkChk_join _ _ _ _ _ 36 4 1 h3 okB40
  have h5 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 6 = true := blkChk_join _ _ _ _ _ 36 5 1 h4 okB41
  have h6 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 7 = true := blkChk_join _ _ _ _ _ 36 6 1 h5 okB42
  have h7 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 8 = true := blkChk_join _ _ _ _ _ 36 7 1 h6 okB43
  have h8 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 9 = true := blkChk_join _ _ _ _ _ 36 8 1 h7 okB44
  have h9 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 10 = true := blkChk_join _ _ _ _ _ 36 9 1 h8 okB45
  have h10 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 11 = true := blkChk_join _ _ _ _ _ 36 10 1 h9 okB46
  have h11 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 12 = true := blkChk_join _ _ _ _ _ 36 11 1 h10 okB47
  have h12 : blkChk E1.IP_e392.C E1.SL_e392.entry E1.IP_e392.UB E1.IP_e392.UBR lits 36 13 = true := blkChk_join _ _ _ _ _ 36 12 1 h11 okB48
  exact h12
end E1.C392X
