module
public import R22Port.U_d41d8cd98f00
public import E1.C284X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C284X
open E1S
theorem okB1820 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1821 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1821 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1822 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1822 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1823 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1823 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1824 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1824 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1825 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1825 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1826 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1826 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1827 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1827 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okB1828 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1828 1 = true := by
  rw [← blkChkN_eq]; decide +kernel
theorem okG200 : glueChkR lits W 1820 9 = true := by
  rw [← glueChkRN_eq lits W 7747 1820 lenT]; decide +kernel
theorem okM200 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 9 = true := by
  have h0 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 1 = true := okB1820
  have h1 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 2 = true := blkChk_join _ _ _ _ _ 1820 1 1 h0 okB1821
  have h2 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 3 = true := blkChk_join _ _ _ _ _ 1820 2 1 h1 okB1822
  have h3 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 4 = true := blkChk_join _ _ _ _ _ 1820 3 1 h2 okB1823
  have h4 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 5 = true := blkChk_join _ _ _ _ _ 1820 4 1 h3 okB1824
  have h5 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 6 = true := blkChk_join _ _ _ _ _ 1820 5 1 h4 okB1825
  have h6 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 7 = true := blkChk_join _ _ _ _ _ 1820 6 1 h5 okB1826
  have h7 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 8 = true := blkChk_join _ _ _ _ _ 1820 7 1 h6 okB1827
  have h8 : blkChk E1.IP_e284.C E1.SL_e284.entry E1.IP_e284.UB E1.IP_e284.UBR lits 1820 9 = true := blkChk_join _ _ _ _ _ 1820 8 1 h7 okB1828
  exact h8
end E1.C284X
