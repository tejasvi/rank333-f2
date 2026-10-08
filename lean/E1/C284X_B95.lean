module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB882 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB883 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB884 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 884 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB885 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 885 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB886 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 886 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB887 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 887 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB888 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 888 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB889 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 889 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB890 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 890 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB891 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 891 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB892 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 892 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB893 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 893 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB894 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 894 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG95 : glueChkR lits W 882 13 = true := by
  rw [← glueChkRN_eq lits W 7747 882 lenT]; decide +kernel
theorem okM95 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 13 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 1 = true := okB882
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 2 = true := blkChk_join _ _ _ _ _ 882 1 1 h0 okB883
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 3 = true := blkChk_join _ _ _ _ _ 882 2 1 h1 okB884
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 4 = true := blkChk_join _ _ _ _ _ 882 3 1 h2 okB885
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 5 = true := blkChk_join _ _ _ _ _ 882 4 1 h3 okB886
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 6 = true := blkChk_join _ _ _ _ _ 882 5 1 h4 okB887
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 7 = true := blkChk_join _ _ _ _ _ 882 6 1 h5 okB888
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 8 = true := blkChk_join _ _ _ _ _ 882 7 1 h6 okB889
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 9 = true := blkChk_join _ _ _ _ _ 882 8 1 h7 okB890
  have h9 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 10 = true := blkChk_join _ _ _ _ _ 882 9 1 h8 okB891
  have h10 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 11 = true := blkChk_join _ _ _ _ _ 882 10 1 h9 okB892
  have h11 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 12 = true := blkChk_join _ _ _ _ _ 882 11 1 h10 okB893
  have h12 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 882 13 = true := blkChk_join _ _ _ _ _ 882 12 1 h11 okB894
  exact h12
end E1.C284X
