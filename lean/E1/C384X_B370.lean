module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3866 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 1 = true := by decide +kernel
theorem okB3867 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3867 1 = true := by decide +kernel
theorem okB3868 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3868 1 = true := by decide +kernel
theorem okB3869 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3869 1 = true := by decide +kernel
theorem okB3870 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3870 1 = true := by decide +kernel
theorem okB3871 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3871 1 = true := by decide +kernel
theorem okB3872 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3872 1 = true := by decide +kernel
theorem okG370 : glueChkR lits W 3866 7 = true := by decide +kernel
theorem okM370 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 7 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 1 = true := okB3866
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 2 = true := blkChk_join _ _ _ _ _ 3866 1 1 h0 okB3867
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 3 = true := blkChk_join _ _ _ _ _ 3866 2 1 h1 okB3868
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 4 = true := blkChk_join _ _ _ _ _ 3866 3 1 h2 okB3869
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 5 = true := blkChk_join _ _ _ _ _ 3866 4 1 h3 okB3870
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 6 = true := blkChk_join _ _ _ _ _ 3866 5 1 h4 okB3871
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3866 7 = true := blkChk_join _ _ _ _ _ 3866 6 1 h5 okB3872
  exact h6
end E1.C384X
