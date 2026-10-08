module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5076 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5077 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5077 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5078 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5078 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5079 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5079 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5080 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5080 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5081 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5081 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5082 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5082 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5083 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5083 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG495 : glueChkR lits W 5076 8 = true := by
  rw [← glueChkRN_eq lits W 8596 5076 lenT]; decide +kernel
theorem okM495 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 1 = true := okB5076
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 2 = true := blkChk_join _ _ _ _ _ 5076 1 1 h0 okB5077
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 3 = true := blkChk_join _ _ _ _ _ 5076 2 1 h1 okB5078
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 4 = true := blkChk_join _ _ _ _ _ 5076 3 1 h2 okB5079
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 5 = true := blkChk_join _ _ _ _ _ 5076 4 1 h3 okB5080
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 6 = true := blkChk_join _ _ _ _ _ 5076 5 1 h4 okB5081
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 7 = true := blkChk_join _ _ _ _ _ 5076 6 1 h5 okB5082
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5076 8 = true := blkChk_join _ _ _ _ _ 5076 7 1 h6 okB5083
  exact h7
end E1.C236X
