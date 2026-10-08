module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB4890 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4891 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4892 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4893 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4894 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4895 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4896 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4897 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4898 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB4899 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG479 : glueChkR lits W 4890 10 = true := by
  rw [← glueChkRN_eq lits W 8596 4890 lenT]; decide +kernel
theorem okM479 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 1 = true := okB4890
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 2 = true := blkChk_join _ _ _ _ _ 4890 1 1 h0 okB4891
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 3 = true := blkChk_join _ _ _ _ _ 4890 2 1 h1 okB4892
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 4 = true := blkChk_join _ _ _ _ _ 4890 3 1 h2 okB4893
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 5 = true := blkChk_join _ _ _ _ _ 4890 4 1 h3 okB4894
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 6 = true := blkChk_join _ _ _ _ _ 4890 5 1 h4 okB4895
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 7 = true := blkChk_join _ _ _ _ _ 4890 6 1 h5 okB4896
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 8 = true := blkChk_join _ _ _ _ _ 4890 7 1 h6 okB4897
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 9 = true := blkChk_join _ _ _ _ _ 4890 8 1 h7 okB4898
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 4890 10 = true := blkChk_join _ _ _ _ _ 4890 9 1 h8 okB4899
  exact h9
end E1.C236X
