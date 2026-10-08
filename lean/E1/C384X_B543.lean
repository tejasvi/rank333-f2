module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5654 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 1 = true := by decide +kernel
theorem okB5655 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5655 1 = true := by decide +kernel
theorem okB5656 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5656 1 = true := by decide +kernel
theorem okB5657 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5657 1 = true := by decide +kernel
theorem okB5658 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5658 1 = true := by decide +kernel
theorem okB5659 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5659 1 = true := by decide +kernel
theorem okB5660 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5660 1 = true := by decide +kernel
theorem okB5661 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5661 1 = true := by decide +kernel
theorem okG543 : glueChkR lits W 5654 8 = true := by decide +kernel
theorem okM543 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 1 = true := okB5654
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 2 = true := blkChk_join _ _ _ _ _ 5654 1 1 h0 okB5655
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 3 = true := blkChk_join _ _ _ _ _ 5654 2 1 h1 okB5656
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 4 = true := blkChk_join _ _ _ _ _ 5654 3 1 h2 okB5657
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 5 = true := blkChk_join _ _ _ _ _ 5654 4 1 h3 okB5658
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 6 = true := blkChk_join _ _ _ _ _ 5654 5 1 h4 okB5659
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 7 = true := blkChk_join _ _ _ _ _ 5654 6 1 h5 okB5660
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5654 8 = true := blkChk_join _ _ _ _ _ 5654 7 1 h6 okB5661
  exact h7
end E1.C384X
