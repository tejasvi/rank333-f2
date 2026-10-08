module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB2857 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2858 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2858 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2859 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2859 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2860 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2860 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2861 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2861 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2862 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2862 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2863 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2864 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB2865 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG310 : glueChkR lits W 2857 9 = true := by
  rw [← glueChkRN_eq lits W 7747 2857 lenT]; decide +kernel
theorem okM310 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 1 = true := okB2857
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 2 = true := blkChk_join _ _ _ _ _ 2857 1 1 h0 okB2858
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 3 = true := blkChk_join _ _ _ _ _ 2857 2 1 h1 okB2859
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 4 = true := blkChk_join _ _ _ _ _ 2857 3 1 h2 okB2860
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 5 = true := blkChk_join _ _ _ _ _ 2857 4 1 h3 okB2861
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 6 = true := blkChk_join _ _ _ _ _ 2857 5 1 h4 okB2862
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 7 = true := blkChk_join _ _ _ _ _ 2857 6 1 h5 okB2863
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 8 = true := blkChk_join _ _ _ _ _ 2857 7 1 h6 okB2864
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 2857 9 = true := blkChk_join _ _ _ _ _ 2857 8 1 h7 okB2865
  exact h8
end E1.C284X
