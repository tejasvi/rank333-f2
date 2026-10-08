module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2950 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 1 = true := by decide +kernel
theorem okB2951 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2951 1 = true := by decide +kernel
theorem okB2952 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2952 1 = true := by decide +kernel
theorem okB2953 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2953 1 = true := by decide +kernel
theorem okB2954 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2954 1 = true := by decide +kernel
theorem okB2955 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2955 1 = true := by decide +kernel
theorem okB2956 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2956 1 = true := by decide +kernel
theorem okB2957 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2957 1 = true := by decide +kernel
theorem okG280 : glueChkR lits W 2950 8 = true := by decide +kernel
theorem okM280 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 1 = true := okB2950
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 2 = true := blkChk_join _ _ _ _ _ 2950 1 1 h0 okB2951
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 3 = true := blkChk_join _ _ _ _ _ 2950 2 1 h1 okB2952
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 4 = true := blkChk_join _ _ _ _ _ 2950 3 1 h2 okB2953
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 5 = true := blkChk_join _ _ _ _ _ 2950 4 1 h3 okB2954
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 6 = true := blkChk_join _ _ _ _ _ 2950 5 1 h4 okB2955
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 7 = true := blkChk_join _ _ _ _ _ 2950 6 1 h5 okB2956
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2950 8 = true := blkChk_join _ _ _ _ _ 2950 7 1 h6 okB2957
  exact h7
end E1.C384X
