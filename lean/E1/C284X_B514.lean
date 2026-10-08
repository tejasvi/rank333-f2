module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB4889 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4890 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4891 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4892 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4893 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4894 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4895 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4896 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4897 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG514 : glueChkR lits W 4889 9 = true := by
  rw [← glueChkRN_eq lits W 7747 4889 lenT]; decide +kernel
theorem okM514 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 1 = true := okB4889
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 2 = true := blkChk_join _ _ _ _ _ 4889 1 1 h0 okB4890
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 3 = true := blkChk_join _ _ _ _ _ 4889 2 1 h1 okB4891
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 4 = true := blkChk_join _ _ _ _ _ 4889 3 1 h2 okB4892
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 5 = true := blkChk_join _ _ _ _ _ 4889 4 1 h3 okB4893
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 6 = true := blkChk_join _ _ _ _ _ 4889 5 1 h4 okB4894
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 7 = true := blkChk_join _ _ _ _ _ 4889 6 1 h5 okB4895
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 8 = true := blkChk_join _ _ _ _ _ 4889 7 1 h6 okB4896
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 4889 9 = true := blkChk_join _ _ _ _ _ 4889 8 1 h7 okB4897
  exact h8
end E1.C284X
