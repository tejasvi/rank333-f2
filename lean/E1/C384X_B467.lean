module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4871 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 1 = true := by decide +kernel
theorem okB4872 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4872 1 = true := by decide +kernel
theorem okB4873 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4873 1 = true := by decide +kernel
theorem okB4874 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4874 1 = true := by decide +kernel
theorem okB4875 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4875 1 = true := by decide +kernel
theorem okB4876 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4876 1 = true := by decide +kernel
theorem okB4877 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4877 1 = true := by decide +kernel
theorem okB4878 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4878 1 = true := by decide +kernel
theorem okB4879 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4879 1 = true := by decide +kernel
theorem okB4880 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4880 1 = true := by decide +kernel
theorem okG467 : glueChkR lits W 4871 10 = true := by decide +kernel
theorem okM467 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 1 = true := okB4871
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 2 = true := blkChk_join _ _ _ _ _ 4871 1 1 h0 okB4872
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 3 = true := blkChk_join _ _ _ _ _ 4871 2 1 h1 okB4873
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 4 = true := blkChk_join _ _ _ _ _ 4871 3 1 h2 okB4874
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 5 = true := blkChk_join _ _ _ _ _ 4871 4 1 h3 okB4875
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 6 = true := blkChk_join _ _ _ _ _ 4871 5 1 h4 okB4876
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 7 = true := blkChk_join _ _ _ _ _ 4871 6 1 h5 okB4877
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 8 = true := blkChk_join _ _ _ _ _ 4871 7 1 h6 okB4878
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 9 = true := blkChk_join _ _ _ _ _ 4871 8 1 h7 okB4879
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4871 10 = true := blkChk_join _ _ _ _ _ 4871 9 1 h8 okB4880
  exact h9
end E1.C384X
