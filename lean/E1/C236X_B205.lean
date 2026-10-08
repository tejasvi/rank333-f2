module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2106 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2107 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2107 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2108 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2108 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2109 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2109 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2110 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2110 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2111 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2111 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2112 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2112 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG205 : glueChkR lits W 2106 7 = true := by
  rw [← glueChkRN_eq lits W 8596 2106 lenT]; decide +kernel
theorem okM205 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 1 = true := okB2106
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 2 = true := blkChk_join _ _ _ _ _ 2106 1 1 h0 okB2107
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 3 = true := blkChk_join _ _ _ _ _ 2106 2 1 h1 okB2108
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 4 = true := blkChk_join _ _ _ _ _ 2106 3 1 h2 okB2109
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 5 = true := blkChk_join _ _ _ _ _ 2106 4 1 h3 okB2110
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 6 = true := blkChk_join _ _ _ _ _ 2106 5 1 h4 okB2111
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2106 7 = true := blkChk_join _ _ _ _ _ 2106 6 1 h5 okB2112
  exact h6
end E1.C236X
