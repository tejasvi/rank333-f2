module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4853 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 1 = true := by decide +kernel
theorem okB4854 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4854 1 = true := by decide +kernel
theorem okB4855 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4855 1 = true := by decide +kernel
theorem okB4856 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4856 1 = true := by decide +kernel
theorem okB4857 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4857 1 = true := by decide +kernel
theorem okB4858 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4858 1 = true := by decide +kernel
theorem okB4859 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4859 1 = true := by decide +kernel
theorem okB4860 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4860 1 = true := by decide +kernel
theorem okB4861 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4861 1 = true := by decide +kernel
theorem okG465 : glueChkR lits W 4853 9 = true := by decide +kernel
theorem okM465 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 1 = true := okB4853
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 2 = true := blkChk_join _ _ _ _ _ 4853 1 1 h0 okB4854
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 3 = true := blkChk_join _ _ _ _ _ 4853 2 1 h1 okB4855
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 4 = true := blkChk_join _ _ _ _ _ 4853 3 1 h2 okB4856
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 5 = true := blkChk_join _ _ _ _ _ 4853 4 1 h3 okB4857
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 6 = true := blkChk_join _ _ _ _ _ 4853 5 1 h4 okB4858
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 7 = true := blkChk_join _ _ _ _ _ 4853 6 1 h5 okB4859
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 8 = true := blkChk_join _ _ _ _ _ 4853 7 1 h6 okB4860
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4853 9 = true := blkChk_join _ _ _ _ _ 4853 8 1 h7 okB4861
  exact h8
end E1.C384X
