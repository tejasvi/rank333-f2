module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB3857 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3858 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3858 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3859 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3859 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3860 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3860 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3861 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3861 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3862 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3862 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3863 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3863 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3864 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3864 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3865 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB3866 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG374 : glueChkR lits W 3857 10 = true := by
  rw [← glueChkRN_eq lits W 8596 3857 lenT]; decide +kernel
theorem okM374 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 10 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 1 = true := okB3857
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 2 = true := blkChk_join _ _ _ _ _ 3857 1 1 h0 okB3858
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 3 = true := blkChk_join _ _ _ _ _ 3857 2 1 h1 okB3859
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 4 = true := blkChk_join _ _ _ _ _ 3857 3 1 h2 okB3860
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 5 = true := blkChk_join _ _ _ _ _ 3857 4 1 h3 okB3861
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 6 = true := blkChk_join _ _ _ _ _ 3857 5 1 h4 okB3862
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 7 = true := blkChk_join _ _ _ _ _ 3857 6 1 h5 okB3863
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 8 = true := blkChk_join _ _ _ _ _ 3857 7 1 h6 okB3864
  have h8 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 9 = true := blkChk_join _ _ _ _ _ 3857 8 1 h7 okB3865
  have h9 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 3857 10 = true := blkChk_join _ _ _ _ _ 3857 9 1 h8 okB3866
  exact h9
end E1.C236X
