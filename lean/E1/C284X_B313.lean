module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2883 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2884 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2885 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2886 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2887 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2888 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2889 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2890 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2891 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2892 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG313 : glueChkR lits W 2883 10 = true := by
  rw [← glueChkRN_eq lits W 7747 2883 lenT]; decide +kernel
theorem okM313 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 10 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 1 = true := okB2883
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 2 = true := blkChk_join _ _ _ _ _ 2883 1 1 h0 okB2884
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 3 = true := blkChk_join _ _ _ _ _ 2883 2 1 h1 okB2885
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 4 = true := blkChk_join _ _ _ _ _ 2883 3 1 h2 okB2886
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 5 = true := blkChk_join _ _ _ _ _ 2883 4 1 h3 okB2887
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 6 = true := blkChk_join _ _ _ _ _ 2883 5 1 h4 okB2888
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 7 = true := blkChk_join _ _ _ _ _ 2883 6 1 h5 okB2889
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 8 = true := blkChk_join _ _ _ _ _ 2883 7 1 h6 okB2890
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 9 = true := blkChk_join _ _ _ _ _ 2883 8 1 h7 okB2891
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2883 10 = true := blkChk_join _ _ _ _ _ 2883 9 1 h8 okB2892
  exact h9
end E1.C284X
