module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB5871 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5872 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5873 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5873 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5874 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5874 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5875 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5876 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5877 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5878 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5878 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5879 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5879 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5880 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5880 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5881 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5881 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5882 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB5883 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5883 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG567 : glueChkR lits W 5871 13 = true := by
  rw [← glueChkRN_eq lits W 8596 5871 lenT]; decide +kernel
theorem okM567 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 13 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 1 = true := okB5871
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 2 = true := blkChk_join _ _ _ _ _ 5871 1 1 h0 okB5872
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 3 = true := blkChk_join _ _ _ _ _ 5871 2 1 h1 okB5873
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 4 = true := blkChk_join _ _ _ _ _ 5871 3 1 h2 okB5874
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 5 = true := blkChk_join _ _ _ _ _ 5871 4 1 h3 okB5875
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 6 = true := blkChk_join _ _ _ _ _ 5871 5 1 h4 okB5876
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 7 = true := blkChk_join _ _ _ _ _ 5871 6 1 h5 okB5877
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 8 = true := blkChk_join _ _ _ _ _ 5871 7 1 h6 okB5878
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 9 = true := blkChk_join _ _ _ _ _ 5871 8 1 h7 okB5879
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 10 = true := blkChk_join _ _ _ _ _ 5871 9 1 h8 okB5880
  have h10 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 11 = true := blkChk_join _ _ _ _ _ 5871 10 1 h9 okB5881
  have h11 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 12 = true := blkChk_join _ _ _ _ _ 5871 11 1 h10 okB5882
  have h12 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 5871 13 = true := blkChk_join _ _ _ _ _ 5871 12 1 h11 okB5883
  exact h12
end E1.C236X
