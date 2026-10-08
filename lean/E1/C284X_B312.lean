module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2872 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2873 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2874 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2875 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2876 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2877 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2878 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2878 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2879 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2879 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2880 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2880 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2881 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2881 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2882 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG312 : glueChkR lits W 2872 11 = true := by
  rw [← glueChkRN_eq lits W 7747 2872 lenT]; decide +kernel
theorem okM312 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 11 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 1 = true := okB2872
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 2 = true := blkChk_join _ _ _ _ _ 2872 1 1 h0 okB2873
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 3 = true := blkChk_join _ _ _ _ _ 2872 2 1 h1 okB2874
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 4 = true := blkChk_join _ _ _ _ _ 2872 3 1 h2 okB2875
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 5 = true := blkChk_join _ _ _ _ _ 2872 4 1 h3 okB2876
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 6 = true := blkChk_join _ _ _ _ _ 2872 5 1 h4 okB2877
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 7 = true := blkChk_join _ _ _ _ _ 2872 6 1 h5 okB2878
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 8 = true := blkChk_join _ _ _ _ _ 2872 7 1 h6 okB2879
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 9 = true := blkChk_join _ _ _ _ _ 2872 8 1 h7 okB2880
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 10 = true := blkChk_join _ _ _ _ _ 2872 9 1 h8 okB2881
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2872 11 = true := blkChk_join _ _ _ _ _ 2872 10 1 h9 okB2882
  exact h10
end E1.C284X
