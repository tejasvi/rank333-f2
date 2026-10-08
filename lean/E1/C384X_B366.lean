module
public import R22Port.U_d41d8cd98f00
public import E1.C384X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C384X
open E1S
theorem okB3813 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 1 = true := by decide +kernel
theorem okB3814 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3814 1 = true := by decide +kernel
theorem okB3815 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3815 1 = true := by decide +kernel
theorem okB3816 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3816 1 = true := by decide +kernel
theorem okB3817 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3817 1 = true := by decide +kernel
theorem okB3818 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3818 1 = true := by decide +kernel
theorem okB3819 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3819 1 = true := by decide +kernel
theorem okB3820 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3820 1 = true := by decide +kernel
theorem okB3821 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3821 1 = true := by decide +kernel
theorem okB3822 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3822 1 = true := by decide +kernel
theorem okG366 : glueChkR lits W 3813 10 = true := by decide +kernel
theorem okM366 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 10 = true := by
  have h0 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 1 = true := okB3813
  have h1 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 2 = true := blkChk_join _ _ _ _ _ 3813 1 1 h0 okB3814
  have h2 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 3 = true := blkChk_join _ _ _ _ _ 3813 2 1 h1 okB3815
  have h3 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 4 = true := blkChk_join _ _ _ _ _ 3813 3 1 h2 okB3816
  have h4 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 5 = true := blkChk_join _ _ _ _ _ 3813 4 1 h3 okB3817
  have h5 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 6 = true := blkChk_join _ _ _ _ _ 3813 5 1 h4 okB3818
  have h6 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 7 = true := blkChk_join _ _ _ _ _ 3813 6 1 h5 okB3819
  have h7 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 8 = true := blkChk_join _ _ _ _ _ 3813 7 1 h6 okB3820
  have h8 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 9 = true := blkChk_join _ _ _ _ _ 3813 8 1 h7 okB3821
  have h9 : blkChk E1.IP_e384.C E1.SL_e384.entry E1.IP_e384.UB E1.IP_e384.UBR lits 3813 10 = true := blkChk_join _ _ _ _ _ 3813 9 1 h8 okB3822
  exact h9
end E1.C384X
