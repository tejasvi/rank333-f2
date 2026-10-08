module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1830 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 1 = true := by decide +kernel
theorem okB1831 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1831 1 = true := by decide +kernel
theorem okB1832 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1832 1 = true := by decide +kernel
theorem okB1833 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1833 1 = true := by decide +kernel
theorem okB1834 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1834 1 = true := by decide +kernel
theorem okB1835 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1835 1 = true := by decide +kernel
theorem okB1836 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1836 1 = true := by decide +kernel
theorem okB1837 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1837 1 = true := by decide +kernel
theorem okG171 : glueChkR lits W 1830 8 = true := by decide +kernel
theorem okM171 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 8 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 1 = true := okB1830
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 2 = true := blkChk_join _ _ _ _ _ 1830 1 1 h0 okB1831
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 3 = true := blkChk_join _ _ _ _ _ 1830 2 1 h1 okB1832
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 4 = true := blkChk_join _ _ _ _ _ 1830 3 1 h2 okB1833
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 5 = true := blkChk_join _ _ _ _ _ 1830 4 1 h3 okB1834
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 6 = true := blkChk_join _ _ _ _ _ 1830 5 1 h4 okB1835
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 7 = true := blkChk_join _ _ _ _ _ 1830 6 1 h5 okB1836
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1830 8 = true := blkChk_join _ _ _ _ _ 1830 7 1 h6 okB1837
  exact h7
end E1.C384X
