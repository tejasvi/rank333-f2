module
public import R22Port.U_d41d8cd98f00
public import E1.C390X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C390X
open E1S
theorem okB975 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 1 = true := by decide +kernel
theorem okB976 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 976 1 = true := by decide +kernel
theorem okB977 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 977 1 = true := by decide +kernel
theorem okB978 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 978 1 = true := by decide +kernel
theorem okB979 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 979 1 = true := by decide +kernel
theorem okB980 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 980 1 = true := by decide +kernel
theorem okB981 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 981 1 = true := by decide +kernel
theorem okB982 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 982 1 = true := by decide +kernel
theorem okG96 : glueChkR lits W 975 8 = true := by decide +kernel
theorem okM96 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 8 = true := by
  have h0 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 1 = true := okB975
  have h1 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 2 = true := blkChk_join _ _ _ _ _ 975 1 1 h0 okB976
  have h2 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 3 = true := blkChk_join _ _ _ _ _ 975 2 1 h1 okB977
  have h3 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 4 = true := blkChk_join _ _ _ _ _ 975 3 1 h2 okB978
  have h4 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 5 = true := blkChk_join _ _ _ _ _ 975 4 1 h3 okB979
  have h5 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 6 = true := blkChk_join _ _ _ _ _ 975 5 1 h4 okB980
  have h6 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 7 = true := blkChk_join _ _ _ _ _ 975 6 1 h5 okB981
  have h7 : blkChk E1.IP_e390.C E1.SL_e390.entry E1.IP_e390.UB E1.IP_e390.UBR lits 975 8 = true := blkChk_join _ _ _ _ _ 975 7 1 h6 okB982
  exact h7
end E1.C390X
