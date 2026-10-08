module
public import R22Port.U_d41d8cd98f00
public import E1.C236X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C236X
open E1S
theorem okB6865 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6866 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6866 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6867 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6867 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6868 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6868 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6869 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6869 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6870 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6870 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6871 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6871 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB6872 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6872 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG648 : glueChkR lits W 6865 8 = true := by
  rw [← glueChkRN_eq lits W 8596 6865 lenT]; decide +kernel
theorem okM648 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 8 = true := by
  have h0 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 1 = true := okB6865
  have h1 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 2 = true := blkChk_join _ _ _ _ _ 6865 1 1 h0 okB6866
  have h2 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 3 = true := blkChk_join _ _ _ _ _ 6865 2 1 h1 okB6867
  have h3 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 4 = true := blkChk_join _ _ _ _ _ 6865 3 1 h2 okB6868
  have h4 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 5 = true := blkChk_join _ _ _ _ _ 6865 4 1 h3 okB6869
  have h5 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 6 = true := blkChk_join _ _ _ _ _ 6865 5 1 h4 okB6870
  have h6 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 7 = true := blkChk_join _ _ _ _ _ 6865 6 1 h5 okB6871
  have h7 : blkChk E1.IP_e236.C E1.SL_e236.entry E1.IP_e236.UB E1.IP_e236.UBR lits 6865 8 = true := blkChk_join _ _ _ _ _ 6865 7 1 h6 okB6872
  exact h7
end E1.C236X
