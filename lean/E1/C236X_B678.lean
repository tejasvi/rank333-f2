module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7180 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7181 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7181 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7182 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7182 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7183 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7183 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7184 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7184 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7185 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7185 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7186 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7186 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7187 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7187 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7188 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7188 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7189 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7189 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7190 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7190 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7191 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7191 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG678 : glueChkR lits W 7180 12 = true := by
  rw [← glueChkRN_eq lits W 8596 7180 lenT]; decide +kernel
theorem okM678 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 12 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 1 = true := okB7180
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 2 = true := blkChk_join _ _ _ _ _ 7180 1 1 h0 okB7181
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 3 = true := blkChk_join _ _ _ _ _ 7180 2 1 h1 okB7182
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 4 = true := blkChk_join _ _ _ _ _ 7180 3 1 h2 okB7183
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 5 = true := blkChk_join _ _ _ _ _ 7180 4 1 h3 okB7184
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 6 = true := blkChk_join _ _ _ _ _ 7180 5 1 h4 okB7185
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 7 = true := blkChk_join _ _ _ _ _ 7180 6 1 h5 okB7186
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 8 = true := blkChk_join _ _ _ _ _ 7180 7 1 h6 okB7187
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 9 = true := blkChk_join _ _ _ _ _ 7180 8 1 h7 okB7188
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 10 = true := blkChk_join _ _ _ _ _ 7180 9 1 h8 okB7189
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 11 = true := blkChk_join _ _ _ _ _ 7180 10 1 h9 okB7190
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7180 12 = true := blkChk_join _ _ _ _ _ 7180 11 1 h10 okB7191
  exact h11
end E1.C236X
