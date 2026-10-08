module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4063 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4064 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4064 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4065 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4065 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4066 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4066 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4067 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4067 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4068 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4068 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4069 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4069 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4070 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4070 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4071 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4071 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4072 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4072 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG396 : glueChkR lits W 4063 10 = true := by
  rw [← glueChkRN_eq lits W 8596 4063 lenT]; decide +kernel
theorem okM396 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 1 = true := okB4063
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 2 = true := blkChk_join _ _ _ _ _ 4063 1 1 h0 okB4064
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 3 = true := blkChk_join _ _ _ _ _ 4063 2 1 h1 okB4065
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 4 = true := blkChk_join _ _ _ _ _ 4063 3 1 h2 okB4066
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 5 = true := blkChk_join _ _ _ _ _ 4063 4 1 h3 okB4067
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 6 = true := blkChk_join _ _ _ _ _ 4063 5 1 h4 okB4068
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 7 = true := blkChk_join _ _ _ _ _ 4063 6 1 h5 okB4069
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 8 = true := blkChk_join _ _ _ _ _ 4063 7 1 h6 okB4070
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 9 = true := blkChk_join _ _ _ _ _ 4063 8 1 h7 okB4071
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4063 10 = true := blkChk_join _ _ _ _ _ 4063 9 1 h8 okB4072
  exact h9
end E1.C236X
