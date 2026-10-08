module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4054 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4055 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4055 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4056 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4056 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4057 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4057 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4058 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4058 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4059 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4059 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4060 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4060 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4061 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4061 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4062 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4062 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG395 : glueChkR lits W 4054 9 = true := by
  rw [← glueChkRN_eq lits W 8596 4054 lenT]; decide +kernel
theorem okM395 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 1 = true := okB4054
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 2 = true := blkChk_join _ _ _ _ _ 4054 1 1 h0 okB4055
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 3 = true := blkChk_join _ _ _ _ _ 4054 2 1 h1 okB4056
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 4 = true := blkChk_join _ _ _ _ _ 4054 3 1 h2 okB4057
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 5 = true := blkChk_join _ _ _ _ _ 4054 4 1 h3 okB4058
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 6 = true := blkChk_join _ _ _ _ _ 4054 5 1 h4 okB4059
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 7 = true := blkChk_join _ _ _ _ _ 4054 6 1 h5 okB4060
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 8 = true := blkChk_join _ _ _ _ _ 4054 7 1 h6 okB4061
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4054 9 = true := blkChk_join _ _ _ _ _ 4054 8 1 h7 okB4062
  exact h8
end E1.C236X
