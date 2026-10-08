module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB3814 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3815 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3815 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3816 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3816 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3817 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3817 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3818 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3818 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3819 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3819 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG399 : glueChkR lits W 3814 6 = true := by
  rw [← glueChkRN_eq lits W 7747 3814 lenT]; decide +kernel
theorem okM399 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 6 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 1 = true := okB3814
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 2 = true := blkChk_join _ _ _ _ _ 3814 1 1 h0 okB3815
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 3 = true := blkChk_join _ _ _ _ _ 3814 2 1 h1 okB3816
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 4 = true := blkChk_join _ _ _ _ _ 3814 3 1 h2 okB3817
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 5 = true := blkChk_join _ _ _ _ _ 3814 4 1 h3 okB3818
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 3814 6 = true := blkChk_join _ _ _ _ _ 3814 5 1 h4 okB3819
  exact h5
end E1.C284X
