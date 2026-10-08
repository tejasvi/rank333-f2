module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5864 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 1 = true := by decide +kernel
theorem okB5865 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5865 1 = true := by decide +kernel
theorem okB5866 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5866 1 = true := by decide +kernel
theorem okB5867 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5867 1 = true := by decide +kernel
theorem okB5868 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5868 1 = true := by decide +kernel
theorem okB5869 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5869 1 = true := by decide +kernel
theorem okB5870 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5870 1 = true := by decide +kernel
theorem okB5871 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5871 1 = true := by decide +kernel
theorem okB5872 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5872 1 = true := by decide +kernel
theorem okB5873 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5873 1 = true := by decide +kernel
theorem okG565 : glueChkR lits W 5864 10 = true := by decide +kernel
theorem okM565 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 1 = true := okB5864
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 2 = true := blkChk_join _ _ _ _ _ 5864 1 1 h0 okB5865
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 3 = true := blkChk_join _ _ _ _ _ 5864 2 1 h1 okB5866
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 4 = true := blkChk_join _ _ _ _ _ 5864 3 1 h2 okB5867
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 5 = true := blkChk_join _ _ _ _ _ 5864 4 1 h3 okB5868
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 6 = true := blkChk_join _ _ _ _ _ 5864 5 1 h4 okB5869
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 7 = true := blkChk_join _ _ _ _ _ 5864 6 1 h5 okB5870
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 8 = true := blkChk_join _ _ _ _ _ 5864 7 1 h6 okB5871
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 9 = true := blkChk_join _ _ _ _ _ 5864 8 1 h7 okB5872
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5864 10 = true := blkChk_join _ _ _ _ _ 5864 9 1 h8 okB5873
  exact h9
end E1.C384X
