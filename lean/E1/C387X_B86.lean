module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB931 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 1 = true := by decide +kernel
theorem okB932 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 932 1 = true := by decide +kernel
theorem okB933 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 933 1 = true := by decide +kernel
theorem okB934 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 934 1 = true := by decide +kernel
theorem okB935 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 935 1 = true := by decide +kernel
theorem okB936 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 936 1 = true := by decide +kernel
theorem okB937 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 937 1 = true := by decide +kernel
theorem okB938 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 938 1 = true := by decide +kernel
theorem okB939 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 939 1 = true := by decide +kernel
theorem okB940 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 940 1 = true := by decide +kernel
theorem okG86 : glueChkR lits W 931 10 = true := by decide +kernel
theorem okM86 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 10 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 1 = true := okB931
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 2 = true := blkChk_join _ _ _ _ _ 931 1 1 h0 okB932
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 3 = true := blkChk_join _ _ _ _ _ 931 2 1 h1 okB933
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 4 = true := blkChk_join _ _ _ _ _ 931 3 1 h2 okB934
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 5 = true := blkChk_join _ _ _ _ _ 931 4 1 h3 okB935
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 6 = true := blkChk_join _ _ _ _ _ 931 5 1 h4 okB936
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 7 = true := blkChk_join _ _ _ _ _ 931 6 1 h5 okB937
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 8 = true := blkChk_join _ _ _ _ _ 931 7 1 h6 okB938
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 9 = true := blkChk_join _ _ _ _ _ 931 8 1 h7 okB939
  have h9 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 931 10 = true := blkChk_join _ _ _ _ _ 931 9 1 h8 okB940
  exact h9
end E1.C387X
