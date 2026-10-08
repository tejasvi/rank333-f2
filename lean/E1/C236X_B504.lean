module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5176 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5177 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5177 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5178 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5178 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5179 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5179 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5180 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5180 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5181 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5181 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5182 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5182 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5183 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5183 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG504 : glueChkR lits W 5176 8 = true := by
  rw [← glueChkRN_eq lits W 8596 5176 lenT]; decide +kernel
theorem okM504 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 1 = true := okB5176
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 2 = true := blkChk_join _ _ _ _ _ 5176 1 1 h0 okB5177
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 3 = true := blkChk_join _ _ _ _ _ 5176 2 1 h1 okB5178
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 4 = true := blkChk_join _ _ _ _ _ 5176 3 1 h2 okB5179
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 5 = true := blkChk_join _ _ _ _ _ 5176 4 1 h3 okB5180
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 6 = true := blkChk_join _ _ _ _ _ 5176 5 1 h4 okB5181
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 7 = true := blkChk_join _ _ _ _ _ 5176 6 1 h5 okB5182
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5176 8 = true := blkChk_join _ _ _ _ _ 5176 7 1 h6 okB5183
  exact h7
end E1.C236X
