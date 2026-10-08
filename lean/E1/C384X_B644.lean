module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6645 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 1 = true := by decide +kernel
theorem okB6646 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6646 1 = true := by decide +kernel
theorem okB6647 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6647 1 = true := by decide +kernel
theorem okB6648 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6648 1 = true := by decide +kernel
theorem okB6649 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6649 1 = true := by decide +kernel
theorem okB6650 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6650 1 = true := by decide +kernel
theorem okB6651 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6651 1 = true := by decide +kernel
theorem okB6652 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6652 1 = true := by decide +kernel
theorem okG644 : glueChkR lits W 6645 8 = true := by decide +kernel
theorem okM644 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 1 = true := okB6645
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 2 = true := blkChk_join _ _ _ _ _ 6645 1 1 h0 okB6646
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 3 = true := blkChk_join _ _ _ _ _ 6645 2 1 h1 okB6647
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 4 = true := blkChk_join _ _ _ _ _ 6645 3 1 h2 okB6648
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 5 = true := blkChk_join _ _ _ _ _ 6645 4 1 h3 okB6649
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 6 = true := blkChk_join _ _ _ _ _ 6645 5 1 h4 okB6650
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 7 = true := blkChk_join _ _ _ _ _ 6645 6 1 h5 okB6651
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6645 8 = true := blkChk_join _ _ _ _ _ 6645 7 1 h6 okB6652
  exact h7
end E1.C384X
