module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6964 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6965 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6965 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6966 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6966 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6967 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6967 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6968 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6968 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6969 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6969 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6970 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6970 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG715 : glueChkR lits W 6964 7 = true := by
  rw [← glueChkRN_eq lits W 7747 6964 lenT]; decide +kernel
theorem okM715 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 1 = true := okB6964
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 2 = true := blkChk_join _ _ _ _ _ 6964 1 1 h0 okB6965
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 3 = true := blkChk_join _ _ _ _ _ 6964 2 1 h1 okB6966
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 4 = true := blkChk_join _ _ _ _ _ 6964 3 1 h2 okB6967
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 5 = true := blkChk_join _ _ _ _ _ 6964 4 1 h3 okB6968
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 6 = true := blkChk_join _ _ _ _ _ 6964 5 1 h4 okB6969
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6964 7 = true := blkChk_join _ _ _ _ _ 6964 6 1 h5 okB6970
  exact h6
end E1.C284X
