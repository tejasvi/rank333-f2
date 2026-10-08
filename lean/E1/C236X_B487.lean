module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4976 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4977 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4977 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4978 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4978 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4979 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4979 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4980 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4980 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4981 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4981 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4982 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4982 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4983 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4983 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4984 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4984 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG487 : glueChkR lits W 4976 9 = true := by
  rw [← glueChkRN_eq lits W 8596 4976 lenT]; decide +kernel
theorem okM487 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 1 = true := okB4976
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 2 = true := blkChk_join _ _ _ _ _ 4976 1 1 h0 okB4977
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 3 = true := blkChk_join _ _ _ _ _ 4976 2 1 h1 okB4978
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 4 = true := blkChk_join _ _ _ _ _ 4976 3 1 h2 okB4979
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 5 = true := blkChk_join _ _ _ _ _ 4976 4 1 h3 okB4980
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 6 = true := blkChk_join _ _ _ _ _ 4976 5 1 h4 okB4981
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 7 = true := blkChk_join _ _ _ _ _ 4976 6 1 h5 okB4982
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 8 = true := blkChk_join _ _ _ _ _ 4976 7 1 h6 okB4983
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4976 9 = true := blkChk_join _ _ _ _ _ 4976 8 1 h7 okB4984
  exact h8
end E1.C236X
