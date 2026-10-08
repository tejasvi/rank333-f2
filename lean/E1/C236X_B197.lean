module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2030 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2031 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2031 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2032 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2033 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2034 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2035 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2036 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2036 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG197 : glueChkR lits W 2030 7 = true := by
  rw [← glueChkRN_eq lits W 8596 2030 lenT]; decide +kernel
theorem okM197 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 7 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 1 = true := okB2030
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 2 = true := blkChk_join _ _ _ _ _ 2030 1 1 h0 okB2031
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 3 = true := blkChk_join _ _ _ _ _ 2030 2 1 h1 okB2032
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 4 = true := blkChk_join _ _ _ _ _ 2030 3 1 h2 okB2033
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 5 = true := blkChk_join _ _ _ _ _ 2030 4 1 h3 okB2034
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 6 = true := blkChk_join _ _ _ _ _ 2030 5 1 h4 okB2035
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2030 7 = true := blkChk_join _ _ _ _ _ 2030 6 1 h5 okB2036
  exact h6
end E1.C236X
