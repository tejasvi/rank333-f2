module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2223 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2224 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2224 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2225 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2225 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2226 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2226 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2227 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2227 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2228 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2228 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2229 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2229 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG217 : glueChkR lits W 2223 7 = true := by
  rw [← glueChkRN_eq lits W 8596 2223 lenT]; decide +kernel
theorem okM217 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 1 = true := okB2223
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 2 = true := blkChk_join _ _ _ _ _ 2223 1 1 h0 okB2224
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 3 = true := blkChk_join _ _ _ _ _ 2223 2 1 h1 okB2225
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 4 = true := blkChk_join _ _ _ _ _ 2223 3 1 h2 okB2226
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 5 = true := blkChk_join _ _ _ _ _ 2223 4 1 h3 okB2227
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 6 = true := blkChk_join _ _ _ _ _ 2223 5 1 h4 okB2228
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2223 7 = true := blkChk_join _ _ _ _ _ 2223 6 1 h5 okB2229
  exact h6
end E1.C236X
