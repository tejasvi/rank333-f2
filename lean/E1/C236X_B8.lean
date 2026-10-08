module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB95 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB96 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 96 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB97 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 97 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB98 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 98 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB99 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 99 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB100 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 100 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB101 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 101 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB102 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 102 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB103 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 103 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG8 : glueChkR lits W 95 9 = true := by
  rw [← glueChkRN_eq lits W 8596 95 lenT]; decide +kernel
theorem okM8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 1 = true := okB95
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 2 = true := blkChk_join _ _ _ _ _ 95 1 1 h0 okB96
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 3 = true := blkChk_join _ _ _ _ _ 95 2 1 h1 okB97
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 4 = true := blkChk_join _ _ _ _ _ 95 3 1 h2 okB98
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 5 = true := blkChk_join _ _ _ _ _ 95 4 1 h3 okB99
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 6 = true := blkChk_join _ _ _ _ _ 95 5 1 h4 okB100
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 7 = true := blkChk_join _ _ _ _ _ 95 6 1 h5 okB101
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 8 = true := blkChk_join _ _ _ _ _ 95 7 1 h6 okB102
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 95 9 = true := blkChk_join _ _ _ _ _ 95 8 1 h7 okB103
  exact h8
end E1.C236X
