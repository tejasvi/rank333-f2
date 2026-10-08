module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB4823 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 1 = true := by decide +kernel
theorem okB4824 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4824 1 = true := by decide +kernel
theorem okB4825 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4825 1 = true := by decide +kernel
theorem okB4826 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4826 1 = true := by decide +kernel
theorem okB4827 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4827 1 = true := by decide +kernel
theorem okB4828 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4828 1 = true := by decide +kernel
theorem okB4829 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4829 1 = true := by decide +kernel
theorem okB4830 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4830 1 = true := by decide +kernel
theorem okB4831 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4831 1 = true := by decide +kernel
theorem okB4832 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4832 1 = true := by decide +kernel
theorem okG462 : glueChkR lits W 4823 10 = true := by decide +kernel
theorem okM462 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 1 = true := okB4823
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 2 = true := blkChk_join _ _ _ _ _ 4823 1 1 h0 okB4824
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 3 = true := blkChk_join _ _ _ _ _ 4823 2 1 h1 okB4825
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 4 = true := blkChk_join _ _ _ _ _ 4823 3 1 h2 okB4826
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 5 = true := blkChk_join _ _ _ _ _ 4823 4 1 h3 okB4827
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 6 = true := blkChk_join _ _ _ _ _ 4823 5 1 h4 okB4828
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 7 = true := blkChk_join _ _ _ _ _ 4823 6 1 h5 okB4829
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 8 = true := blkChk_join _ _ _ _ _ 4823 7 1 h6 okB4830
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 9 = true := blkChk_join _ _ _ _ _ 4823 8 1 h7 okB4831
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 4823 10 = true := blkChk_join _ _ _ _ _ 4823 9 1 h8 okB4832
  exact h9
end E1.C384X
