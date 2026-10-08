module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3028 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3029 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3029 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3030 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3030 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3031 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3031 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3032 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3032 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3033 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3033 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3034 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3034 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3035 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3035 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG297 : glueChkR lits W 3028 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3028 lenT]; decide +kernel
theorem okM297 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 1 = true := okB3028
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 2 = true := blkChk_join _ _ _ _ _ 3028 1 1 h0 okB3029
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 3 = true := blkChk_join _ _ _ _ _ 3028 2 1 h1 okB3030
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 4 = true := blkChk_join _ _ _ _ _ 3028 3 1 h2 okB3031
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 5 = true := blkChk_join _ _ _ _ _ 3028 4 1 h3 okB3032
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 6 = true := blkChk_join _ _ _ _ _ 3028 5 1 h4 okB3033
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 7 = true := blkChk_join _ _ _ _ _ 3028 6 1 h5 okB3034
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3028 8 = true := blkChk_join _ _ _ _ _ 3028 7 1 h6 okB3035
  exact h7
end E1.C236X
