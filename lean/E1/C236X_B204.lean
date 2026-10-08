module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2100 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2101 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2101 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2102 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2102 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2103 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2103 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2104 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2104 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2105 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2105 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG204 : glueChkR lits W 2100 6 = true := by
  rw [← glueChkRN_eq lits W 8596 2100 lenT]; decide +kernel
theorem okM204 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 6 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 1 = true := okB2100
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 2 = true := blkChk_join _ _ _ _ _ 2100 1 1 h0 okB2101
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 3 = true := blkChk_join _ _ _ _ _ 2100 2 1 h1 okB2102
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 4 = true := blkChk_join _ _ _ _ _ 2100 3 1 h2 okB2103
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 5 = true := blkChk_join _ _ _ _ _ 2100 4 1 h3 okB2104
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2100 6 = true := blkChk_join _ _ _ _ _ 2100 5 1 h4 okB2105
  exact h5
end E1.C236X
