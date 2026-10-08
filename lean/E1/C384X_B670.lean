module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6863 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 1 = true := by decide +kernel
theorem okB6864 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6864 1 = true := by decide +kernel
theorem okB6865 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6865 1 = true := by decide +kernel
theorem okB6866 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6866 1 = true := by decide +kernel
theorem okB6867 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6867 1 = true := by decide +kernel
theorem okB6868 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6868 1 = true := by decide +kernel
theorem okB6869 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6869 1 = true := by decide +kernel
theorem okB6870 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6870 1 = true := by decide +kernel
theorem okB6871 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6871 1 = true := by decide +kernel
theorem okG670 : glueChkR lits W 6863 9 = true := by decide +kernel
theorem okM670 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 1 = true := okB6863
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 2 = true := blkChk_join _ _ _ _ _ 6863 1 1 h0 okB6864
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 3 = true := blkChk_join _ _ _ _ _ 6863 2 1 h1 okB6865
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 4 = true := blkChk_join _ _ _ _ _ 6863 3 1 h2 okB6866
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 5 = true := blkChk_join _ _ _ _ _ 6863 4 1 h3 okB6867
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 6 = true := blkChk_join _ _ _ _ _ 6863 5 1 h4 okB6868
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 7 = true := blkChk_join _ _ _ _ _ 6863 6 1 h5 okB6869
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 8 = true := blkChk_join _ _ _ _ _ 6863 7 1 h6 okB6870
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6863 9 = true := blkChk_join _ _ _ _ _ 6863 8 1 h7 okB6871
  exact h8
end E1.C384X
