module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB852 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB853 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 853 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB854 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 854 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB855 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 855 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB856 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 856 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB857 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 857 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB858 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 858 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB859 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 859 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG92 : glueChkR lits W 852 8 = true := by
  rw [← glueChkRN_eq lits W 7747 852 lenT]; decide +kernel
theorem okM92 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 8 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 1 = true := okB852
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 2 = true := blkChk_join _ _ _ _ _ 852 1 1 h0 okB853
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 3 = true := blkChk_join _ _ _ _ _ 852 2 1 h1 okB854
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 4 = true := blkChk_join _ _ _ _ _ 852 3 1 h2 okB855
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 5 = true := blkChk_join _ _ _ _ _ 852 4 1 h3 okB856
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 6 = true := blkChk_join _ _ _ _ _ 852 5 1 h4 okB857
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 7 = true := blkChk_join _ _ _ _ _ 852 6 1 h5 okB858
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 852 8 = true := blkChk_join _ _ _ _ _ 852 7 1 h6 okB859
  exact h7
end E1.C284X
