module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB2862 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2863 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2864 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2865 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2866 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2867 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2868 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2869 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2870 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG282 : glueChkR lits W 2862 9 = true := by
  rw [← glueChkRN_eq lits W 8596 2862 lenT]; decide +kernel
theorem okM282 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 9 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 1 = true := okB2862
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 2 = true := blkChk_join _ _ _ _ _ 2862 1 1 h0 okB2863
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 3 = true := blkChk_join _ _ _ _ _ 2862 2 1 h1 okB2864
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 4 = true := blkChk_join _ _ _ _ _ 2862 3 1 h2 okB2865
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 5 = true := blkChk_join _ _ _ _ _ 2862 4 1 h3 okB2866
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 6 = true := blkChk_join _ _ _ _ _ 2862 5 1 h4 okB2867
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 7 = true := blkChk_join _ _ _ _ _ 2862 6 1 h5 okB2868
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 8 = true := blkChk_join _ _ _ _ _ 2862 7 1 h6 okB2869
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 2862 9 = true := blkChk_join _ _ _ _ _ 2862 8 1 h7 okB2870
  exact h8
end E1.C236X
