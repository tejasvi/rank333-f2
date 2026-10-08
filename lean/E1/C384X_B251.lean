module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB2675 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 1 = true := by decide +kernel
theorem okB2676 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2676 1 = true := by decide +kernel
theorem okB2677 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2677 1 = true := by decide +kernel
theorem okB2678 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2678 1 = true := by decide +kernel
theorem okB2679 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2679 1 = true := by decide +kernel
theorem okB2680 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2680 1 = true := by decide +kernel
theorem okB2681 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2681 1 = true := by decide +kernel
theorem okB2682 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2682 1 = true := by decide +kernel
theorem okB2683 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2683 1 = true := by decide +kernel
theorem okB2684 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2684 1 = true := by decide +kernel
theorem okB2685 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2685 1 = true := by decide +kernel
theorem okB2686 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2686 1 = true := by decide +kernel
theorem okG251 : glueChkR lits W 2675 12 = true := by decide +kernel
theorem okM251 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 1 = true := okB2675
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 2 = true := blkChk_join _ _ _ _ _ 2675 1 1 h0 okB2676
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 3 = true := blkChk_join _ _ _ _ _ 2675 2 1 h1 okB2677
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 4 = true := blkChk_join _ _ _ _ _ 2675 3 1 h2 okB2678
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 5 = true := blkChk_join _ _ _ _ _ 2675 4 1 h3 okB2679
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 6 = true := blkChk_join _ _ _ _ _ 2675 5 1 h4 okB2680
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 7 = true := blkChk_join _ _ _ _ _ 2675 6 1 h5 okB2681
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 8 = true := blkChk_join _ _ _ _ _ 2675 7 1 h6 okB2682
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 9 = true := blkChk_join _ _ _ _ _ 2675 8 1 h7 okB2683
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 10 = true := blkChk_join _ _ _ _ _ 2675 9 1 h8 okB2684
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 11 = true := blkChk_join _ _ _ _ _ 2675 10 1 h9 okB2685
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 2675 12 = true := blkChk_join _ _ _ _ _ 2675 11 1 h10 okB2686
  exact h11
end E1.C384X
