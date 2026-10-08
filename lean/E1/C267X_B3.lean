module
public import R22Port.U_d41d8cd98f00
public import E1.C267X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C267X
open E1S
theorem okB41 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 1 = true := by decide +kernel
theorem okB42 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 42 1 = true := by decide +kernel
theorem okB43 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 43 1 = true := by decide +kernel
theorem okB44 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 44 1 = true := by decide +kernel
theorem okB45 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 45 1 = true := by decide +kernel
theorem okB46 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 46 1 = true := by decide +kernel
theorem okB47 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 47 1 = true := by decide +kernel
theorem okB48 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 48 1 = true := by decide +kernel
theorem okB49 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 49 1 = true := by decide +kernel
theorem okG3 : glueChkR lits W 41 9 = true := by decide +kernel
theorem okM3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 9 = true := by
  have h0 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 1 = true := okB41
  have h1 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 2 = true := blkChk_join _ _ _ _ _ 41 1 1 h0 okB42
  have h2 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 3 = true := blkChk_join _ _ _ _ _ 41 2 1 h1 okB43
  have h3 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 4 = true := blkChk_join _ _ _ _ _ 41 3 1 h2 okB44
  have h4 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 5 = true := blkChk_join _ _ _ _ _ 41 4 1 h3 okB45
  have h5 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 6 = true := blkChk_join _ _ _ _ _ 41 5 1 h4 okB46
  have h6 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 7 = true := blkChk_join _ _ _ _ _ 41 6 1 h5 okB47
  have h7 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 8 = true := blkChk_join _ _ _ _ _ 41 7 1 h6 okB48
  have h8 : blkChk E1.IP_e267.C E1.SL_e267.entry E1.IP_e267.UB E1.IP_e267.UBR lits 41 9 = true := blkChk_join _ _ _ _ _ 41 8 1 h7 okB49
  exact h8
end E1.C267X
