module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB1788 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 1 = true := by decide +kernel
theorem okB1789 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1789 1 = true := by decide +kernel
theorem okB1790 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1790 1 = true := by decide +kernel
theorem okB1791 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1791 1 = true := by decide +kernel
theorem okB1792 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1792 1 = true := by decide +kernel
theorem okB1793 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1793 1 = true := by decide +kernel
theorem okB1794 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1794 1 = true := by decide +kernel
theorem okB1795 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1795 1 = true := by decide +kernel
theorem okB1796 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1796 1 = true := by decide +kernel
theorem okB1797 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1797 1 = true := by decide +kernel
theorem okG167 : glueChkR lits W 1788 10 = true := by decide +kernel
theorem okM167 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 1 = true := okB1788
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 2 = true := blkChk_join _ _ _ _ _ 1788 1 1 h0 okB1789
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 3 = true := blkChk_join _ _ _ _ _ 1788 2 1 h1 okB1790
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 4 = true := blkChk_join _ _ _ _ _ 1788 3 1 h2 okB1791
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 5 = true := blkChk_join _ _ _ _ _ 1788 4 1 h3 okB1792
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 6 = true := blkChk_join _ _ _ _ _ 1788 5 1 h4 okB1793
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 7 = true := blkChk_join _ _ _ _ _ 1788 6 1 h5 okB1794
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 8 = true := blkChk_join _ _ _ _ _ 1788 7 1 h6 okB1795
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 9 = true := blkChk_join _ _ _ _ _ 1788 8 1 h7 okB1796
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 1788 10 = true := blkChk_join _ _ _ _ _ 1788 9 1 h8 okB1797
  exact h9
end E1.C384X
