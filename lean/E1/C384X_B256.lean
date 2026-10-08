module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2724 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 1 = true := by decide +kernel
theorem okB2725 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2725 1 = true := by decide +kernel
theorem okB2726 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2726 1 = true := by decide +kernel
theorem okB2727 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2727 1 = true := by decide +kernel
theorem okB2728 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2728 1 = true := by decide +kernel
theorem okB2729 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2729 1 = true := by decide +kernel
theorem okB2730 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2730 1 = true := by decide +kernel
theorem okB2731 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2731 1 = true := by decide +kernel
theorem okB2732 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2732 1 = true := by decide +kernel
theorem okG256 : glueChkR lits W 2724 9 = true := by decide +kernel
theorem okM256 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 1 = true := okB2724
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 2 = true := blkChk_join _ _ _ _ _ 2724 1 1 h0 okB2725
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 3 = true := blkChk_join _ _ _ _ _ 2724 2 1 h1 okB2726
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 4 = true := blkChk_join _ _ _ _ _ 2724 3 1 h2 okB2727
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 5 = true := blkChk_join _ _ _ _ _ 2724 4 1 h3 okB2728
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 6 = true := blkChk_join _ _ _ _ _ 2724 5 1 h4 okB2729
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 7 = true := blkChk_join _ _ _ _ _ 2724 6 1 h5 okB2730
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 8 = true := blkChk_join _ _ _ _ _ 2724 7 1 h6 okB2731
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2724 9 = true := blkChk_join _ _ _ _ _ 2724 8 1 h7 okB2732
  exact h8
end E1.C384X
