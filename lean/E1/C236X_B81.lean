module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB863 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB864 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB865 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB866 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB867 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB868 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB869 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB870 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB871 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB872 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG81 : glueChkR lits W 863 10 = true := by
  rw [← glueChkRN_eq lits W 8596 863 lenT]; decide +kernel
theorem okM81 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 1 = true := okB863
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 2 = true := blkChk_join _ _ _ _ _ 863 1 1 h0 okB864
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 3 = true := blkChk_join _ _ _ _ _ 863 2 1 h1 okB865
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 4 = true := blkChk_join _ _ _ _ _ 863 3 1 h2 okB866
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 5 = true := blkChk_join _ _ _ _ _ 863 4 1 h3 okB867
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 6 = true := blkChk_join _ _ _ _ _ 863 5 1 h4 okB868
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 7 = true := blkChk_join _ _ _ _ _ 863 6 1 h5 okB869
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 8 = true := blkChk_join _ _ _ _ _ 863 7 1 h6 okB870
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 9 = true := blkChk_join _ _ _ _ _ 863 8 1 h7 okB871
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 863 10 = true := blkChk_join _ _ _ _ _ 863 9 1 h8 okB872
  exact h9
end E1.C236X
