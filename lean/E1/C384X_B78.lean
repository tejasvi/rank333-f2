module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB823 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 1 = true := by decide +kernel
theorem okB824 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 824 1 = true := by decide +kernel
theorem okB825 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 825 1 = true := by decide +kernel
theorem okB826 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 826 1 = true := by decide +kernel
theorem okB827 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 827 1 = true := by decide +kernel
theorem okB828 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 828 1 = true := by decide +kernel
theorem okB829 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 829 1 = true := by decide +kernel
theorem okB830 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 830 1 = true := by decide +kernel
theorem okB831 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 831 1 = true := by decide +kernel
theorem okB832 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 832 1 = true := by decide +kernel
theorem okG78 : glueChkR lits W 823 10 = true := by decide +kernel
theorem okM78 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 1 = true := okB823
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 2 = true := blkChk_join _ _ _ _ _ 823 1 1 h0 okB824
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 3 = true := blkChk_join _ _ _ _ _ 823 2 1 h1 okB825
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 4 = true := blkChk_join _ _ _ _ _ 823 3 1 h2 okB826
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 5 = true := blkChk_join _ _ _ _ _ 823 4 1 h3 okB827
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 6 = true := blkChk_join _ _ _ _ _ 823 5 1 h4 okB828
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 7 = true := blkChk_join _ _ _ _ _ 823 6 1 h5 okB829
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 8 = true := blkChk_join _ _ _ _ _ 823 7 1 h6 okB830
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 9 = true := blkChk_join _ _ _ _ _ 823 8 1 h7 okB831
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 823 10 = true := blkChk_join _ _ _ _ _ 823 9 1 h8 okB832
  exact h9
end E1.C384X
