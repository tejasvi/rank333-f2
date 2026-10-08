module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3882 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3883 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3884 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3885 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3886 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3887 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3888 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3889 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG408 : glueChkR lits W 3882 8 = true := by
  rw [← glueChkRN_eq lits W 7747 3882 lenT]; decide +kernel
theorem okM408 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 1 = true := okB3882
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 2 = true := blkChk_join _ _ _ _ _ 3882 1 1 h0 okB3883
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 3 = true := blkChk_join _ _ _ _ _ 3882 2 1 h1 okB3884
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 4 = true := blkChk_join _ _ _ _ _ 3882 3 1 h2 okB3885
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 5 = true := blkChk_join _ _ _ _ _ 3882 4 1 h3 okB3886
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 6 = true := blkChk_join _ _ _ _ _ 3882 5 1 h4 okB3887
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 7 = true := blkChk_join _ _ _ _ _ 3882 6 1 h5 okB3888
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3882 8 = true := blkChk_join _ _ _ _ _ 3882 7 1 h6 okB3889
  exact h7
end E1.C284X
