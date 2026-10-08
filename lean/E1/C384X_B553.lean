module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5745 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 1 = true := by decide +kernel
theorem okB5746 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5746 1 = true := by decide +kernel
theorem okB5747 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5747 1 = true := by decide +kernel
theorem okB5748 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5748 1 = true := by decide +kernel
theorem okB5749 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5749 1 = true := by decide +kernel
theorem okB5750 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5750 1 = true := by decide +kernel
theorem okB5751 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5751 1 = true := by decide +kernel
theorem okB5752 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5752 1 = true := by decide +kernel
theorem okB5753 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5753 1 = true := by decide +kernel
theorem okG553 : glueChkR lits W 5745 9 = true := by decide +kernel
theorem okM553 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 9 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 1 = true := okB5745
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 2 = true := blkChk_join _ _ _ _ _ 5745 1 1 h0 okB5746
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 3 = true := blkChk_join _ _ _ _ _ 5745 2 1 h1 okB5747
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 4 = true := blkChk_join _ _ _ _ _ 5745 3 1 h2 okB5748
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 5 = true := blkChk_join _ _ _ _ _ 5745 4 1 h3 okB5749
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 6 = true := blkChk_join _ _ _ _ _ 5745 5 1 h4 okB5750
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 7 = true := blkChk_join _ _ _ _ _ 5745 6 1 h5 okB5751
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 8 = true := blkChk_join _ _ _ _ _ 5745 7 1 h6 okB5752
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5745 9 = true := blkChk_join _ _ _ _ _ 5745 8 1 h7 okB5753
  exact h8
end E1.C384X
