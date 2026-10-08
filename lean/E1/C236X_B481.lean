module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4915 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4916 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4917 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4918 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4919 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4920 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4920 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4921 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4921 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4922 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4922 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4923 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4923 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG481 : glueChkR lits W 4915 9 = true := by
  rw [← glueChkRN_eq lits W 8596 4915 lenT]; decide +kernel
theorem okM481 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 1 = true := okB4915
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 2 = true := blkChk_join _ _ _ _ _ 4915 1 1 h0 okB4916
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 3 = true := blkChk_join _ _ _ _ _ 4915 2 1 h1 okB4917
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 4 = true := blkChk_join _ _ _ _ _ 4915 3 1 h2 okB4918
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 5 = true := blkChk_join _ _ _ _ _ 4915 4 1 h3 okB4919
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 6 = true := blkChk_join _ _ _ _ _ 4915 5 1 h4 okB4920
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 7 = true := blkChk_join _ _ _ _ _ 4915 6 1 h5 okB4921
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 8 = true := blkChk_join _ _ _ _ _ 4915 7 1 h6 okB4922
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4915 9 = true := blkChk_join _ _ _ _ _ 4915 8 1 h7 okB4923
  exact h8
end E1.C236X
