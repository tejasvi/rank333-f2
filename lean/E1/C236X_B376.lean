module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3875 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3876 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3876 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3877 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3877 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3878 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3878 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3879 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3879 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3880 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3880 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3881 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3881 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3882 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3882 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG376 : glueChkR lits W 3875 8 = true := by
  rw [← glueChkRN_eq lits W 8596 3875 lenT]; decide +kernel
theorem okM376 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 1 = true := okB3875
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 2 = true := blkChk_join _ _ _ _ _ 3875 1 1 h0 okB3876
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 3 = true := blkChk_join _ _ _ _ _ 3875 2 1 h1 okB3877
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 4 = true := blkChk_join _ _ _ _ _ 3875 3 1 h2 okB3878
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 5 = true := blkChk_join _ _ _ _ _ 3875 4 1 h3 okB3879
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 6 = true := blkChk_join _ _ _ _ _ 3875 5 1 h4 okB3880
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 7 = true := blkChk_join _ _ _ _ _ 3875 6 1 h5 okB3881
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3875 8 = true := blkChk_join _ _ _ _ _ 3875 7 1 h6 okB3882
  exact h7
end E1.C236X
