module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4797 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 1 = true := by decide +kernel
theorem okB4798 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4798 1 = true := by decide +kernel
theorem okB4799 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4799 1 = true := by decide +kernel
theorem okB4800 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4800 1 = true := by decide +kernel
theorem okB4801 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4801 1 = true := by decide +kernel
theorem okB4802 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4802 1 = true := by decide +kernel
theorem okB4803 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4803 1 = true := by decide +kernel
theorem okB4804 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4804 1 = true := by decide +kernel
theorem okB4805 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4805 1 = true := by decide +kernel
theorem okB4806 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4806 1 = true := by decide +kernel
theorem okG460 : glueChkR lits W 4797 10 = true := by decide +kernel
theorem okM460 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 1 = true := okB4797
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 2 = true := blkChk_join _ _ _ _ _ 4797 1 1 h0 okB4798
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 3 = true := blkChk_join _ _ _ _ _ 4797 2 1 h1 okB4799
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 4 = true := blkChk_join _ _ _ _ _ 4797 3 1 h2 okB4800
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 5 = true := blkChk_join _ _ _ _ _ 4797 4 1 h3 okB4801
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 6 = true := blkChk_join _ _ _ _ _ 4797 5 1 h4 okB4802
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 7 = true := blkChk_join _ _ _ _ _ 4797 6 1 h5 okB4803
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 8 = true := blkChk_join _ _ _ _ _ 4797 7 1 h6 okB4804
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 9 = true := blkChk_join _ _ _ _ _ 4797 8 1 h7 okB4805
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4797 10 = true := blkChk_join _ _ _ _ _ 4797 9 1 h8 okB4806
  exact h9
end E1.C384X
