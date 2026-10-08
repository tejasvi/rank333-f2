module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5645 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 1 = true := by decide +kernel
theorem okB5646 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5646 1 = true := by decide +kernel
theorem okB5647 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5647 1 = true := by decide +kernel
theorem okB5648 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5648 1 = true := by decide +kernel
theorem okB5649 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5649 1 = true := by decide +kernel
theorem okB5650 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5650 1 = true := by decide +kernel
theorem okB5651 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5651 1 = true := by decide +kernel
theorem okB5652 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5652 1 = true := by decide +kernel
theorem okB5653 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5653 1 = true := by decide +kernel
theorem okG542 : glueChkR lits W 5645 9 = true := by decide +kernel
theorem okM542 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 1 = true := okB5645
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 2 = true := blkChk_join _ _ _ _ _ 5645 1 1 h0 okB5646
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 3 = true := blkChk_join _ _ _ _ _ 5645 2 1 h1 okB5647
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 4 = true := blkChk_join _ _ _ _ _ 5645 3 1 h2 okB5648
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 5 = true := blkChk_join _ _ _ _ _ 5645 4 1 h3 okB5649
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 6 = true := blkChk_join _ _ _ _ _ 5645 5 1 h4 okB5650
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 7 = true := blkChk_join _ _ _ _ _ 5645 6 1 h5 okB5651
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 8 = true := blkChk_join _ _ _ _ _ 5645 7 1 h6 okB5652
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5645 9 = true := blkChk_join _ _ _ _ _ 5645 8 1 h7 okB5653
  exact h8
end E1.C384X
