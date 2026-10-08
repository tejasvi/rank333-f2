module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5767 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 1 = true := by decide +kernel
theorem okB5768 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5768 1 = true := by decide +kernel
theorem okB5769 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5769 1 = true := by decide +kernel
theorem okB5770 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5770 1 = true := by decide +kernel
theorem okB5771 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5771 1 = true := by decide +kernel
theorem okB5772 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5772 1 = true := by decide +kernel
theorem okB5773 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5773 1 = true := by decide +kernel
theorem okB5774 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5774 1 = true := by decide +kernel
theorem okB5775 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5775 1 = true := by decide +kernel
theorem okB5776 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5776 1 = true := by decide +kernel
theorem okB5777 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5777 1 = true := by decide +kernel
theorem okG555 : glueChkR lits W 5767 11 = true := by decide +kernel
theorem okM555 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 11 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 1 = true := okB5767
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 2 = true := blkChk_join _ _ _ _ _ 5767 1 1 h0 okB5768
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 3 = true := blkChk_join _ _ _ _ _ 5767 2 1 h1 okB5769
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 4 = true := blkChk_join _ _ _ _ _ 5767 3 1 h2 okB5770
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 5 = true := blkChk_join _ _ _ _ _ 5767 4 1 h3 okB5771
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 6 = true := blkChk_join _ _ _ _ _ 5767 5 1 h4 okB5772
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 7 = true := blkChk_join _ _ _ _ _ 5767 6 1 h5 okB5773
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 8 = true := blkChk_join _ _ _ _ _ 5767 7 1 h6 okB5774
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 9 = true := blkChk_join _ _ _ _ _ 5767 8 1 h7 okB5775
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 10 = true := blkChk_join _ _ _ _ _ 5767 9 1 h8 okB5776
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5767 11 = true := blkChk_join _ _ _ _ _ 5767 10 1 h9 okB5777
  exact h10
end E1.C384X
