module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3748 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 1 = true := by decide +kernel
theorem okB3749 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3749 1 = true := by decide +kernel
theorem okB3750 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3750 1 = true := by decide +kernel
theorem okB3751 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3751 1 = true := by decide +kernel
theorem okB3752 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3752 1 = true := by decide +kernel
theorem okB3753 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3753 1 = true := by decide +kernel
theorem okB3754 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3754 1 = true := by decide +kernel
theorem okB3755 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3755 1 = true := by decide +kernel
theorem okB3756 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3756 1 = true := by decide +kernel
theorem okB3757 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3757 1 = true := by decide +kernel
theorem okB3758 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3758 1 = true := by decide +kernel
theorem okB3759 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3759 1 = true := by decide +kernel
theorem okG360 : glueChkR lits W 3748 12 = true := by decide +kernel
theorem okM360 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 12 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 1 = true := okB3748
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 2 = true := blkChk_join _ _ _ _ _ 3748 1 1 h0 okB3749
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 3 = true := blkChk_join _ _ _ _ _ 3748 2 1 h1 okB3750
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 4 = true := blkChk_join _ _ _ _ _ 3748 3 1 h2 okB3751
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 5 = true := blkChk_join _ _ _ _ _ 3748 4 1 h3 okB3752
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 6 = true := blkChk_join _ _ _ _ _ 3748 5 1 h4 okB3753
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 7 = true := blkChk_join _ _ _ _ _ 3748 6 1 h5 okB3754
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 8 = true := blkChk_join _ _ _ _ _ 3748 7 1 h6 okB3755
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 9 = true := blkChk_join _ _ _ _ _ 3748 8 1 h7 okB3756
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 10 = true := blkChk_join _ _ _ _ _ 3748 9 1 h8 okB3757
  have h10 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 11 = true := blkChk_join _ _ _ _ _ 3748 10 1 h9 okB3758
  have h11 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3748 12 = true := blkChk_join _ _ _ _ _ 3748 11 1 h10 okB3759
  exact h11
end E1.C384X
