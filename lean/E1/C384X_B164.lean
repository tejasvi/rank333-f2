module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1753 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 1 = true := by decide +kernel
theorem okB1754 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1754 1 = true := by decide +kernel
theorem okB1755 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1755 1 = true := by decide +kernel
theorem okB1756 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1756 1 = true := by decide +kernel
theorem okB1757 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1757 1 = true := by decide +kernel
theorem okB1758 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1758 1 = true := by decide +kernel
theorem okB1759 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1759 1 = true := by decide +kernel
theorem okB1760 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1760 1 = true := by decide +kernel
theorem okG164 : glueChkR lits W 1753 8 = true := by decide +kernel
theorem okM164 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 1 = true := okB1753
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 2 = true := blkChk_join _ _ _ _ _ 1753 1 1 h0 okB1754
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 3 = true := blkChk_join _ _ _ _ _ 1753 2 1 h1 okB1755
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 4 = true := blkChk_join _ _ _ _ _ 1753 3 1 h2 okB1756
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 5 = true := blkChk_join _ _ _ _ _ 1753 4 1 h3 okB1757
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 6 = true := blkChk_join _ _ _ _ _ 1753 5 1 h4 okB1758
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 7 = true := blkChk_join _ _ _ _ _ 1753 6 1 h5 okB1759
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1753 8 = true := blkChk_join _ _ _ _ _ 1753 7 1 h6 okB1760
  exact h7
end E1.C384X
