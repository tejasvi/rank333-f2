module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB143 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB144 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 144 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB145 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 145 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB146 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 146 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB147 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 147 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB148 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 148 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB149 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 149 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB150 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 150 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB151 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 151 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG13 : glueChkR lits W 143 9 = true := by
  rw [← glueChkRN_eq lits W 8596 143 lenT]; decide +kernel
theorem okM13 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 1 = true := okB143
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 2 = true := blkChk_join _ _ _ _ _ 143 1 1 h0 okB144
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 3 = true := blkChk_join _ _ _ _ _ 143 2 1 h1 okB145
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 4 = true := blkChk_join _ _ _ _ _ 143 3 1 h2 okB146
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 5 = true := blkChk_join _ _ _ _ _ 143 4 1 h3 okB147
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 6 = true := blkChk_join _ _ _ _ _ 143 5 1 h4 okB148
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 7 = true := blkChk_join _ _ _ _ _ 143 6 1 h5 okB149
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 8 = true := blkChk_join _ _ _ _ _ 143 7 1 h6 okB150
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 143 9 = true := blkChk_join _ _ _ _ _ 143 8 1 h7 okB151
  exact h8
end E1.C236X
