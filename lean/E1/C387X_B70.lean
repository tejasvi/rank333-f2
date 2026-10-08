module
public import R22Port.U_d41d8cd98f00
public import E1.C387X_W
@[expose] public section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace E1.C387X
open E1S
theorem okB764 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 1 = true := by decide +kernel
theorem okB765 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 765 1 = true := by decide +kernel
theorem okB766 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 766 1 = true := by decide +kernel
theorem okB767 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 767 1 = true := by decide +kernel
theorem okB768 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 768 1 = true := by decide +kernel
theorem okB769 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 769 1 = true := by decide +kernel
theorem okB770 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 770 1 = true := by decide +kernel
theorem okB771 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 771 1 = true := by decide +kernel
theorem okB772 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 772 1 = true := by decide +kernel
theorem okG70 : glueChkR lits W 764 9 = true := by decide +kernel
theorem okM70 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 9 = true := by
  have h0 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 1 = true := okB764
  have h1 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 2 = true := blkChk_join _ _ _ _ _ 764 1 1 h0 okB765
  have h2 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 3 = true := blkChk_join _ _ _ _ _ 764 2 1 h1 okB766
  have h3 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 4 = true := blkChk_join _ _ _ _ _ 764 3 1 h2 okB767
  have h4 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 5 = true := blkChk_join _ _ _ _ _ 764 4 1 h3 okB768
  have h5 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 6 = true := blkChk_join _ _ _ _ _ 764 5 1 h4 okB769
  have h6 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 7 = true := blkChk_join _ _ _ _ _ 764 6 1 h5 okB770
  have h7 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 8 = true := blkChk_join _ _ _ _ _ 764 7 1 h6 okB771
  have h8 : blkChk E1.IP_e387.C E1.SL_e387.entry E1.IP_e387.UB E1.IP_e387.UBR lits 764 9 = true := blkChk_join _ _ _ _ _ 764 8 1 h7 okB772
  exact h8
end E1.C387X
