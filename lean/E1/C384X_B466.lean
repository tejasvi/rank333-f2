module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4862 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 1 = true := by decide +kernel
theorem okB4863 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4863 1 = true := by decide +kernel
theorem okB4864 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4864 1 = true := by decide +kernel
theorem okB4865 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4865 1 = true := by decide +kernel
theorem okB4866 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4866 1 = true := by decide +kernel
theorem okB4867 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4867 1 = true := by decide +kernel
theorem okB4868 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4868 1 = true := by decide +kernel
theorem okB4869 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4869 1 = true := by decide +kernel
theorem okB4870 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4870 1 = true := by decide +kernel
theorem okG466 : glueChkR lits W 4862 9 = true := by decide +kernel
theorem okM466 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 1 = true := okB4862
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 2 = true := blkChk_join _ _ _ _ _ 4862 1 1 h0 okB4863
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 3 = true := blkChk_join _ _ _ _ _ 4862 2 1 h1 okB4864
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 4 = true := blkChk_join _ _ _ _ _ 4862 3 1 h2 okB4865
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 5 = true := blkChk_join _ _ _ _ _ 4862 4 1 h3 okB4866
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 6 = true := blkChk_join _ _ _ _ _ 4862 5 1 h4 okB4867
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 7 = true := blkChk_join _ _ _ _ _ 4862 6 1 h5 okB4868
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 8 = true := blkChk_join _ _ _ _ _ 4862 7 1 h6 okB4869
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4862 9 = true := blkChk_join _ _ _ _ _ 4862 8 1 h7 okB4870
  exact h8
end E1.C384X
