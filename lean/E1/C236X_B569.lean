module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5896 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5897 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5897 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5898 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5898 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5899 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5899 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5900 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5900 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5901 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5901 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5902 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5902 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5903 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5903 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5904 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5904 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5905 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5905 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5906 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5906 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5907 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5907 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5908 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5908 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5909 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5909 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5910 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5910 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5911 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5911 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG569 : glueChkR lits W 5896 16 = true := by
  rw [← glueChkRN_eq lits W 8596 5896 lenT]; decide +kernel
theorem okM569 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 16 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 1 = true := okB5896
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 2 = true := blkChk_join _ _ _ _ _ 5896 1 1 h0 okB5897
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 3 = true := blkChk_join _ _ _ _ _ 5896 2 1 h1 okB5898
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 4 = true := blkChk_join _ _ _ _ _ 5896 3 1 h2 okB5899
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 5 = true := blkChk_join _ _ _ _ _ 5896 4 1 h3 okB5900
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 6 = true := blkChk_join _ _ _ _ _ 5896 5 1 h4 okB5901
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 7 = true := blkChk_join _ _ _ _ _ 5896 6 1 h5 okB5902
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 8 = true := blkChk_join _ _ _ _ _ 5896 7 1 h6 okB5903
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 9 = true := blkChk_join _ _ _ _ _ 5896 8 1 h7 okB5904
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 10 = true := blkChk_join _ _ _ _ _ 5896 9 1 h8 okB5905
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 11 = true := blkChk_join _ _ _ _ _ 5896 10 1 h9 okB5906
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 12 = true := blkChk_join _ _ _ _ _ 5896 11 1 h10 okB5907
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 13 = true := blkChk_join _ _ _ _ _ 5896 12 1 h11 okB5908
  have h13 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 14 = true := blkChk_join _ _ _ _ _ 5896 13 1 h12 okB5909
  have h14 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 15 = true := blkChk_join _ _ _ _ _ 5896 14 1 h13 okB5910
  have h15 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5896 16 = true := blkChk_join _ _ _ _ _ 5896 15 1 h14 okB5911
  exact h15
end E1.C236X
