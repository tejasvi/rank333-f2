module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4916 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4917 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4917 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4918 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4918 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4919 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4919 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4920 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4920 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4921 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4921 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4922 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4922 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG519 : glueChkR lits W 4916 7 = true := by
  rw [← glueChkRN_eq lits W 7747 4916 lenT]; decide +kernel
theorem okM519 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 1 = true := okB4916
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 2 = true := blkChk_join _ _ _ _ _ 4916 1 1 h0 okB4917
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 3 = true := blkChk_join _ _ _ _ _ 4916 2 1 h1 okB4918
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 4 = true := blkChk_join _ _ _ _ _ 4916 3 1 h2 okB4919
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 5 = true := blkChk_join _ _ _ _ _ 4916 4 1 h3 okB4920
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 6 = true := blkChk_join _ _ _ _ _ 4916 5 1 h4 okB4921
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4916 7 = true := blkChk_join _ _ _ _ _ 4916 6 1 h5 okB4922
  exact h6
end E1.C284X
