module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB6868 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6869 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6870 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6871 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6872 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6873 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6874 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6875 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6876 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6877 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6878 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6878 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6879 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6879 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6880 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6880 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG707 : glueChkR lits W 6868 13 = true := by
  rw [← glueChkRN_eq lits W 7747 6868 lenT]; decide +kernel
theorem okM707 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 1 = true := okB6868
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 2 = true := blkChk_join _ _ _ _ _ 6868 1 1 h0 okB6869
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 3 = true := blkChk_join _ _ _ _ _ 6868 2 1 h1 okB6870
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 4 = true := blkChk_join _ _ _ _ _ 6868 3 1 h2 okB6871
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 5 = true := blkChk_join _ _ _ _ _ 6868 4 1 h3 okB6872
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 6 = true := blkChk_join _ _ _ _ _ 6868 5 1 h4 okB6873
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 7 = true := blkChk_join _ _ _ _ _ 6868 6 1 h5 okB6874
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 8 = true := blkChk_join _ _ _ _ _ 6868 7 1 h6 okB6875
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 9 = true := blkChk_join _ _ _ _ _ 6868 8 1 h7 okB6876
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 10 = true := blkChk_join _ _ _ _ _ 6868 9 1 h8 okB6877
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 11 = true := blkChk_join _ _ _ _ _ 6868 10 1 h9 okB6878
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 12 = true := blkChk_join _ _ _ _ _ 6868 11 1 h10 okB6879
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 6868 13 = true := blkChk_join _ _ _ _ _ 6868 12 1 h11 okB6880
  exact h12
end E1.C284X
