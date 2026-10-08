module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5184 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5185 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5185 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5186 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5186 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5187 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5187 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5188 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5188 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5189 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5189 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5190 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5190 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5191 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5191 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG505 : glueChkR lits W 5184 8 = true := by
  rw [← glueChkRN_eq lits W 8596 5184 lenT]; decide +kernel
theorem okM505 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 1 = true := okB5184
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 2 = true := blkChk_join _ _ _ _ _ 5184 1 1 h0 okB5185
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 3 = true := blkChk_join _ _ _ _ _ 5184 2 1 h1 okB5186
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 4 = true := blkChk_join _ _ _ _ _ 5184 3 1 h2 okB5187
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 5 = true := blkChk_join _ _ _ _ _ 5184 4 1 h3 okB5188
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 6 = true := blkChk_join _ _ _ _ _ 5184 5 1 h4 okB5189
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 7 = true := blkChk_join _ _ _ _ _ 5184 6 1 h5 okB5190
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5184 8 = true := blkChk_join _ _ _ _ _ 5184 7 1 h6 okB5191
  exact h7
end E1.C236X
