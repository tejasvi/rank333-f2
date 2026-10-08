module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB921 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 1 = true := by decide +kernel
theorem okB922 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 922 1 = true := by decide +kernel
theorem okB923 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 923 1 = true := by decide +kernel
theorem okB924 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 924 1 = true := by decide +kernel
theorem okB925 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 925 1 = true := by decide +kernel
theorem okB926 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 926 1 = true := by decide +kernel
theorem okB927 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 927 1 = true := by decide +kernel
theorem okB928 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 928 1 = true := by decide +kernel
theorem okB929 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 929 1 = true := by decide +kernel
theorem okB930 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 930 1 = true := by decide +kernel
theorem okG85 : glueChkR lits W 921 10 = true := by decide +kernel
theorem okM85 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 1 = true := okB921
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 2 = true := blkChk_join _ _ _ _ _ 921 1 1 h0 okB922
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 3 = true := blkChk_join _ _ _ _ _ 921 2 1 h1 okB923
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 4 = true := blkChk_join _ _ _ _ _ 921 3 1 h2 okB924
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 5 = true := blkChk_join _ _ _ _ _ 921 4 1 h3 okB925
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 6 = true := blkChk_join _ _ _ _ _ 921 5 1 h4 okB926
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 7 = true := blkChk_join _ _ _ _ _ 921 6 1 h5 okB927
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 8 = true := blkChk_join _ _ _ _ _ 921 7 1 h6 okB928
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 9 = true := blkChk_join _ _ _ _ _ 921 8 1 h7 okB929
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 921 10 = true := blkChk_join _ _ _ _ _ 921 9 1 h8 okB930
  exact h9
end E1.C387X
