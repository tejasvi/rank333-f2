module
public import R22Port.U_d41d8cd98f00
public import E1.C213X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C213X
open E1S
theorem okB3826 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 1 = true := by decide +kernel
theorem okB3827 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3827 1 = true := by decide +kernel
theorem okB3828 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3828 1 = true := by decide +kernel
theorem okB3829 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3829 1 = true := by decide +kernel
theorem okB3830 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3830 1 = true := by decide +kernel
theorem okB3831 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3831 1 = true := by decide +kernel
theorem okB3832 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3832 1 = true := by decide +kernel
theorem okB3833 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3833 1 = true := by decide +kernel
theorem okB3834 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3834 1 = true := by decide +kernel
theorem okB3835 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3835 1 = true := by decide +kernel
theorem okG365 : glueChkR lits W 3826 10 = true := by decide +kernel
theorem okM365 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 10 = true := by
  have h0 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 1 = true := okB3826
  have h1 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 2 = true := blkChk_join _ _ _ _ _ 3826 1 1 h0 okB3827
  have h2 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 3 = true := blkChk_join _ _ _ _ _ 3826 2 1 h1 okB3828
  have h3 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 4 = true := blkChk_join _ _ _ _ _ 3826 3 1 h2 okB3829
  have h4 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 5 = true := blkChk_join _ _ _ _ _ 3826 4 1 h3 okB3830
  have h5 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 6 = true := blkChk_join _ _ _ _ _ 3826 5 1 h4 okB3831
  have h6 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 7 = true := blkChk_join _ _ _ _ _ 3826 6 1 h5 okB3832
  have h7 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 8 = true := blkChk_join _ _ _ _ _ 3826 7 1 h6 okB3833
  have h8 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 9 = true := blkChk_join _ _ _ _ _ 3826 8 1 h7 okB3834
  have h9 : blkChk E1.IP_e213.C E1.SL_e213.entry E1.IP_e213.UB E1.IP_e213.UBR lits 3826 10 = true := blkChk_join _ _ _ _ _ 3826 9 1 h8 okB3835
  exact h9
end E1.C213X
