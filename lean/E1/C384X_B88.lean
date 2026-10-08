module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB920 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 1 = true := by decide +kernel
theorem okB921 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 921 1 = true := by decide +kernel
theorem okB922 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 922 1 = true := by decide +kernel
theorem okB923 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 923 1 = true := by decide +kernel
theorem okB924 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 924 1 = true := by decide +kernel
theorem okB925 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 925 1 = true := by decide +kernel
theorem okB926 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 926 1 = true := by decide +kernel
theorem okB927 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 927 1 = true := by decide +kernel
theorem okB928 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 928 1 = true := by decide +kernel
theorem okB929 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 929 1 = true := by decide +kernel
theorem okG88 : glueChkR lits W 920 10 = true := by decide +kernel
theorem okM88 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 1 = true := okB920
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 2 = true := blkChk_join _ _ _ _ _ 920 1 1 h0 okB921
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 3 = true := blkChk_join _ _ _ _ _ 920 2 1 h1 okB922
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 4 = true := blkChk_join _ _ _ _ _ 920 3 1 h2 okB923
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 5 = true := blkChk_join _ _ _ _ _ 920 4 1 h3 okB924
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 6 = true := blkChk_join _ _ _ _ _ 920 5 1 h4 okB925
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 7 = true := blkChk_join _ _ _ _ _ 920 6 1 h5 okB926
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 8 = true := blkChk_join _ _ _ _ _ 920 7 1 h6 okB927
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 9 = true := blkChk_join _ _ _ _ _ 920 8 1 h7 okB928
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 920 10 = true := blkChk_join _ _ _ _ _ 920 9 1 h8 okB929
  exact h9
end E1.C384X
