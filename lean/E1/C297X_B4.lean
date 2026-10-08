module
public import R22Port.U_d41d8cd98f00
public import E1.C297X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C297X
open E1S
theorem okB38 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 1 = true := by decide +kernel
theorem okB39 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 39 1 = true := by decide +kernel
theorem okB40 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 40 1 = true := by decide +kernel
theorem okB41 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 41 1 = true := by decide +kernel
theorem okB42 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 42 1 = true := by decide +kernel
theorem okB43 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 43 1 = true := by decide +kernel
theorem okB44 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 44 1 = true := by decide +kernel
theorem okB45 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 45 1 = true := by decide +kernel
theorem okB46 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 46 1 = true := by decide +kernel
theorem okB47 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 47 1 = true := by decide +kernel
theorem okG4 : glueChkR lits W 38 10 = true := by decide +kernel
theorem okM4 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 10 = true := by
  have h0 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 1 = true := okB38
  have h1 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 2 = true := blkChk_join _ _ _ _ _ 38 1 1 h0 okB39
  have h2 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 3 = true := blkChk_join _ _ _ _ _ 38 2 1 h1 okB40
  have h3 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 4 = true := blkChk_join _ _ _ _ _ 38 3 1 h2 okB41
  have h4 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 5 = true := blkChk_join _ _ _ _ _ 38 4 1 h3 okB42
  have h5 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 6 = true := blkChk_join _ _ _ _ _ 38 5 1 h4 okB43
  have h6 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 7 = true := blkChk_join _ _ _ _ _ 38 6 1 h5 okB44
  have h7 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 8 = true := blkChk_join _ _ _ _ _ 38 7 1 h6 okB45
  have h8 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 9 = true := blkChk_join _ _ _ _ _ 38 8 1 h7 okB46
  have h9 : blkChk E1.IP_e297.C E1.SL_e297.entry E1.IP_e297.UB E1.IP_e297.UBR lits 38 10 = true := blkChk_join _ _ _ _ _ 38 9 1 h8 okB47
  exact h9
end E1.C297X
