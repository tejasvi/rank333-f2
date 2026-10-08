module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6881 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6882 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6883 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6884 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6885 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6886 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6887 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6888 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6889 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG708 : glueChkR lits W 6881 9 = true := by
  rw [← glueChkRN_eq lits W 7747 6881 lenT]; decide +kernel
theorem okM708 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 1 = true := okB6881
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 2 = true := blkChk_join _ _ _ _ _ 6881 1 1 h0 okB6882
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 3 = true := blkChk_join _ _ _ _ _ 6881 2 1 h1 okB6883
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 4 = true := blkChk_join _ _ _ _ _ 6881 3 1 h2 okB6884
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 5 = true := blkChk_join _ _ _ _ _ 6881 4 1 h3 okB6885
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 6 = true := blkChk_join _ _ _ _ _ 6881 5 1 h4 okB6886
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 7 = true := blkChk_join _ _ _ _ _ 6881 6 1 h5 okB6887
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 8 = true := blkChk_join _ _ _ _ _ 6881 7 1 h6 okB6888
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6881 9 = true := blkChk_join _ _ _ _ _ 6881 8 1 h7 okB6889
  exact h8
end E1.C284X
