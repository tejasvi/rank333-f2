module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB5886 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5887 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5888 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5889 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5890 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5891 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5892 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5893 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5894 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5895 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5895 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5896 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5897 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5898 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5899 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5900 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5901 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG619 : glueChkR lits W 5886 16 = true := by
  rw [← glueChkRN_eq lits W 7747 5886 lenT]; decide +kernel
theorem okM619 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 16 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 1 = true := okB5886
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 2 = true := blkChk_join _ _ _ _ _ 5886 1 1 h0 okB5887
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 3 = true := blkChk_join _ _ _ _ _ 5886 2 1 h1 okB5888
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 4 = true := blkChk_join _ _ _ _ _ 5886 3 1 h2 okB5889
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 5 = true := blkChk_join _ _ _ _ _ 5886 4 1 h3 okB5890
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 6 = true := blkChk_join _ _ _ _ _ 5886 5 1 h4 okB5891
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 7 = true := blkChk_join _ _ _ _ _ 5886 6 1 h5 okB5892
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 8 = true := blkChk_join _ _ _ _ _ 5886 7 1 h6 okB5893
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 9 = true := blkChk_join _ _ _ _ _ 5886 8 1 h7 okB5894
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 10 = true := blkChk_join _ _ _ _ _ 5886 9 1 h8 okB5895
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 11 = true := blkChk_join _ _ _ _ _ 5886 10 1 h9 okB5896
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 12 = true := blkChk_join _ _ _ _ _ 5886 11 1 h10 okB5897
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 13 = true := blkChk_join _ _ _ _ _ 5886 12 1 h11 okB5898
  have h13 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 14 = true := blkChk_join _ _ _ _ _ 5886 13 1 h12 okB5899
  have h14 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 15 = true := blkChk_join _ _ _ _ _ 5886 14 1 h13 okB5900
  have h15 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 5886 16 = true := blkChk_join _ _ _ _ _ 5886 15 1 h14 okB5901
  exact h15
end E1.C284X
