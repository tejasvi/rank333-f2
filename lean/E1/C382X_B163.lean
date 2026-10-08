module
public import R22Port.U_d41d8cd98f00
public import E1.C382X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C382X
open E1S
theorem okB1815 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 1 = true := by decide +kernel
theorem okB1816 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1816 1 = true := by decide +kernel
theorem okB1817 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1817 1 = true := by decide +kernel
theorem okB1818 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1818 1 = true := by decide +kernel
theorem okB1819 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1819 1 = true := by decide +kernel
theorem okB1820 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1820 1 = true := by decide +kernel
theorem okB1821 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1821 1 = true := by decide +kernel
theorem okB1822 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1822 1 = true := by decide +kernel
theorem okG163 : glueChkR lits W 1815 8 = true := by decide +kernel
theorem okM163 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 8 = true := by
  have h0 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 1 = true := okB1815
  have h1 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 2 = true := blkChk_join _ _ _ _ _ 1815 1 1 h0 okB1816
  have h2 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 3 = true := blkChk_join _ _ _ _ _ 1815 2 1 h1 okB1817
  have h3 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 4 = true := blkChk_join _ _ _ _ _ 1815 3 1 h2 okB1818
  have h4 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 5 = true := blkChk_join _ _ _ _ _ 1815 4 1 h3 okB1819
  have h5 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 6 = true := blkChk_join _ _ _ _ _ 1815 5 1 h4 okB1820
  have h6 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 7 = true := blkChk_join _ _ _ _ _ 1815 6 1 h5 okB1821
  have h7 : blkChk E1.IP_e382.C E1.SL_e382.entry E1.IP_e382.UB E1.IP_e382.UBR lits 1815 8 = true := blkChk_join _ _ _ _ _ 1815 7 1 h6 okB1822
  exact h7
end E1.C382X
