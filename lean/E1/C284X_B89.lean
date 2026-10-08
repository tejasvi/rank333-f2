module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB826 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB827 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 827 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB828 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 828 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB829 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 829 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB830 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 830 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB831 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 831 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB832 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 832 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG89 : glueChkR lits W 826 7 = true := by
  rw [← glueChkRN_eq lits W 7747 826 lenT]; decide +kernel
theorem okM89 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 7 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 1 = true := okB826
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 2 = true := blkChk_join _ _ _ _ _ 826 1 1 h0 okB827
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 3 = true := blkChk_join _ _ _ _ _ 826 2 1 h1 okB828
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 4 = true := blkChk_join _ _ _ _ _ 826 3 1 h2 okB829
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 5 = true := blkChk_join _ _ _ _ _ 826 4 1 h3 okB830
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 6 = true := blkChk_join _ _ _ _ _ 826 5 1 h4 okB831
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 826 7 = true := blkChk_join _ _ _ _ _ 826 6 1 h5 okB832
  exact h6
end E1.C284X
