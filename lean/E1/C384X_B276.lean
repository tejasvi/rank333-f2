module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2908 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 1 = true := by decide +kernel
theorem okB2909 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2909 1 = true := by decide +kernel
theorem okB2910 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2910 1 = true := by decide +kernel
theorem okB2911 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2911 1 = true := by decide +kernel
theorem okB2912 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2912 1 = true := by decide +kernel
theorem okB2913 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2913 1 = true := by decide +kernel
theorem okB2914 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2914 1 = true := by decide +kernel
theorem okB2915 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2915 1 = true := by decide +kernel
theorem okB2916 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2916 1 = true := by decide +kernel
theorem okG276 : glueChkR lits W 2908 9 = true := by decide +kernel
theorem okM276 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 1 = true := okB2908
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 2 = true := blkChk_join _ _ _ _ _ 2908 1 1 h0 okB2909
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 3 = true := blkChk_join _ _ _ _ _ 2908 2 1 h1 okB2910
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 4 = true := blkChk_join _ _ _ _ _ 2908 3 1 h2 okB2911
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 5 = true := blkChk_join _ _ _ _ _ 2908 4 1 h3 okB2912
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 6 = true := blkChk_join _ _ _ _ _ 2908 5 1 h4 okB2913
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 7 = true := blkChk_join _ _ _ _ _ 2908 6 1 h5 okB2914
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 8 = true := blkChk_join _ _ _ _ _ 2908 7 1 h6 okB2915
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2908 9 = true := blkChk_join _ _ _ _ _ 2908 8 1 h7 okB2916
  exact h8
end E1.C384X
