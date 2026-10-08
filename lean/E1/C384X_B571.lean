module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5925 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 1 = true := by decide +kernel
theorem okB5926 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5926 1 = true := by decide +kernel
theorem okB5927 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5927 1 = true := by decide +kernel
theorem okB5928 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5928 1 = true := by decide +kernel
theorem okB5929 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5929 1 = true := by decide +kernel
theorem okB5930 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5930 1 = true := by decide +kernel
theorem okB5931 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5931 1 = true := by decide +kernel
theorem okB5932 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5932 1 = true := by decide +kernel
theorem okG571 : glueChkR lits W 5925 8 = true := by decide +kernel
theorem okM571 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 1 = true := okB5925
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 2 = true := blkChk_join _ _ _ _ _ 5925 1 1 h0 okB5926
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 3 = true := blkChk_join _ _ _ _ _ 5925 2 1 h1 okB5927
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 4 = true := blkChk_join _ _ _ _ _ 5925 3 1 h2 okB5928
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 5 = true := blkChk_join _ _ _ _ _ 5925 4 1 h3 okB5929
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 6 = true := blkChk_join _ _ _ _ _ 5925 5 1 h4 okB5930
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 7 = true := blkChk_join _ _ _ _ _ 5925 6 1 h5 okB5931
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5925 8 = true := blkChk_join _ _ _ _ _ 5925 7 1 h6 okB5932
  exact h7
end E1.C384X
