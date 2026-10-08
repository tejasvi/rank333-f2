module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB7973 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7974 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7974 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7975 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7975 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7976 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7977 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7978 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7979 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7980 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB7981 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG747 : glueChkR lits W 7973 9 = true := by
  rw [← glueChkRN_eq lits W 8596 7973 lenT]; decide +kernel
theorem okM747 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 1 = true := okB7973
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 2 = true := blkChk_join _ _ _ _ _ 7973 1 1 h0 okB7974
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 3 = true := blkChk_join _ _ _ _ _ 7973 2 1 h1 okB7975
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 4 = true := blkChk_join _ _ _ _ _ 7973 3 1 h2 okB7976
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 5 = true := blkChk_join _ _ _ _ _ 7973 4 1 h3 okB7977
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 6 = true := blkChk_join _ _ _ _ _ 7973 5 1 h4 okB7978
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 7 = true := blkChk_join _ _ _ _ _ 7973 6 1 h5 okB7979
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 8 = true := blkChk_join _ _ _ _ _ 7973 7 1 h6 okB7980
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 7973 9 = true := blkChk_join _ _ _ _ _ 7973 8 1 h7 okB7981
  exact h8
end E1.C236X
