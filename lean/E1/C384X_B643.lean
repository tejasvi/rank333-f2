module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB6637 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 1 = true := by decide +kernel
theorem okB6638 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6638 1 = true := by decide +kernel
theorem okB6639 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6639 1 = true := by decide +kernel
theorem okB6640 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6640 1 = true := by decide +kernel
theorem okB6641 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6641 1 = true := by decide +kernel
theorem okB6642 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6642 1 = true := by decide +kernel
theorem okB6643 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6643 1 = true := by decide +kernel
theorem okB6644 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6644 1 = true := by decide +kernel
theorem okG643 : glueChkR lits W 6637 8 = true := by decide +kernel
theorem okM643 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 1 = true := okB6637
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 2 = true := blkChk_join _ _ _ _ _ 6637 1 1 h0 okB6638
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 3 = true := blkChk_join _ _ _ _ _ 6637 2 1 h1 okB6639
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 4 = true := blkChk_join _ _ _ _ _ 6637 3 1 h2 okB6640
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 5 = true := blkChk_join _ _ _ _ _ 6637 4 1 h3 okB6641
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 6 = true := blkChk_join _ _ _ _ _ 6637 5 1 h4 okB6642
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 7 = true := blkChk_join _ _ _ _ _ 6637 6 1 h5 okB6643
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 6637 8 = true := blkChk_join _ _ _ _ _ 6637 7 1 h6 okB6644
  exact h7
end E1.C384X
