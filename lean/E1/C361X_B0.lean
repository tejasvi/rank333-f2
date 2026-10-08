module
public import R22Port.U_d41d8cd98f00
public import E1.C361X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C361X
open E1S
theorem okB0 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 1 = true := by decide +kernel
theorem okB1 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 1 1 = true := by decide +kernel
theorem okB2 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 2 1 = true := by decide +kernel
theorem okB3 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 3 1 = true := by decide +kernel
theorem okB4 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 4 1 = true := by decide +kernel
theorem okB5 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 5 1 = true := by decide +kernel
theorem okB6 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 6 1 = true := by decide +kernel
theorem okB7 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 7 1 = true := by decide +kernel
theorem okG0 : glueChkR lits W 0 8 = true := by decide +kernel
theorem okM0 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 8 = true := by
  have h0 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 1 = true := okB0
  have h1 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 2 = true := blkChk_join _ _ _ _ _ 0 1 1 h0 okB1
  have h2 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 3 = true := blkChk_join _ _ _ _ _ 0 2 1 h1 okB2
  have h3 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 4 = true := blkChk_join _ _ _ _ _ 0 3 1 h2 okB3
  have h4 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 5 = true := blkChk_join _ _ _ _ _ 0 4 1 h3 okB4
  have h5 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 6 = true := blkChk_join _ _ _ _ _ 0 5 1 h4 okB5
  have h6 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 7 = true := blkChk_join _ _ _ _ _ 0 6 1 h5 okB6
  have h7 : blkChk E1.IP_e361.C E1.SL_e361.entry E1.IP_e361.UB E1.IP_e361.UBR lits 0 8 = true := blkChk_join _ _ _ _ _ 0 7 1 h6 okB7
  exact h7
end E1.C361X
