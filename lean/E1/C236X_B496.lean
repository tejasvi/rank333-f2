module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5084 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5085 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5085 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5086 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5086 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5087 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5087 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5088 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5088 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5089 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5089 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5090 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5090 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5091 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5091 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5092 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5092 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5093 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5093 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5094 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5094 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG496 : glueChkR lits W 5084 11 = true := by
  rw [← glueChkRN_eq lits W 8596 5084 lenT]; decide +kernel
theorem okM496 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 11 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 1 = true := okB5084
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 2 = true := blkChk_join _ _ _ _ _ 5084 1 1 h0 okB5085
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 3 = true := blkChk_join _ _ _ _ _ 5084 2 1 h1 okB5086
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 4 = true := blkChk_join _ _ _ _ _ 5084 3 1 h2 okB5087
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 5 = true := blkChk_join _ _ _ _ _ 5084 4 1 h3 okB5088
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 6 = true := blkChk_join _ _ _ _ _ 5084 5 1 h4 okB5089
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 7 = true := blkChk_join _ _ _ _ _ 5084 6 1 h5 okB5090
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 8 = true := blkChk_join _ _ _ _ _ 5084 7 1 h6 okB5091
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 9 = true := blkChk_join _ _ _ _ _ 5084 8 1 h7 okB5092
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 10 = true := blkChk_join _ _ _ _ _ 5084 9 1 h8 okB5093
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5084 11 = true := blkChk_join _ _ _ _ _ 5084 10 1 h9 okB5094
  exact h10
end E1.C236X
