module
public import R22Port.U_d41d8cd98f00
public import E1.C218X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C218X
open E1S
theorem okB868 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 868 1 = true := by decide +kernel
theorem okB869 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 869 1 = true := by decide +kernel
theorem okB870 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 870 1 = true := by decide +kernel
theorem okB871 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 871 1 = true := by decide +kernel
theorem okB872 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 872 1 = true := by decide +kernel
theorem okG80 : glueChkR lits W 868 5 = true := by decide +kernel
theorem okM80 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 868 5 = true := by
  have h0 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 868 1 = true := okB868
  have h1 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 868 2 = true := blkChk_join _ _ _ _ _ 868 1 1 h0 okB869
  have h2 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 868 3 = true := blkChk_join _ _ _ _ _ 868 2 1 h1 okB870
  have h3 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 868 4 = true := blkChk_join _ _ _ _ _ 868 3 1 h2 okB871
  have h4 : blkChk E1.IP_e218.C E1.SL_e218.entry E1.IP_e218.UB E1.IP_e218.UBR lits 868 5 = true := blkChk_join _ _ _ _ _ 868 4 1 h3 okB872
  exact h4
end E1.C218X
