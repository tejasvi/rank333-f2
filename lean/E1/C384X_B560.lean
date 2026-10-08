module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB5821 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 1 = true := by decide +kernel
theorem okB5822 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5822 1 = true := by decide +kernel
theorem okB5823 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5823 1 = true := by decide +kernel
theorem okB5824 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5824 1 = true := by decide +kernel
theorem okB5825 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5825 1 = true := by decide +kernel
theorem okB5826 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5826 1 = true := by decide +kernel
theorem okB5827 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5827 1 = true := by decide +kernel
theorem okG560 : glueChkR lits W 5821 7 = true := by decide +kernel
theorem okM560 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 7 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 1 = true := okB5821
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 2 = true := blkChk_join _ _ _ _ _ 5821 1 1 h0 okB5822
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 3 = true := blkChk_join _ _ _ _ _ 5821 2 1 h1 okB5823
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 4 = true := blkChk_join _ _ _ _ _ 5821 3 1 h2 okB5824
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 5 = true := blkChk_join _ _ _ _ _ 5821 4 1 h3 okB5825
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 6 = true := blkChk_join _ _ _ _ _ 5821 5 1 h4 okB5826
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 5821 7 = true := blkChk_join _ _ _ _ _ 5821 6 1 h5 okB5827
  exact h6
end E1.C384X
