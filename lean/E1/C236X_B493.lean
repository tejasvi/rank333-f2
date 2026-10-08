module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5052 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5053 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5053 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5054 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5054 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5055 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5055 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5056 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5056 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5057 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5057 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5058 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5058 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5059 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5060 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG493 : glueChkR lits W 5052 9 = true := by
  rw [← glueChkRN_eq lits W 8596 5052 lenT]; decide +kernel
theorem okM493 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 1 = true := okB5052
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 2 = true := blkChk_join _ _ _ _ _ 5052 1 1 h0 okB5053
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 3 = true := blkChk_join _ _ _ _ _ 5052 2 1 h1 okB5054
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 4 = true := blkChk_join _ _ _ _ _ 5052 3 1 h2 okB5055
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 5 = true := blkChk_join _ _ _ _ _ 5052 4 1 h3 okB5056
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 6 = true := blkChk_join _ _ _ _ _ 5052 5 1 h4 okB5057
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 7 = true := blkChk_join _ _ _ _ _ 5052 6 1 h5 okB5058
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 8 = true := blkChk_join _ _ _ _ _ 5052 7 1 h6 okB5059
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5052 9 = true := blkChk_join _ _ _ _ _ 5052 8 1 h7 okB5060
  exact h8
end E1.C236X
